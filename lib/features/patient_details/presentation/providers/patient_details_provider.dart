import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/domain/entities/patient_details.dart';
import 'package:foresight_care/domain/usecases/get_patient_details_usecase.dart';
import 'package:foresight_care/domain/repositories/patient_details_repository.dart';

// Patient Details State
class PatientDetailsState {
  final PatientDetails? patientDetails;
  final List<PatientAppointment> appointments;
  final List<PatientConsultation> consultations;
  final bool isLoadingDetails;
  final bool isLoadingAppointments;
  final bool isLoadingConsultations;
  final String? detailsError;
  final String? appointmentsError;
  final String? consultationsError;

  const PatientDetailsState({
    this.patientDetails,
    this.appointments = const [],
    this.consultations = const [],
    this.isLoadingDetails = false,
    this.isLoadingAppointments = false,
    this.isLoadingConsultations = false,
    this.detailsError,
    this.appointmentsError,
    this.consultationsError,
  });

  PatientDetailsState copyWith({
    PatientDetails? patientDetails,
    List<PatientAppointment>? appointments,
    List<PatientConsultation>? consultations,
    bool? isLoadingDetails,
    bool? isLoadingAppointments,
    bool? isLoadingConsultations,
    String? detailsError,
    String? appointmentsError,
    String? consultationsError,
    bool clearDetailsError = false,
    bool clearAppointmentsError = false,
    bool clearConsultationsError = false,
  }) {
    return PatientDetailsState(
      patientDetails: patientDetails ?? this.patientDetails,
      appointments: appointments ?? this.appointments,
      consultations: consultations ?? this.consultations,
      isLoadingDetails: isLoadingDetails ?? this.isLoadingDetails,
      isLoadingAppointments: isLoadingAppointments ?? this.isLoadingAppointments,
      isLoadingConsultations: isLoadingConsultations ?? this.isLoadingConsultations,
      detailsError: clearDetailsError ? null : (detailsError ?? this.detailsError),
      appointmentsError: clearAppointmentsError ? null : (appointmentsError ?? this.appointmentsError),
      consultationsError: clearConsultationsError ? null : (consultationsError ?? this.consultationsError),
    );
  }
}

// 👽 FINAL ALIEN-PROOF Patient Details Provider
class PatientDetailsNotifier extends StateNotifier<PatientDetailsState> {
  final GetPatientDetailsUseCase _getPatientDetailsUseCase;
  final PatientDetailsRepository _repository;

  PatientDetailsNotifier(
    this._getPatientDetailsUseCase,
    this._repository,
  ) : super(const PatientDetailsState());

  // 🚀 ULTIMATE Load all patient data with smooth transitions
  Future<void> loadAllPatientData(String patientId) async {
    debugPrint('🚀 [FINAL-ALIEN] Loading ALL patient data for ID: $patientId');
    
    // Start with clean state - load everything concurrently
    state = const PatientDetailsState(
      isLoadingDetails: true,
      isLoadingAppointments: true,
      isLoadingConsultations: true,
    );

    // Load all three data types concurrently but handle errors independently
    await Future.wait([
      _loadPatientDetailsInternal(patientId),
      _loadPatientAppointmentsInternal(patientId),
      _loadPatientConsultationsInternal(patientId),
    ]);

    debugPrint('✨ [FINAL-ALIEN] ALL patient data loading completed successfully!');
  }

  // 🔄 Load patient details with alien-proof error handling
  Future<void> loadPatientDetails(String patientId) async {
    await _loadPatientDetailsInternal(patientId);
  }

  Future<void> _loadPatientDetailsInternal(String patientId) async {
    try {
      debugPrint('📋 [FINAL-ALIEN] Loading patient details...');
      
      state = state.copyWith(
        isLoadingDetails: true,
        clearDetailsError: true,
      );

      final result = await _getPatientDetailsUseCase.call(patientId);
      
      if (mounted) {
        state = state.copyWith(
          patientDetails: result,
          isLoadingDetails: false,
          clearDetailsError: true,
        );
        debugPrint('✅ [FINAL-ALIEN] Patient details loaded: ${result.fullName}');
      }
    } catch (e) {
      debugPrint('❌ [FINAL-ALIEN] Error loading patient details: $e');
      
      if (mounted) {
        state = state.copyWith(
          isLoadingDetails: false,
          detailsError: _formatErrorMessage(e),
        );
      }
    }
  }

  // 📅 Load patient appointments with alien-proof handling
  Future<void> loadPatientAppointments(String patientId) async {
    await _loadPatientAppointmentsInternal(patientId);
  }

  Future<void> _loadPatientAppointmentsInternal(String patientId) async {
    try {
      debugPrint('📅 [FINAL-ALIEN] Loading patient appointments...');
      
      state = state.copyWith(
        isLoadingAppointments: true,
        clearAppointmentsError: true,
      );

      final result = await _repository.getPatientAppointments(patientId);
      
      if (mounted) {
        // Sort appointments by date (newest first)
        final sortedAppointments = List<PatientAppointment>.from(result);
        sortedAppointments.sort((a, b) => b.date.compareTo(a.date));
        
        state = state.copyWith(
          appointments: sortedAppointments,
          isLoadingAppointments: false,
          clearAppointmentsError: true,
        );
        debugPrint('✅ [FINAL-ALIEN] Appointments loaded: ${result.length} items');
      }
    } catch (e) {
      debugPrint('❌ [FINAL-ALIEN] Error loading appointments: $e');
      
      if (mounted) {
        state = state.copyWith(
          isLoadingAppointments: false,
          appointmentsError: _formatErrorMessage(e),
        );
      }
    }
  }

  // 🩺 Load patient consultations with alien-proof handling
  Future<void> loadPatientConsultations(String patientId) async {
    await _loadPatientConsultationsInternal(patientId);
  }

  Future<void> _loadPatientConsultationsInternal(String patientId) async {
    try {
      debugPrint('🩺 [FINAL-ALIEN] Loading patient consultations...');
      
      state = state.copyWith(
        isLoadingConsultations: true,
        clearConsultationsError: true,
      );

      final result = await _repository.getPatientConsultations(patientId);
      
      if (mounted) {
        // Sort consultations by date (newest first)
        final sortedConsultations = List<PatientConsultation>.from(result);
        sortedConsultations.sort((a, b) => b.dateHeure.compareTo(a.dateHeure));
        
        state = state.copyWith(
          consultations: sortedConsultations,
          isLoadingConsultations: false,
          clearConsultationsError: true,
        );
        debugPrint('✅ [FINAL-ALIEN] Consultations loaded: ${result.length} items');
      }
    } catch (e) {
      debugPrint('❌ [FINAL-ALIEN] Error loading consultations: $e');
      
      if (mounted) {
        state = state.copyWith(
          isLoadingConsultations: false,
          consultationsError: _formatErrorMessage(e),
        );
      }
    }
  }

  // 🧹 Clear all data
  void clearData() {
    state = const PatientDetailsState();
    debugPrint('🧹 [FINAL-ALIEN] All data cleared');
  }

  // 👽 FINAL ALIEN-PROOF error message formatting
  String _formatErrorMessage(dynamic error) {
    final errorString = error.toString();
    
    if (errorString.contains('Data format error')) {
      return 'Erreur de format des données. Veuillez contacter le support technique.';
    }
    
    if (errorString.contains('Network')) {
      return 'Erreur de connexion. Vérifiez votre connexion internet.';
    }
    
    if (errorString.contains('401') || errorString.contains('Unauthorized')) {
      return 'Session expirée. Veuillez vous reconnecter.';
    }
    
    if (errorString.contains('404') || errorString.contains('Not Found')) {
      return 'Patient non trouvé.';
    }
    
    if (errorString.contains('500') || errorString.contains('Internal Server')) {
      return 'Erreur serveur. Veuillez réessayer plus tard.';
    }
    
    return 'Une erreur inattendue s\'est produite. Veuillez réessayer.';
  }
}

// FINAL ALIEN-PROOF Providers
final patientDetailsProvider =
    StateNotifierProvider<PatientDetailsNotifier, PatientDetailsState>((ref) {
  return PatientDetailsNotifier(
    getIt<GetPatientDetailsUseCase>(),
    getIt<PatientDetailsRepository>(),
  );
});

// Enhanced computed providers for smooth UI updates
final patientDetailsLoadingProvider = Provider<bool>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.isLoadingDetails || state.isLoadingAppointments || state.isLoadingConsultations;
});

final patientAppointmentsCountProvider = Provider<int>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.appointments.length;
});

final patientConsultationsCountProvider = Provider<int>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.consultations.length;
});

final hasAnyErrorProvider = Provider<bool>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.detailsError != null || 
         state.appointmentsError != null || 
         state.consultationsError != null;
});

final patientDataLoadedProvider = Provider<bool>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.patientDetails != null &&
         !state.isLoadingDetails &&
         !state.isLoadingAppointments &&
         !state.isLoadingConsultations;
});

// Additional helpful providers
final hasAppointmentsProvider = Provider<bool>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.appointments.isNotEmpty;
});

final hasConsultationsProvider = Provider<bool>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.consultations.isNotEmpty;
});

final isAnyDataLoadingProvider = Provider<bool>((ref) {
  final state = ref.watch(patientDetailsProvider);
  return state.isLoadingDetails || state.isLoadingAppointments || state.isLoadingConsultations;
}); 