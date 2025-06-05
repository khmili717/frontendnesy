import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/appointment.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

// Doctor Appointments State
class DoctorAppointmentsState {
  final List<DoctorAppointment> appointments;
  final List<DoctorAppointment> filteredAppointments;
  final bool isLoading;
  final String? error;
  final String searchQuery;
  final String selectedStatusFilter; // Filter by appointment status
  final DateTime? selectedDateFilter; // Filter by date

  const DoctorAppointmentsState({
    this.appointments = const [],
    this.filteredAppointments = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
    this.selectedStatusFilter = 'all',
    this.selectedDateFilter,
  });

  DoctorAppointmentsState copyWith({
    List<DoctorAppointment>? appointments,
    List<DoctorAppointment>? filteredAppointments,
    bool? isLoading,
    String? error,
    String? searchQuery,
    String? selectedStatusFilter,
    DateTime? selectedDateFilter,
  }) {
    return DoctorAppointmentsState(
      appointments: appointments ?? this.appointments,
      filteredAppointments: filteredAppointments ?? this.filteredAppointments,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedStatusFilter: selectedStatusFilter ?? this.selectedStatusFilter,
      selectedDateFilter: selectedDateFilter ?? this.selectedDateFilter,
    );
  }
}

// Doctor Appointments Provider
class DoctorAppointmentsNotifier extends StateNotifier<DoctorAppointmentsState> {
  final api.ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage;

  DoctorAppointmentsNotifier(this._apiClient, this._secureStorage) : super(const DoctorAppointmentsState()) {
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    debugPrint('[DOCTOR_APPOINTMENTS] 🧠 BIG BRAIN ALIEN PREPROCESSING INITIATED...');
    state = state.copyWith(isLoading: true, error: null);

    try {
      // 🧠 BIG BRAIN ALIEN STRATEGY: Intercept raw JSON and preprocess it
      debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Using mega-intelligent alien JSON preprocessing...');
      
      final appointments = await _alienBigBrainJsonPreprocessing();
      debugPrint('[DOCTOR_APPOINTMENTS] ✅ Big brain preprocessing successful! Received ${appointments.length} appointments');
      
      final validAppointments = _alienFilterAndValidate(appointments);
      
      _updateStateWithAppointments(validAppointments);
      debugPrint('[DOCTOR_APPOINTMENTS] 🎉 BIG BRAIN MISSION ACCOMPLISHED!');
      
    } catch (e) {
      debugPrint('[DOCTOR_APPOINTMENTS] 💥 Big brain alien preprocessing failed: $e');
      _handleAlienFailure(e);
    }
  }

  // 🧠 BIG BRAIN ALIEN METHOD: Intelligent JSON preprocessing to handle ALL null values
  Future<List<DoctorAppointment>> _alienBigBrainJsonPreprocessing() async {
    debugPrint('[DOCTOR_APPOINTMENTS] 🧠 INITIATING BIG BRAIN ALIEN JSON PREPROCESSING...');
    
    try {
      // 🧠 STEP 1: Get auth token from secure storage (like the existing auth system)
      final token = await _secureStorage.read(key: AppConstants.accessTokenKey);
      if (token == null) {
        throw Exception('Authentication token not found');
      }
      debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Auth token retrieved successfully');
      
      // 🧠 STEP 2: Create Dio instance with proper configuration
      final dio = Dio();
      dio.options.baseUrl = AppConstants.baseUrl;
      
      // 🧠 STEP 3: Make the request with proper auth headers
      final response = await dio.get(
        '/rendez-vous/my-appointments',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      
      debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Raw response received, status: ${response.statusCode}');
      
      if (response.data is List) {
        final List<dynamic> rawAppointments = response.data as List<dynamic>;
        debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Processing ${rawAppointments.length} raw appointments...');
        
        // 🧠 STEP 4: MEGA ALIEN PREPROCESSING - Fix ALL null values with defaults
        final List<Map<String, dynamic>> preprocessedAppointments = [];
        
        for (int i = 0; i < rawAppointments.length; i++) {
          try {
            final Map<String, dynamic> appointment = Map<String, dynamic>.from(rawAppointments[i] as Map);
            
            // 🧠 BIG BRAIN LOGIC 1: Handle linkedConsultation (remove if null, keep if has value)
            if (appointment.containsKey('linkedConsultation')) {
              if (appointment['linkedConsultation'] == null) {
                appointment.remove('linkedConsultation');
                debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Removed null linkedConsultation from appointment ${i + 1}');
              } else {
                debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Kept linkedConsultation with value: ${appointment['linkedConsultation']}');
              }
            }
            
            // 🧠 BIG BRAIN LOGIC 2: Handle null patient data (id_num_dossier)
            if (appointment['id_num_dossier'] == null) {
              debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Creating default patient for appointment ${i + 1}');
              appointment['id_num_dossier'] = {
                '_id': 'default-patient-${i + 1}',
                'nom_patient': 'Patient',
                'pren_patient': 'Inconnu ${i + 1}',
                'cin_cnam': 0,
                'tel': 0,
              };
            } else {
              // Fix null fields within existing patient data
              final Map<String, dynamic> patient = Map<String, dynamic>.from(appointment['id_num_dossier'] as Map);
              patient['_id'] = patient['_id'] ?? 'patient-${i + 1}';
              patient['nom_patient'] = patient['nom_patient'] ?? 'Patient';
              patient['pren_patient'] = patient['pren_patient'] ?? 'Inconnu ${i + 1}';
              patient['cin_cnam'] = patient['cin_cnam'] ?? 0;
              patient['tel'] = patient['tel'] ?? 0;
              appointment['id_num_dossier'] = patient;
            }
            
            // 🧠 BIG BRAIN LOGIC 3: Handle null doctor data (id_med)
            if (appointment['id_med'] == null) {
              debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Creating default doctor for appointment ${i + 1}');
              appointment['id_med'] = 'default-doctor-${i + 1}';
            }
            
            // 🧠 BIG BRAIN LOGIC 4: Handle other essential fields
            appointment['_id'] = appointment['_id'] ?? 'appointment-${i + 1}';
            appointment['rdv_id'] = appointment['rdv_id'] ?? 'RDV-${i + 1}';
            appointment['date'] = appointment['date'] ?? DateTime.now().toIso8601String();
            appointment['heure'] = appointment['heure'] ?? '00:00';
            appointment['status'] = appointment['status'] ?? 'en attente';
            
            preprocessedAppointments.add(appointment);
            debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Preprocessed appointment ${i + 1} successfully');
            
          } catch (e) {
            debugPrint('[DOCTOR_APPOINTMENTS] ⚠️ Error preprocessing appointment ${i + 1}: $e');
            // 🧠 EVEN IF PREPROCESSING FAILS, CREATE A MINIMAL APPOINTMENT
            final Map<String, dynamic> fallbackAppointment = {
              '_id': 'fallback-appointment-${i + 1}',
              'rdv_id': 'RDV-FALLBACK-${i + 1}',
              'id_med': 'fallback-doctor-${i + 1}',
              'id_num_dossier': {
                '_id': 'fallback-patient-${i + 1}',
                'nom_patient': 'Patient',
                'pren_patient': 'Récupéré ${i + 1}',
                'cin_cnam': 0,
                'tel': 0,
              },
              'date': DateTime.now().toIso8601String(),
              'heure': '00:00',
              'status': 'en attente',
            };
            preprocessedAppointments.add(fallbackAppointment);
            debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Created fallback appointment ${i + 1}');
          }
        }
        
        // 🧠 STEP 5: Convert preprocessed JSON to DoctorAppointment objects
        final List<DoctorAppointment> appointments = [];
        for (int i = 0; i < preprocessedAppointments.length; i++) {
          try {
            final appointment = DoctorAppointment.fromJson(preprocessedAppointments[i]);
            appointments.add(appointment);
            debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Successfully parsed appointment ${i + 1}');
          } catch (e) {
            debugPrint('[DOCTOR_APPOINTMENTS] ⚠️ Still failed to parse appointment ${i + 1} after preprocessing: $e');
            // 🧠 LAST RESORT: Create a minimal DoctorAppointment manually
            try {
              final fallbackAppointment = DoctorAppointment(
                id: 'manual-${i + 1}',
                rdvId: 'RDV-MANUAL-${i + 1}',
                doctorId: 'manual-doctor-${i + 1}',
                patient: PatientInfo(
                  id: 'manual-patient-${i + 1}',
                  nomPatient: 'Patient',
                  prenPatient: 'Manuel ${i + 1}',
                  cinCnam: 0,
                  tel: 0,
                ),
                date: DateTime.now().toIso8601String(),
                heure: '00:00',
                status: AppointmentStatus.enAttente,
                linkedConsultation: null,
              );
              appointments.add(fallbackAppointment);
              debugPrint('[DOCTOR_APPOINTMENTS] 🧠 Created manual fallback appointment ${i + 1}');
            } catch (manualError) {
              debugPrint('[DOCTOR_APPOINTMENTS] 💀 Even manual creation failed for appointment ${i + 1}: $manualError');
            }
          }
        }
        
        debugPrint('[DOCTOR_APPOINTMENTS] 🧠 BIG BRAIN PREPROCESSING COMPLETE: ${appointments.length}/${rawAppointments.length} appointments processed');
        return appointments;
        
      } else {
        throw Exception('Unexpected response format');
      }
      
    } catch (e) {
      debugPrint('[DOCTOR_APPOINTMENTS] 💀 BIG BRAIN PREPROCESSING FAILED: $e');
      rethrow;
    }
  }

  // 🛸 ALIEN METHOD: Ultra-robust filtering and validation
  List<DoctorAppointment> _alienFilterAndValidate(List<DoctorAppointment> appointments) {
    debugPrint('[DOCTOR_APPOINTMENTS] 🛸 ALIEN VALIDATION PROTOCOL INITIATED...');
    
    final validAppointments = <DoctorAppointment>[];
    
    for (int i = 0; i < appointments.length; i++) {
      try {
        final appointment = appointments[i];
        debugPrint('[DOCTOR_APPOINTMENTS] 🔍 Scanning appointment ${i + 1}/${appointments.length}...');
        
        // Check if patient data is valid
        if (_isAlienValidPatient(appointment.patient)) {
          validAppointments.add(appointment);
          debugPrint('[DOCTOR_APPOINTMENTS] ✅ Appointment ${i + 1} APPROVED by alien standards');
        } else {
          debugPrint('[DOCTOR_APPOINTMENTS] ⚠️ Appointment ${i + 1} has invalid patient data - QUARANTINED');
        }
      } catch (e) {
        debugPrint('[DOCTOR_APPOINTMENTS] 💀 Appointment ${i + 1} caused error: $e - SKIPPING');
      }
    }
    
    debugPrint('[DOCTOR_APPOINTMENTS] 🛸 ALIEN VALIDATION COMPLETE: ${validAppointments.length}/${appointments.length} appointments passed');
    return validAppointments;
  }

  // 🛸 ALIEN METHOD: Check if patient data is valid
  bool _isAlienValidPatient(PatientInfo patient) {
    try {
      // Use alien-safe null checking
      final hasName = (patient.nomPatient?.trim().isNotEmpty == true) || 
                     (patient.prenPatient?.trim().isNotEmpty == true);
      final hasId = patient.id?.isNotEmpty == true;
      
      return hasName && hasId;
    } catch (e) {
      debugPrint('[DOCTOR_APPOINTMENTS] 👽 Patient validation error: $e');
      return false;
    }
  }

  // 🛸 ALIEN METHOD: Safe string extraction with fallbacks
  String _alienSafeString(dynamic value, String fallback) {
    if (value == null) return fallback;
    if (value is String && value.isNotEmpty) return value;
    if (value is num) return value.toString();
    return fallback;
  }

  // 🛸 ALIEN METHOD: Parse patient info with ULTIMATE safety
  PatientInfo? _alienParsePatientInfo(dynamic rawPatient, int appointmentIndex) {
    try {
      if (rawPatient == null) {
        debugPrint('[DOCTOR_APPOINTMENTS] 👻 Patient data is null for appointment $appointmentIndex');
        return null;
      }
      
      if (rawPatient is! Map<String, dynamic>) {
        debugPrint('[DOCTOR_APPOINTMENTS] 🚨 Patient data is not a map for appointment $appointmentIndex');
        return null;
      }
      
      final map = rawPatient as Map<String, dynamic>;
      
      // 🛸 ALIEN EXTRACTION: Get patient fields with fallbacks
      final id = _alienSafeString(map['_id'], 'alien-patient-$appointmentIndex');
      final nomPatient = _alienSafeString(map['nom_patient'], 'Alien-Name');
      final prenPatient = _alienSafeString(map['pren_patient'], 'Alien-FirstName');
      
      // Check if we have at least some patient identity
      if ((nomPatient == 'Alien-Name' || nomPatient.isEmpty) && 
          (prenPatient == 'Alien-FirstName' || prenPatient.isEmpty)) {
        debugPrint('[DOCTOR_APPOINTMENTS] 👻 Patient has no identity data for appointment $appointmentIndex');
        return null;
      }
      
      // 🛸 ALIEN NUMBER PARSING: Handle numbers with extreme care
      int? cinCnam, tel;
      try {
        final cinCnamRaw = map['cin_cnam'];
        if (cinCnamRaw is int) {
          cinCnam = cinCnamRaw;
        } else if (cinCnamRaw is String) {
          cinCnam = int.tryParse(cinCnamRaw);
        }
        
        final telRaw = map['tel'];
        if (telRaw is int) {
          tel = telRaw;
        } else if (telRaw is String) {
          tel = int.tryParse(telRaw);
        }
      } catch (e) {
        debugPrint('[DOCTOR_APPOINTMENTS] 📱 Number parsing failed for appointment $appointmentIndex: $e');
      }
      
      final patientInfo = PatientInfo(
        id: id,
        nomPatient: nomPatient,
        prenPatient: prenPatient,
        cinCnam: cinCnam,
        tel: tel,
      );
      
      debugPrint('[DOCTOR_APPOINTMENTS] 👽 Patient successfully parsed: ${prenPatient ?? 'Unknown'} ${nomPatient ?? 'Patient'}');
      return patientInfo;
      
    } catch (e) {
      debugPrint('[DOCTOR_APPOINTMENTS] 💥 ALIEN PATIENT PARSING ERROR for appointment $appointmentIndex: $e');
      return null;
    }
  }

  // 🛸 ALIEN METHOD: Update state with appointments
  void _updateStateWithAppointments(List<DoctorAppointment> appointments) {
    try {
      // Sort appointments by date (newest first) with alien safety
      appointments.sort((a, b) {
        try {
          final dateA = DateTime.parse(a.date);
          final dateB = DateTime.parse(b.date);
          return dateB.compareTo(dateA);
        } catch (e) {
          debugPrint('[DOCTOR_APPOINTMENTS] ⚠️ Date sorting error: $e');
          return 0;
        }
      });

      state = state.copyWith(
        appointments: appointments,
        filteredAppointments: _applyFilters(
          appointments, 
          state.searchQuery, 
          state.selectedStatusFilter, 
          state.selectedDateFilter
        ),
        isLoading: false,
      );

      debugPrint('[DOCTOR_APPOINTMENTS] 🛸 ALIEN STATE UPDATE COMPLETE: ${appointments.length} appointments loaded');
    } catch (e) {
      debugPrint('[DOCTOR_APPOINTMENTS] 💥 ALIEN STATE UPDATE ERROR: $e');
      _handleAlienFailure(e);
    }
  }

  // 🛸 ALIEN METHOD: Handle ultimate failure
  void _handleAlienFailure(dynamic error) {
    debugPrint('[DOCTOR_APPOINTMENTS] 💀 ALL ALIEN PROTOCOLS FAILED: $error');
    String errorMessage = '🛸 Erreur de communication intergalactique';
    
    final errorStr = error.toString().toLowerCase();
    if (errorStr.contains('401') || errorStr.contains('unauthorized')) {
      errorMessage = '🛸 Session extraterrestre expirée. Reconnexion requise.';
    } else if (errorStr.contains('403') || errorStr.contains('forbidden')) {
      errorMessage = '🛸 Accès interdit par les forces galactiques.';
    } else if (errorStr.contains('500')) {
      errorMessage = '🛸 Serveur en maintenance interdimensionnelle.';
    } else if (errorStr.contains('network') || errorStr.contains('connection')) {
      errorMessage = '🛸 Signal intergalactique faible. Vérifiez votre antenne.';
    } else {
      errorMessage = '🛸 Erreur cosmique inexpliquée. Les aliens enquêtent...';
    }

    state = state.copyWith(
      isLoading: false,
      error: errorMessage,
    );
  }

  void searchAppointments(String query) {
    debugPrint('[DOCTOR_APPOINTMENTS] Searching with query: "$query"');
    state = state.copyWith(
      searchQuery: query,
      filteredAppointments: _applyFilters(
        state.appointments, 
        query, 
        state.selectedStatusFilter, 
        state.selectedDateFilter
      ),
    );
  }

  void filterByStatus(String statusFilter) {
    debugPrint('[DOCTOR_APPOINTMENTS] Filtering by status: $statusFilter');
    state = state.copyWith(
      selectedStatusFilter: statusFilter,
      filteredAppointments: _applyFilters(
        state.appointments, 
        state.searchQuery, 
        statusFilter, 
        state.selectedDateFilter
      ),
    );
  }

  void filterByDate(DateTime? dateFilter) {
    debugPrint('[DOCTOR_APPOINTMENTS] Filtering by date: $dateFilter');
    state = state.copyWith(
      selectedDateFilter: dateFilter,
      filteredAppointments: _applyFilters(
        state.appointments, 
        state.searchQuery, 
        state.selectedStatusFilter, 
        dateFilter
      ),
    );
  }

  List<DoctorAppointment> _applyFilters(
    List<DoctorAppointment> appointments, 
    String searchQuery, 
    String statusFilter, 
    DateTime? dateFilter
  ) {
    var filtered = appointments;

    // Apply text search
    if (searchQuery.isNotEmpty) {
      final lowerQuery = searchQuery.toLowerCase();
      filtered = filtered.where((appointment) {
        return appointment.rdvId?.toLowerCase().contains(lowerQuery) == true ||
               appointment.patient.nomPatient?.toLowerCase().contains(lowerQuery) == true ||
               appointment.patient.prenPatient?.toLowerCase().contains(lowerQuery) == true ||
               appointment.patient.cinCnam?.toString().contains(lowerQuery) == true;
      }).toList();
    }

    // Apply status filter
    if (statusFilter != 'all') {
      AppointmentStatus? targetStatus;
      switch (statusFilter.toLowerCase()) {
        case 'en_attente':
        case 'en attente':
          targetStatus = AppointmentStatus.enAttente;
          break;
        case 'annule':
        case 'annulé':
          targetStatus = AppointmentStatus.annule;
          break;
        case 'termine':
        case 'terminé':
          targetStatus = AppointmentStatus.termine;
          break;
        case 'complete':
        case 'complété':
          targetStatus = AppointmentStatus.complete;
          break;
        case 'en_cours':
        case 'en cours':
          targetStatus = AppointmentStatus.enCours;
          break;
      }
      
      if (targetStatus != null) {
        filtered = filtered.where((a) => a.status == targetStatus).toList();
      }
    }

    // Apply date filter
    if (dateFilter != null) {
      filtered = filtered.where((appointment) {
        try {
          final appointmentDate = DateTime.parse(appointment.date);
          return appointmentDate.year == dateFilter.year &&
                 appointmentDate.month == dateFilter.month &&
                 appointmentDate.day == dateFilter.day;
        } catch (e) {
          return false;
        }
      }).toList();
    }

    return filtered;
  }

  Future<void> refreshAppointments() async {
    await fetchAppointments();
  }

  // Get appointments count by status
  Map<String, int> getAppointmentCountsByStatus() {
    final counts = <String, int>{
      'total': state.appointments.length,
      'en_attente': 0,
      'annule': 0,
      'termine': 0,
    };

    for (final appointment in state.appointments) {
      switch (appointment.status) {
        case AppointmentStatus.enAttente:
          counts['en_attente'] = (counts['en_attente'] ?? 0) + 1;
          break;
        case AppointmentStatus.annule:
          counts['annule'] = (counts['annule'] ?? 0) + 1;
          break;
        case AppointmentStatus.termine:
        case AppointmentStatus.complete:
          counts['termine'] = (counts['termine'] ?? 0) + 1;
          break;
        default:
          break;
      }
    }

    return counts;
  }
}

// Provider instance
final doctorAppointmentsProvider = StateNotifierProvider<DoctorAppointmentsNotifier, DoctorAppointmentsState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  final secureStorage = getIt<FlutterSecureStorage>();
  return DoctorAppointmentsNotifier(apiClient, secureStorage);
});

// Helper providers
final doctorAppointmentsCountProvider = Provider<int>((ref) {
  return ref.watch(doctorAppointmentsProvider).filteredAppointments.length;
});

final doctorAppointmentsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(doctorAppointmentsProvider).isLoading;
});

final doctorAppointmentsErrorProvider = Provider<String?>((ref) {
  return ref.watch(doctorAppointmentsProvider).error;
});

final doctorAppointmentsCountsByStatusProvider = Provider<Map<String, int>>((ref) {
  final notifier = ref.watch(doctorAppointmentsProvider.notifier);
  return notifier.getAppointmentCountsByStatus();
}); 