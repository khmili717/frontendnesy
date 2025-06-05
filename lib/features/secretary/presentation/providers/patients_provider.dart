import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

// Patients State
class PatientsState {
  final List<Patient> patients;
  final List<Patient> filteredPatients;
  final bool isLoading;
  final String? error;
  final String searchQuery;
  final DateTime? lastFetched;

  const PatientsState({
    this.patients = const [],
    this.filteredPatients = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
    this.lastFetched,
  });

  PatientsState copyWith({
    List<Patient>? patients,
    List<Patient>? filteredPatients,
    bool? isLoading,
    String? error,
    String? searchQuery,
    DateTime? lastFetched,
  }) {
    return PatientsState(
      patients: patients ?? this.patients,
      filteredPatients: filteredPatients ?? this.filteredPatients,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
      lastFetched: lastFetched ?? this.lastFetched,
    );
  }

  bool get shouldRefresh {
    if (lastFetched == null) return true;
    final difference = DateTime.now().difference(lastFetched!);
    return difference.inMinutes > 5; // Refresh after 5 minutes
  }
}

// Patients Provider
class PatientsNotifier extends StateNotifier<PatientsState> {
  final api.ApiClient _apiClient;
  static const String _cacheKey = 'cached_patients';

  PatientsNotifier(this._apiClient) : super(const PatientsState()) {
    _initializePatients();
  }

  Future<void> _initializePatients() async {
    try {
      // Try to load from cache first
      await _loadFromCache();
      
      // Then fetch fresh data if needed
      if (state.shouldRefresh) {
        await fetchPatients();
      }
    } catch (e) {
      debugPrint('[PATIENTS_PROVIDER] Error initializing: $e');
      // If cache loading fails, try fetching from API
      await fetchPatients();
    }
  }

  Future<void> fetchPatients() async {
    debugPrint('[PATIENTS] =================================');
    debugPrint('[PATIENTS] Starting fetchPatients...');
    debugPrint('[PATIENTS] Current state: isLoading=${state.isLoading}, error=${state.error}');
    debugPrint('[PATIENTS] =================================');
    
    state = state.copyWith(isLoading: true, error: null);

    try {
      debugPrint('[PATIENTS] Making API call to getPatients()...');
      final stopwatch = Stopwatch()..start();
      
      final patients = await _apiClient.getPatients();
      
      stopwatch.stop();
      debugPrint('[PATIENTS] ✅ API call completed in ${stopwatch.elapsedMilliseconds}ms');
      debugPrint('[PATIENTS] Raw response: ${patients.length} patients received');
      
      // Debug first few patients
      if (patients.isNotEmpty) {
        debugPrint('[PATIENTS] First patient sample:');
        final firstPatient = patients.first;
        debugPrint('[PATIENTS] - ID: ${firstPatient.id}');
        debugPrint('[PATIENTS] - Name: ${firstPatient.prenPatient} ${firstPatient.nomPatient}');
        debugPrint('[PATIENTS] - Phone: ${firstPatient.telephone}');
        debugPrint('[PATIENTS] - CIN: ${firstPatient.cinCnam}');
        debugPrint('[PATIENTS] - Pending deletion: ${firstPatient.pendingDeletion}');
      }
      
      // Filter out patients with deletion requests
      debugPrint('[PATIENTS] Filtering patients...');
      final activePatients = patients.where((patient) {
        final isActive = patient.pendingDeletion != true;
        if (!isActive) {
          debugPrint('[PATIENTS] Filtering out patient: ${patient.prenPatient} ${patient.nomPatient} (pending deletion)');
        }
        return isActive;
      }).toList();
      
      debugPrint('[PATIENTS] After filtering: ${activePatients.length} active patients');
      
      // Process each patient individually for safety
      debugPrint('[PATIENTS] Processing patients individually...');
      final processedPatients = <Patient>[];
      final failedPatients = <String>[];
      
      for (int i = 0; i < activePatients.length; i++) {
        try {
          final patient = activePatients[i];
          
          // Debug patient fields
          if (i < 5) { // Debug first 5 patients
            debugPrint('[PATIENTS] Processing patient ${i + 1}/${activePatients.length}:');
            debugPrint('[PATIENTS] - nomPatient: "${patient.nomPatient}" (${patient.nomPatient.length} chars)');
            debugPrint('[PATIENTS] - prenPatient: "${patient.prenPatient}" (${patient.prenPatient.length} chars)');
            debugPrint('[PATIENTS] - Valid: ${patient.nomPatient.isNotEmpty && patient.prenPatient.isNotEmpty}');
          }
          
          // Basic validation
          if (patient.nomPatient.isNotEmpty && patient.prenPatient.isNotEmpty) {
            processedPatients.add(patient);
          } else {
            final patientInfo = 'Patient ${patient.id}: nom="${patient.nomPatient}", prenom="${patient.prenPatient}"';
            failedPatients.add(patientInfo);
            debugPrint('[PATIENTS] ❌ Skipping invalid patient at index $i: $patientInfo');
          }
        } catch (e, stackTrace) {
          final errorInfo = 'Patient ${i + 1}: $e';
          failedPatients.add(errorInfo);
          debugPrint('[PATIENTS] ❌ Error processing patient ${i + 1}: $e');
          if (i < 3) { // Show stack trace for first few errors
            debugPrint('[PATIENTS] Stack trace: $stackTrace');
          }
        }
      }
      
      debugPrint('[PATIENTS] =================================');
      debugPrint('[PATIENTS] PROCESSING SUMMARY:');
      debugPrint('[PATIENTS] - Total received: ${patients.length}');
      debugPrint('[PATIENTS] - Active (not deleted): ${activePatients.length}');
      debugPrint('[PATIENTS] - Successfully processed: ${processedPatients.length}');
      debugPrint('[PATIENTS] - Failed to process: ${failedPatients.length}');
      if (failedPatients.isNotEmpty) {
        debugPrint('[PATIENTS] Failed patients:');
        failedPatients.take(10).forEach((error) => debugPrint('[PATIENTS]   - $error'));
        if (failedPatients.length > 10) {
          debugPrint('[PATIENTS]   ... and ${failedPatients.length - 10} more');
        }
      }
      debugPrint('[PATIENTS] =================================');
      
      if (processedPatients.isEmpty && patients.isNotEmpty) {
        // Instead of throwing an exception, let's pass through the patients anyway
        debugPrint('[PATIENTS] ⚠️ Some patients may have incomplete data, but displaying anyway');
        
        state = state.copyWith(
          patients: patients, // Use original patients instead of processed ones
          filteredPatients: _filterPatients(patients, state.searchQuery),
          isLoading: false,
          error: 'Certains patients ont des données incomplètes', // Warning instead of error
          lastFetched: DateTime.now(),
        );
        
        await _saveToCache(patients);
        
        debugPrint('[PATIENTS] ✅ Displayed ${patients.length} patients with data quality warning');
      } else {
        state = state.copyWith(
          patients: processedPatients,
          filteredPatients: _filterPatients(processedPatients, state.searchQuery),
          isLoading: false,
          lastFetched: DateTime.now(),
        );
        
        // Cache the results
        await _saveToCache(processedPatients);
        
        debugPrint('[PATIENTS] ✅ State updated successfully with ${processedPatients.length} patients');
        debugPrint('[PATIENTS] ✅ Filtered patients: ${state.filteredPatients.length}');
      }
      
    } catch (e, stackTrace) {
      debugPrint('[PATIENTS] =================================');
      debugPrint('[PATIENTS] ❌ CRITICAL ERROR in fetchPatients:');
      debugPrint('[PATIENTS] Error: $e');
      debugPrint('[PATIENTS] Type: ${e.runtimeType}');
      debugPrint('[PATIENTS] Stack trace: $stackTrace');
      debugPrint('[PATIENTS] =================================');
      
      String errorMessage = _getDetailedErrorMessage(e);
      
      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
    }
  }

  String _getDetailedErrorMessage(dynamic error) {
    final errorStr = error.toString().toLowerCase();
    
    if (errorStr.contains('socketexception') || errorStr.contains('network')) {
      return 'Erreur de connexion réseau. Vérifiez votre connexion internet et réessayez.';
    } else if (errorStr.contains('timeoutexception') || errorStr.contains('timeout')) {
      return 'Délai d\'attente dépassé. Le serveur met trop de temps à répondre.';
    } else if (errorStr.contains('404') || errorStr.contains('not found')) {
      return 'Service patients non trouvé (404). Vérifiez l\'URL de l\'API.';
    } else if (errorStr.contains('500') || errorStr.contains('internal server error')) {
      return 'Erreur serveur interne (500). Contactez l\'administrateur.';
    } else if (errorStr.contains('401') || errorStr.contains('unauthorized')) {
      return 'Accès non autorisé (401). Vérifiez vos identifiants.';
    } else if (errorStr.contains('403') || errorStr.contains('forbidden')) {
      return 'Accès interdit (403). Permissions insuffisantes.';
    } else if (errorStr.contains('json') || errorStr.contains('format')) {
      return 'Erreur de format de données. Problème de décodage JSON.';
    } else if (errorStr.contains('aucun patient valide')) {
      return error.toString(); // Keep our custom message
    } else {
      return 'Erreur de chargement: ${error.toString()}';
    }
  }

  void searchPatients(String query) {
    state = state.copyWith(
      searchQuery: query,
      filteredPatients: _filterPatients(state.patients, query),
    );
  }

  List<Patient> _filterPatients(List<Patient> patients, String query) {
    if (query.isEmpty) {
      return patients;
    }

    final searchLower = query.toLowerCase();
    
    return patients.where((patient) {
      try {
        final fullName = '${patient.prenPatient} ${patient.nomPatient}'.toLowerCase();
        final reverseName = '${patient.nomPatient} ${patient.prenPatient}'.toLowerCase();
        final numDossier = patient.numDossier?.toLowerCase() ?? '';
        final phone = patient.telephone?.toString() ?? '';
        final cinCnam = patient.cinCnam?.toString() ?? '';
        
        return fullName.contains(searchLower) ||
               reverseName.contains(searchLower) ||
               numDossier.contains(searchLower) ||
               phone.contains(searchLower) ||
               cinCnam.contains(searchLower);
      } catch (e) {
        debugPrint('[PATIENTS] Error filtering patient: $e');
        return false;
      }
    }).toList();
  }

  Future<void> createPatient(CreatePatientRequest request) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      debugPrint('[PATIENTS] Creating new patient...');
      
      // Convert domain request to API request format using backend-specific JSON
      final apiRequest = api.CreatePatientRequest(request.toBackendJson());
      final newPatient = await _apiClient.createPatient(apiRequest);
      
      final updatedPatients = [...state.patients, newPatient];
      state = state.copyWith(
        patients: updatedPatients,
        filteredPatients: _filterPatients(updatedPatients, state.searchQuery),
        isLoading: false,
        lastFetched: DateTime.now(),
      );
      
      // Update cache
      await _saveToCache(updatedPatients);
      
      debugPrint('[PATIENTS] Patient created successfully: ${newPatient.prenPatient} ${newPatient.nomPatient}');
    } catch (e, stackTrace) {
      debugPrint('[PATIENTS] Error creating patient: $e');
      debugPrint('[PATIENTS] Stack trace: $stackTrace');
      
      String errorMessage = 'Échec de la création du patient';
      
      if (e.toString().contains('409')) {
        errorMessage = 'Un patient avec ces informations existe déjà.';
      } else if (e.toString().contains('400')) {
        errorMessage = 'Données patient invalides. Vérifiez les informations saisies.';
      }
      
      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );
      rethrow;
    }
  }

  Future<Patient> getPatientById(String id) async {
    try {
      // Check cache first
      final cachedPatient = state.patients.where((p) => p.id == id).firstOrNull;
      if (cachedPatient != null) {
        return cachedPatient;
      }
      
      // Fetch from API if not in cache
      debugPrint('[PATIENTS] Fetching patient by ID: $id');
      return await _apiClient.getPatientById(id);
    } catch (e, stackTrace) {
      debugPrint('[PATIENTS] Error getting patient by ID: $e');
      debugPrint('[PATIENTS] Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<void> updatePatient(String id, UpdatePatientRequest request) async {
    try {
      debugPrint('[PATIENTS] Updating patient: $id');
      
      // Convert domain request to API request format using backend-specific JSON
      final apiRequest = api.UpdatePatientRequest(request.toBackendJson());
      final updatedPatient = await _apiClient.updatePatient(id, apiRequest);
      
      final updatedPatients = state.patients.map((patient) {
        return patient.id == id ? updatedPatient : patient;
      }).toList();
      
      state = state.copyWith(
        patients: updatedPatients,
        filteredPatients: _filterPatients(updatedPatients, state.searchQuery),
        lastFetched: DateTime.now(),
      );
      
      // Update cache
      await _saveToCache(updatedPatients);
      
      debugPrint('[PATIENTS] Patient updated successfully');
    } catch (e, stackTrace) {
      debugPrint('[PATIENTS] Error updating patient: $e');
      debugPrint('[PATIENTS] Stack trace: $stackTrace');
      
      state = state.copyWith(
        error: 'Échec de la mise à jour du patient: ${e.toString()}',
      );
      rethrow;
    }
  }

  Future<void> requestPatientDeletion(String id, String reason) async {
    try {
      debugPrint('[PATIENTS] Requesting patient deletion: $id');
      
      // Use API client request type
      final apiRequest = api.RequestPatientDeletionRequest(reason: reason);
      await _apiClient.requestPatientDeletion(id, apiRequest);
      
      // Remove from local state (will be filtered out on next fetch)
      final updatedPatients = state.patients.where((p) => p.id != id).toList();
      
      state = state.copyWith(
        patients: updatedPatients,
        filteredPatients: _filterPatients(updatedPatients, state.searchQuery),
        lastFetched: DateTime.now(),
      );
      
      // Update cache
      await _saveToCache(updatedPatients);
      
      debugPrint('[PATIENTS] Patient deletion requested successfully');
    } catch (e, stackTrace) {
      debugPrint('[PATIENTS] Error requesting patient deletion: $e');
      debugPrint('[PATIENTS] Stack trace: $stackTrace');
      
      state = state.copyWith(
        error: 'Échec de la demande de suppression: ${e.toString()}',
      );
      rethrow;
    }
  }

  Future<void> _saveToCache(List<Patient> patients) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Convert patients to a simple format for caching
      final patientsSimple = patients.map((p) => {
        'id': p.id,
        'nomPatient': p.nomPatient,
        'prenPatient': p.prenPatient,
        'cinCnam': p.cinCnam,
        'telephone': p.telephone,
        'pendingDeletion': p.pendingDeletion,
      }).toList();
      await prefs.setString(_cacheKey, jsonEncode(patientsSimple));
      await prefs.setInt('${_cacheKey}_timestamp', DateTime.now().millisecondsSinceEpoch);
      debugPrint('[PATIENTS] Cached ${patients.length} patients (simplified)');
    } catch (e) {
      debugPrint('[PATIENTS] Error saving to cache: $e');
    }
  }

  Future<void> _loadFromCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString(_cacheKey);
      final timestamp = prefs.getInt('${_cacheKey}_timestamp');
      
      if (cachedData != null && timestamp != null) {
        final cacheAge = DateTime.now().millisecondsSinceEpoch - timestamp;
        
        // Use cache if less than 10 minutes old
        if (cacheAge < 600000) {
          debugPrint('[PATIENTS] Cache available but using fresh data for better reliability');
          // Skip cache loading to always get fresh data with proper parsing
        }
      }
    } catch (e) {
      debugPrint('[PATIENTS] Error loading from cache: $e');
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cacheKey);
      await prefs.remove('${_cacheKey}_timestamp');
      debugPrint('[PATIENTS] Cache cleared');
    } catch (e) {
      debugPrint('[PATIENTS] Error clearing cache: $e');
    }
  }
}

// Provider
final patientsProvider = StateNotifierProvider<PatientsNotifier, PatientsState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return PatientsNotifier(apiClient);
});

// Helper providers
final filteredPatientsProvider = Provider<List<Patient>>((ref) {
  return ref.watch(patientsProvider).filteredPatients;
});

final patientsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(patientsProvider).isLoading;
});

final patientsErrorProvider = Provider<String?>((ref) {
  return ref.watch(patientsProvider).error;
});

final patientsCountProvider = Provider<int>((ref) {
  return ref.watch(patientsProvider).patients.length;
});

final filteredPatientsCountProvider = Provider<int>((ref) {
  return ref.watch(patientsProvider).filteredPatients.length;
}); 