import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/appointment.dart';
import 'package:flutter/foundation.dart';

// Appointments State
class AppointmentsState {
  final List<Appointment> appointments;
  final List<Appointment> filteredAppointments;
  final bool isLoading;
  final String? error;
  final String searchQuery;

  const AppointmentsState({
    this.appointments = const [],
    this.filteredAppointments = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
  });

  AppointmentsState copyWith({
    List<Appointment>? appointments,
    List<Appointment>? filteredAppointments,
    bool? isLoading,
    String? error,
    String? searchQuery,
  }) {
    return AppointmentsState(
      appointments: appointments ?? this.appointments,
      filteredAppointments: filteredAppointments ?? this.filteredAppointments,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// Appointments Provider
class AppointmentsNotifier extends StateNotifier<AppointmentsState> {
  final api.ApiClient _apiClient;

  AppointmentsNotifier(this._apiClient) : super(const AppointmentsState()) {
    // Add a small delay before fetching to ensure everything is initialized
    Future.delayed(const Duration(milliseconds: 100), () {
      fetchAppointments();
    });
  }

  Future<void> fetchAppointments() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      print('[APPOINTMENTS] Starting to fetch appointments...');
      final appointments = await _apiClient.getAppointments();
      print('[APPOINTMENTS] Successfully received ${appointments.length} appointments');
      
      // Try to process each appointment individually to catch specific parsing issues
      final processedAppointments = <Appointment>[];
      for (int i = 0; i < appointments.length; i++) {
        try {
          print('[APPOINTMENTS] Processing appointment ${i + 1}: ${appointments[i].id}');
          processedAppointments.add(appointments[i]);
        } catch (e, stackTrace) {
          print('[APPOINTMENTS] Error processing appointment ${i + 1}: $e');
          print('[APPOINTMENTS] Stack trace: $stackTrace');
        }
      }
      
      print('[APPOINTMENTS] Successfully processed ${processedAppointments.length} appointments');
      
      state = state.copyWith(
        appointments: processedAppointments,
        filteredAppointments: _filterAppointments(processedAppointments, state.searchQuery),
        isLoading: false,
      );
      
      print('[APPOINTMENTS] State updated successfully');
    } catch (e, stackTrace) {
      print('[APPOINTMENTS] Error in fetchAppointments: $e');
      print('[APPOINTMENTS] Stack trace: $stackTrace');
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load appointments: ${e.toString()}',
      );
    }
  }

  void searchAppointments(String query) {
    state = state.copyWith(
      searchQuery: query,
      filteredAppointments: _filterAppointments(state.appointments, query),
    );
  }

  List<Appointment> _filterAppointments(List<Appointment> appointments, String query) {
    if (query.isEmpty) {
      return appointments;
    }

    return appointments.where((appointment) {
      final patientName = '${appointment.patient.prenPatient} ${appointment.patient.nomPatient}'.toLowerCase();
      final doctorName = '${appointment.doctor.prenom} ${appointment.doctor.nom}'.toLowerCase();
      final date = appointment.date.toLowerCase();
      final searchQuery = query.toLowerCase();
      
      return patientName.contains(searchQuery) ||
             doctorName.contains(searchQuery) ||
             date.contains(searchQuery);
    }).toList();
  }

  Future<void> createAppointment(CreateAppointmentRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      // Convert domain request to API request format using backend-specific JSON
      final apiRequestData = request.toBackendJson();
      final apiRequest = api.CreateAppointmentApiRequest(
        idMed: apiRequestData['id_med'],
        idNumDossier: apiRequestData['id_num_dossier'],
        date: apiRequestData['date'],
        heure: apiRequestData['heure'],
        status: apiRequestData['status'],
      );
      
      // Create appointment and get response with string IDs
      final createResponse = await _apiClient.createAppointment(apiRequest);
      
      // ALIEN FIX: Backend returns string IDs instead of full objects
      // We need to fetch the full appointment data to get proper objects
      if (createResponse.id != null) {
        // Fetch the newly created appointment to get full doctor/patient objects
        final fullAppointment = await _apiClient.getAppointmentById(createResponse.id!);
        
        final updatedAppointments = [...state.appointments, fullAppointment];
        state = state.copyWith(
          appointments: updatedAppointments,
          filteredAppointments: _filterAppointments(updatedAppointments, state.searchQuery),
          isLoading: false,
        );
      } else {
        // Fallback: refresh all appointments if we don't get an ID
        await fetchAppointments();
      }
    } catch (e) {
      debugPrint('[ALIEN_DEBUG] 🛸 Create appointment error: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to create appointment: ${e.toString()}',
      );
      rethrow;
    }
  }

  Future<void> updateAppointmentStatus(String appointmentId, AppointmentStatus newStatus) async {
    try {
      await _apiClient.updateAppointmentStatus(
        appointmentId,
        {'status': newStatus.toBackendString()},
      );
      
      // Update local state
      final updatedAppointments = state.appointments.map((appointment) {
        if (appointment.id == appointmentId) {
          return appointment.copyWith(status: newStatus);
        }
        return appointment;
      }).toList();
      
      state = state.copyWith(
        appointments: updatedAppointments,
        filteredAppointments: _filterAppointments(updatedAppointments, state.searchQuery),
      );
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to update appointment status: ${e.toString()}',
      );
      rethrow;
    }
  }

  Future<void> updateAppointment(String appointmentId, UpdateAppointmentRequest request) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      
      // Convert domain request to API request format
      final apiRequest = api.UpdateAppointmentApiRequest(
        idMed: request.idMed,
        idNumDossier: request.idNumDossier,
        date: request.date,
        heure: request.heure,
        status: request.status?.toBackendString(),
      );
      
      // Update appointment via API
      await _apiClient.updateAppointment(appointmentId, apiRequest);
      
      // Fetch the updated appointment to get full object with nested data
      final updatedAppointment = await _apiClient.getAppointmentById(appointmentId);
      
      // Update local state
      final updatedAppointments = state.appointments.map((appointment) {
        if (appointment.id == appointmentId) {
          return updatedAppointment;
        }
        return appointment;
      }).toList();
      
      state = state.copyWith(
        appointments: updatedAppointments,
        filteredAppointments: _filterAppointments(updatedAppointments, state.searchQuery),
        isLoading: false,
      );
    } catch (e) {
      debugPrint('[APPOINTMENTS_PROVIDER] Update appointment error: $e');
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update appointment: ${e.toString()}',
      );
      rethrow;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Provider
final appointmentsProvider = StateNotifierProvider<AppointmentsNotifier, AppointmentsState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return AppointmentsNotifier(apiClient);
});

// Helper providers
final filteredAppointmentsProvider = Provider<List<Appointment>>((ref) {
  return ref.watch(appointmentsProvider).filteredAppointments;
});

final appointmentsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(appointmentsProvider).isLoading;
});

final appointmentsErrorProvider = Provider<String?>((ref) {
  return ref.watch(appointmentsProvider).error;
}); 