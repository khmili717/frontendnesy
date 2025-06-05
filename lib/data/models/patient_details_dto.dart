import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_details_dto.freezed.dart';

@freezed
class PatientDetailsDto with _$PatientDetailsDto {
  const factory PatientDetailsDto({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'num_dossier') required String numDossier,
    @JsonKey(name: 'nom_patient') required String nomPatient,
    @JsonKey(name: 'pren_patient') required String prenPatient,
    @JsonKey(name: 'cin_cnam') required int cinCnam,
    required int tel,
    @JsonKey(name: 'date_naiss') required String dateNaiss,
    required String sexe,
    @JsonKey(name: 'age_int') required String ageInt,
    @JsonKey(name: 'etat_civil') required String etatCivil,
    required String origine,
    @JsonKey(name: 'lieu_de_residence') required String lieuDeResidence,
    @JsonKey(name: 'ville_de_residence') required String villeDeResidence,
    @JsonKey(name: 'type_prof') required String typeProf,
    @JsonKey(name: 'nv_socioeconomique') required String nvSocioeconomique,
    @JsonKey(name: 'nv_scolaire') required String nvScolaire,
    @JsonKey(name: 'id_sec') String? idSec,
    required String date,
    @JsonKey(name: 'request_for_deletion') @Default(false) bool requestForDeletion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PatientDetailsDto;

  factory PatientDetailsDto.fromJson(Map<String, dynamic> json) {
    try {
      // 👽 ALIEN-PROOF PARSING: Handle any data type gracefully
      return PatientDetailsDto(
        id: _safeString(json['_id']) ?? '',
        numDossier: _safeString(json['num_dossier']) ?? 'N/A',
        nomPatient: _safeString(json['nom_patient']) ?? '',
        prenPatient: _safeString(json['pren_patient']) ?? '',
        cinCnam: _safeInt(json['cin_cnam']) ?? 0,
        tel: _safeInt(json['tel']) ?? 0,
        dateNaiss: _safeString(json['date_naiss']) ?? '',
        sexe: _safeString(json['sexe']) ?? 'masculin',
        ageInt: _safeString(json['age_int']) ?? '18-29',
        etatCivil: _safeString(json['etat_civil']) ?? 'célibataire',
        origine: _safeString(json['origine']) ?? 'urbaine',
        lieuDeResidence: _safeString(json['lieu_de_residence']) ?? 'en famille',
        villeDeResidence: _safeString(json['ville_de_residence']) ?? 'centre',
        typeProf: _safeString(json['type_prof']) ?? 'reguliere',
        nvSocioeconomique: _safeString(json['nv_socioeconomique']) ?? 'moyen',
        nvScolaire: _safeString(json['nv_scolaire']) ?? 'secondaire',
        idSec: _safeString(json['id_sec']),
        date: _safeString(json['date']) ?? DateTime.now().toIso8601String(),
        requestForDeletion: _safeBool(json['request_for_deletion']) ?? false,
        createdAt: _safeDateTime(json['createdAt']),
        updatedAt: _safeDateTime(json['updatedAt']),
      );
    } catch (e) {
      print('🚨 [ALIEN-PROOF] Error parsing PatientDetailsDto: $e');
      print('🚨 [ALIEN-PROOF] Raw JSON: $json');
      rethrow;
    }
  }

  // 👽 ALIEN-PROOF HELPER METHODS
  static String? _safeString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is Map) return value.toString(); // Convert objects to string
    return value.toString();
  }

  static int? _safeInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static bool? _safeBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    if (value is int) return value != 0;
    return null;
  }

  static DateTime? _safeDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
}

@freezed
class PatientAppointmentDto with _$PatientAppointmentDto {
  const factory PatientAppointmentDto({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'rdv_id') required String rdvId,
    @JsonKey(name: 'id_med') required DoctorDto doctor,
    @JsonKey(name: 'id_num_dossier') required String patientId,
    required String date,
    required String heure,
    @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
    required String status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PatientAppointmentDto;

  factory PatientAppointmentDto.fromJson(Map<String, dynamic> json) {
    try {
      return PatientAppointmentDto(
        id: _safeString(json['_id']) ?? '',
        rdvId: _safeString(json['rdv_id']) ?? '',
        doctor: DoctorDto.fromJson(json['id_med'] as Map<String, dynamic>),
        patientId: _safeString(json['id_num_dossier']) ?? '',
        date: _safeString(json['date']) ?? '',
        heure: _safeString(json['heure']) ?? '',
        linkedConsultation: _safeString(json['linkedConsultation']),
        status: _safeString(json['status']) ?? 'en attente',
        createdAt: _safeDateTime(json['createdAt']),
        updatedAt: _safeDateTime(json['updatedAt']),
      );
    } catch (e) {
      print('🚨 [ALIEN-PROOF] Error parsing PatientAppointmentDto: $e');
      rethrow;
    }
  }

  // Helper methods
  static String? _safeString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  static DateTime? _safeDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
}

@freezed
class DoctorDto with _$DoctorDto {
  const factory DoctorDto({
    @JsonKey(name: '_id') required String id,
    required String nom,
    required String prenom,
    required int cin,
    required String role,
  }) = _DoctorDto;

  factory DoctorDto.fromJson(Map<String, dynamic> json) {
    try {
      return DoctorDto(
        id: _safeString(json['_id']) ?? '',
        nom: _safeString(json['nom']) ?? '',
        prenom: _safeString(json['prenom']) ?? '',
        cin: _safeInt(json['cin']) ?? 0,
        role: _safeString(json['role']) ?? 'medecin',
      );
    } catch (e) {
      print('🚨 [ALIEN-PROOF] Error parsing DoctorDto: $e');
      rethrow;
    }
  }

  // Helper methods
  static String? _safeString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  static int? _safeInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return 0;
  }
}

@freezed
class PatientConsultationDto with _$PatientConsultationDto {
  const factory PatientConsultationDto({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'num_consult') required String numConsult,
    @JsonKey(name: 'num_dossier') required String numDossier,
    @JsonKey(name: 'id_med') DoctorDto? doctor,
    @JsonKey(name: 'date_heure') required String dateHeure,
    @JsonKey(name: 'diagnostic_retenu') String? diagnosticRetenu,
    @JsonKey(name: 'remarque') String? remarque,
    @JsonKey(name: 'prediction_generee') @Default(false) bool predictionGeneree,
    @JsonKey(name: 'prediction_risque') String? predictionRisque,
    @JsonKey(name: 'nom_med') String? nomMed,
    @JsonKey(name: 'pren_med') String? prenMed,
    
    // Psychiatric history
    @Default(false) bool addiction,
    @Default(false) @JsonKey(name: 'TABAC') bool tabac,
    @Default(false) bool alcool,
    @Default(false) bool cannabis,
    @Default(false) bool medicaments,
    @Default(false) @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
    @Default(false) @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
    @Default(false) @JsonKey(name: 'hospit_ant') bool hospitAnt,
    @Default(false) bool etatdepressif,
    
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PatientConsultationDto;

  factory PatientConsultationDto.fromJson(Map<String, dynamic> json) {
    try {
      return PatientConsultationDto(
        id: _safeString(json['_id']) ?? '',
        numConsult: _safeString(json['num_consult']) ?? '',
        numDossier: _safeString(json['num_dossier']) ?? '',
        doctor: json['id_med'] != null ? DoctorDto.fromJson(json['id_med'] as Map<String, dynamic>) : null,
        dateHeure: _safeString(json['date_heure']) ?? DateTime.now().toIso8601String(),
        diagnosticRetenu: _safeString(json['diagnostic_retenu']),
        remarque: _safeString(json['remarque']),
        predictionGeneree: _safeBool(json['prediction_generee']) ?? false,
        predictionRisque: _safeString(json['prediction_risque']),
        nomMed: _safeString(json['nom_med']),
        prenMed: _safeString(json['pren_med']),
        addiction: _safeBool(json['addiction']) ?? false,
        tabac: _safeBool(json['TABAC']) ?? false,
        alcool: _safeBool(json['alcool']) ?? false,
        cannabis: _safeBool(json['cannabis']) ?? false,
        medicaments: _safeBool(json['medicaments']) ?? false,
        atcdsPTs: _safeBool(json['AtcdsP_TS']) ?? false,
        ideesSuiAnt: _safeBool(json['idees_sui_ant']) ?? false,
        hospitAnt: _safeBool(json['hospit_ant']) ?? false,
        etatdepressif: _safeBool(json['etatdepressif']) ?? false,
        createdAt: _safeDateTime(json['createdAt']),
        updatedAt: _safeDateTime(json['updatedAt']),
      );
    } catch (e) {
      print('🚨 [ALIEN-PROOF] Error parsing PatientConsultationDto: $e');
      rethrow;
    }
  }

  // Helper methods
  static String? _safeString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  static bool? _safeBool(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    if (value is int) return value != 0;
    return false;
  }

  static DateTime? _safeDateTime(dynamic value) {
    if (value == null) return null;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }
} 