import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/domain/entities/appointment.dart';

// State classes
class PatientDetailsState {
  final Patient? patient;
  final List<Appointment> appointments;
  final bool isLoading;
  final String? error;

  const PatientDetailsState({
    this.patient,
    this.appointments = const [],
    this.isLoading = false,
    this.error,
  });

  PatientDetailsState copyWith({
    Patient? patient,
    List<Appointment>? appointments,
    bool? isLoading,
    String? error,
  }) {
    return PatientDetailsState(
      patient: patient ?? this.patient,
      appointments: appointments ?? this.appointments,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

// Provider
class PatientDetailsNotifier extends StateNotifier<PatientDetailsState> {
  final ApiClient _apiClient;

  PatientDetailsNotifier(this._apiClient) : super(const PatientDetailsState());

  Future<void> loadPatientDetails(String patientId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      print('[PATIENT_DETAILS] 🛸 ALIEN LOADING: patient ID: $patientId');
      
      // ALIEN STRATEGY: Load patient and appointments separately with graceful fallback
      Patient? patient;
      List<Appointment> appointments = [];
      
      // 1. Try to load patient details (with graceful failure)
      try {
        patient = await _loadPatientById(patientId);
        print('[PATIENT_DETAILS] ✅ Loaded patient: ${patient?.prenPatient} ${patient?.nomPatient}');
      } catch (patientError) {
        print('[PATIENT_DETAILS] ⚠️ Patient not found in backend: $patientError');
        // Continue without failing - use the passed patient data as fallback
        patient = null;
      }
      
      // 2. Try to load appointments (independent of patient details)
      try {
        appointments = await _loadPatientAppointments(patientId);
        print('[PATIENT_DETAILS] ✅ Loaded ${appointments.length} appointments');
      } catch (appointmentError) {
        print('[PATIENT_DETAILS] ⚠️ Appointments failed to load: $appointmentError');
        // Continue with empty appointments list
        appointments = [];
      }
      
      // 3. Success - even if patient is null, we can still show the screen
      state = state.copyWith(
        patient: patient, // This might be null - screen will use fallback
        appointments: appointments,
        isLoading: false,
      );
      
      // Log the final result
      if (patient == null) {
        print('[PATIENT_DETAILS] 🔄 Using fallback patient data (backend patient not found)');
      }
      
    } catch (e) {
      print('[PATIENT_DETAILS] ❌ Critical error: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Erreur lors du chargement: $e',
      );
    }
  }

  Future<Patient?> _loadPatientById(String patientId) async {
    try {
      return await _apiClient.getPatientById(patientId);
    } catch (e) {
      print('[PATIENT_DETAILS] Error loading patient by ID: $e');
      throw e;
    }
  }

  Future<List<Appointment>> _loadPatientAppointments(String patientId) async {
    try {
      // ALIEN STRATEGY: Use fallback method first since it has consistent data structure
      // The direct endpoint /rendez-vous/patient/{id} returns inconsistent data (id_num_dossier as string instead of object)
      print('[PATIENT_DETAILS] 🛸 Using proven fallback method for consistent data...');
      
      final allAppointments = await _apiClient.getAppointments();
      
      // Filter appointments for this patient
      final patientAppointments = allAppointments.where((appointment) {
        // Check if appointment is for this patient by patient ID
        return appointment.patient.id == patientId;
      }).toList();
      
      print('[PATIENT_DETAILS] ✅ Filtered ${patientAppointments.length} appointments for patient $patientId');
      return patientAppointments;
      
    } catch (e) {
      print('[PATIENT_DETAILS] ❌ Error loading patient appointments: $e');
      // Return empty list if appointments fail to load
      return [];
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Provider instances
final patientDetailsProvider = StateNotifierProvider<PatientDetailsNotifier, PatientDetailsState>((ref) {
  final apiClient = getIt<ApiClient>();
  return PatientDetailsNotifier(apiClient);
}); 