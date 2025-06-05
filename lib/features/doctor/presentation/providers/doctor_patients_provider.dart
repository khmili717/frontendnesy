import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/patient.dart';

// Doctor Patients State
class DoctorPatientsState {
  final List<Patient> patients;
  final List<Patient> filteredPatients;
  final bool isLoading;
  final String? error;
  final String searchQuery;
  final String selectedFilter; // Filter by gender, age range, etc.

  const DoctorPatientsState({
    this.patients = const [],
    this.filteredPatients = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
    this.selectedFilter = 'all',
  });

  DoctorPatientsState copyWith({
    List<Patient>? patients,
    List<Patient>? filteredPatients,
    bool? isLoading,
    String? error,
    String? searchQuery,
    String? selectedFilter,
  }) {
    return DoctorPatientsState(
      patients: patients ?? this.patients,
      filteredPatients: filteredPatients ?? this.filteredPatients,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}

// Doctor Patients Provider
class DoctorPatientsNotifier extends StateNotifier<DoctorPatientsState> {
  final api.ApiClient _apiClient;

  DoctorPatientsNotifier(this._apiClient) : super(const DoctorPatientsState()) {
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    debugPrint('[DOCTOR_PATIENTS] 🛸 ALIEN PATIENT FETCHING INITIATED...');
    state = state.copyWith(isLoading: true, error: null);

    try {
      final patients = await _apiClient.getPatients();
      debugPrint('[DOCTOR_PATIENTS] Received ${patients.length} patients');

      // 🛸 ALIEN FILTERING PROTOCOL: Multi-layer patient validation
      final alienFilteredPatients = patients.where((patient) {
        // 🛸 Layer 1: Filter out patients with deletion requests
        if (patient.pendingDeletion == true) {
          debugPrint('[DOCTOR_PATIENTS] 🛸 ALIEN FILTERED: Pending deletion - ${patient.prenPatient} ${patient.nomPatient}');
          return false;
        }

        // 🛸 Layer 2: ALIEN NAME VALIDATION - Filter out patients without proper names
        final hasValidFirstName = patient.prenPatient.trim().isNotEmpty;
        final hasValidLastName = patient.nomPatient.trim().isNotEmpty;
        
        if (!hasValidFirstName || !hasValidLastName) {
          debugPrint('[DOCTOR_PATIENTS] 🛸 ALIEN FILTERED: Invalid names - prenPatient:"${patient.prenPatient}" nomPatient:"${patient.nomPatient}" (ID: ${patient.id})');
          return false;
        }

        // 🛸 Layer 3: ALIEN QUALITY CHECK - Filter out placeholder names
        final firstName = patient.prenPatient.trim().toLowerCase();
        final lastName = patient.nomPatient.trim().toLowerCase();
        
        final isPlaceholder = firstName == 'prénom' || 
                             lastName == 'nom' || 
                             firstName == 'patient' || 
                             lastName == 'test' ||
                             firstName == 'unknown' || 
                             lastName == 'unknown';
        
        if (isPlaceholder) {
          debugPrint('[DOCTOR_PATIENTS] 🛸 ALIEN FILTERED: Placeholder names - ${patient.prenPatient} ${patient.nomPatient}');
          return false;
        }

        debugPrint('[DOCTOR_PATIENTS] 🛸 ALIEN VALIDATED: ✅ ${patient.prenPatient} ${patient.nomPatient}');
        return true;
      }).toList();

      debugPrint('[DOCTOR_PATIENTS] 🛸 ALIEN FILTERING COMPLETE: ${alienFilteredPatients.length}/${patients.length} patients passed validation');

      state = state.copyWith(
        patients: alienFilteredPatients,
        filteredPatients: _applyFilters(alienFilteredPatients, state.searchQuery, state.selectedFilter),
        isLoading: false,
      );

      debugPrint('[DOCTOR_PATIENTS] ✅ State updated successfully with ${alienFilteredPatients.length} valid patients');
    } catch (e) {
      debugPrint('[DOCTOR_PATIENTS] ❌ Error fetching patients: $e');
      String errorMessage = 'Erreur lors du chargement des patients';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expirée. Veuillez vous reconnecter.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Accès non autorisé.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion. Vérifiez votre connexion internet.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
    }
  }

  void searchPatients(String query) {
    debugPrint('[DOCTOR_PATIENTS] Searching with query: "$query"');
    state = state.copyWith(
      searchQuery: query,
      filteredPatients: _applyFilters(state.patients, query, state.selectedFilter),
    );
  }

  void filterPatients(String filter) {
    debugPrint('[DOCTOR_PATIENTS] Applying filter: $filter');
    state = state.copyWith(
      selectedFilter: filter,
      filteredPatients: _applyFilters(state.patients, state.searchQuery, filter),
    );
  }

  List<Patient> _applyFilters(List<Patient> patients, String searchQuery, String filter) {
    var filtered = patients;

    // Apply text search
    if (searchQuery.isNotEmpty) {
      final lowerQuery = searchQuery.toLowerCase();
      filtered = filtered.where((patient) {
        return patient.nomPatient.toLowerCase().contains(lowerQuery) ||
               patient.prenPatient.toLowerCase().contains(lowerQuery) ||
               patient.cinCnam?.toString().contains(lowerQuery) == true ||
               patient.numDossier?.toLowerCase().contains(lowerQuery) == true;
      }).toList();
    }

    // Apply category filter
    switch (filter.toLowerCase()) {
      case 'men':
      case 'homme':
        filtered = filtered.where((p) => p.sexe == PatientGender.masculin).toList();
        break;
      case 'women':
      case 'femme':
        filtered = filtered.where((p) => p.sexe == PatientGender.feminin).toList();
        break;
      case 'young':
      case 'jeune':
        filtered = filtered.where((p) => 
          p.ageInt == AgeRange.age18to29 || p.ageInt == AgeRange.age30to39).toList();
        break;
      case 'senior':
        filtered = filtered.where((p) => 
          p.ageInt == AgeRange.age50to59 || p.ageInt == AgeRange.age60Plus).toList();
        break;
      case 'all':
      default:
        // No additional filter
        break;
    }

    return filtered;
  }

  Future<void> refreshPatients() async {
    await fetchPatients();
  }
}

// Provider instance
final doctorPatientsProvider = StateNotifierProvider<DoctorPatientsNotifier, DoctorPatientsState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return DoctorPatientsNotifier(apiClient);
});

// Helper providers
final doctorPatientsCountProvider = Provider<int>((ref) {
  return ref.watch(doctorPatientsProvider).filteredPatients.length;
});

final doctorPatientsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(doctorPatientsProvider).isLoading;
});

final doctorPatientsErrorProvider = Provider<String?>((ref) {
  return ref.watch(doctorPatientsProvider).error;
}); 