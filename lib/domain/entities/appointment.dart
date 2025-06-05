import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

enum AppointmentStatus {
  @JsonValue('en attente')
  enAttente,
  @JsonValue('réservé')
  reserve,
  @JsonValue('annulé')
  annule,
  @JsonValue('terminé')
  termine,
  @JsonValue('en cours')
  enCours,
  @JsonValue('complété')
  complete,
}

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'rdv_id') String? rdvId,
    @JsonKey(name: 'id_med') required DoctorInfo doctor,
    @JsonKey(name: 'id_num_dossier') required PatientInfo patient,
    required String date,
    required String heure,
    @Default(AppointmentStatus.enAttente) AppointmentStatus status,
    @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) => _$AppointmentFromJson(json);
}

// Doctor Appointment entity for /rendez-vous/my-appointments endpoint
// This API returns id_med as string and id_num_dossier as PatientInfo object
@freezed
class DoctorAppointment with _$DoctorAppointment {
  const factory DoctorAppointment({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'rdv_id') String? rdvId,
    @JsonKey(name: 'id_med') required String doctorId,
    @JsonKey(name: 'id_num_dossier') required PatientInfo patient,
    required String date,
    required String heure,
    @Default(AppointmentStatus.enAttente) AppointmentStatus status,
    @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DoctorAppointment;

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) => _$DoctorAppointmentFromJson(json);
}

@freezed
class DoctorInfo with _$DoctorInfo {
  const factory DoctorInfo({
    @JsonKey(name: '_id') String? id,
    required String nom,
    required String prenom,
    required int cin,
    required String role,
  }) = _DoctorInfo;

  factory DoctorInfo.fromJson(Map<String, dynamic> json) => _$DoctorInfoFromJson(json);
}

@freezed
class PatientInfo with _$PatientInfo {
  const factory PatientInfo({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'nom_patient') String? nomPatient,
    @JsonKey(name: 'pren_patient') String? prenPatient,
    @JsonKey(name: 'cin_cnam') int? cinCnam,
    int? tel,
  }) = _PatientInfo;

  factory PatientInfo.fromJson(Map<String, dynamic> json) => _$PatientInfoFromJson(json);

  // 🛸 ALIEN SAFE FACTORY: For manual creation with null safety
  factory PatientInfo.alienSafe(Map<String, dynamic> json) {
    try {
      return PatientInfo.fromJson(json);
    } catch (e) {
      // 🛸 ALIEN FALLBACK: If JSON parsing fails, create a safe patient with available data
      debugPrint('[ALIEN_PATIENT] 🛸 JSON parsing failed, creating safe fallback: $e');
      
      return PatientInfo(
        id: json['_id']?.toString(),
        nomPatient: json['nom_patient']?.toString(),
        prenPatient: json['pren_patient']?.toString(),
        cinCnam: _parseIntSafely(json['cin_cnam']),
        tel: _parseIntSafely(json['tel']),
      );
    }
  }

  // 🛸 ALIEN HELPER: Safe integer parsing
  static int? _parseIntSafely(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    if (value is double) return value.toInt();
    return null;
  }
}

@freezed
class CreateAppointmentRequest with _$CreateAppointmentRequest {
  const factory CreateAppointmentRequest({
    required String idMed,
    required String idNumDossier,
    required String date,
    required String heure,
    AppointmentStatus? status,
  }) = _CreateAppointmentRequest;

  factory CreateAppointmentRequest.fromJson(Map<String, dynamic> json) => 
      _$CreateAppointmentRequestFromJson(json);
}

@freezed
class UpdateAppointmentRequest with _$UpdateAppointmentRequest {
  const factory UpdateAppointmentRequest({
    String? idMed,
    String? idNumDossier,
    String? date,
    String? heure,
    AppointmentStatus? status,
  }) = _UpdateAppointmentRequest;

  factory UpdateAppointmentRequest.fromJson(Map<String, dynamic> json) => 
      _$UpdateAppointmentRequestFromJson(json);
}

// Response DTO for create appointment - backend returns IDs as strings, not full objects
@freezed
class CreateAppointmentResponse with _$CreateAppointmentResponse {
  const factory CreateAppointmentResponse({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'rdv_id') String? rdvId,
    @JsonKey(name: 'id_med') required String doctorId,
    @JsonKey(name: 'id_num_dossier') required String patientId,
    required String date,
    required String heure,
    @Default(AppointmentStatus.enAttente) AppointmentStatus status,
    @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CreateAppointmentResponse;

  factory CreateAppointmentResponse.fromJson(Map<String, dynamic> json) => 
      _$CreateAppointmentResponseFromJson(json);
}

// Extension to add backend-specific status conversion
extension CreateAppointmentRequestBackendExt on CreateAppointmentRequest {
  Map<String, dynamic> toBackendJson() => {
    'id_med': idMed,
    'id_num_dossier': idNumDossier,
    'date': date,
    'heure': heure,
    if (status != null) 'status': status!.toBackendString(),
  };
}

// Extension to convert AppointmentStatus to backend-expected strings
extension AppointmentStatusBackendExt on AppointmentStatus {
  String toBackendString() {
    switch (this) {
      case AppointmentStatus.enAttente:
        return 'en attente';
      case AppointmentStatus.annule:
        return 'annulé';
      case AppointmentStatus.complete:
      case AppointmentStatus.termine:
        return 'complété';
      // Map other statuses to closest backend equivalent
      case AppointmentStatus.reserve:
        return 'en attente';
      case AppointmentStatus.enCours:
        return 'en attente';
    }
  }
} 