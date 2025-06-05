import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@freezed
class DeletionRequestedBy with _$DeletionRequestedBy {
  const factory DeletionRequestedBy({
    String? id,
    required String nom,
    required String prenom,
    required int cin,
    required String role,
  }) = _DeletionRequestedBy;

  factory DeletionRequestedBy.fromJson(Map<String, dynamic> json) {
    return DeletionRequestedBy(
      id: json['_id'] as String?,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      cin: json['cin'] as int,
      role: json['role'] as String,
    );
  }
}

enum PatientGender {
  @JsonValue('feminin')
  feminin,
  @JsonValue('masculin')
  masculin,
}

enum AgeRange {
  @JsonValue('18-29')
  age18to29,
  @JsonValue('30-39')
  age30to39,
  @JsonValue('40-49')
  age40to49,
  @JsonValue('50-59')
  age50to59,
  @JsonValue('>=60')
  age60Plus,
}

enum MaritalStatus {
  @JsonValue('divorcé')
  divorce,
  @JsonValue('célibataire')
  celibataire,
  @JsonValue('marié')
  marie,
  @JsonValue('voeuf')
  voeuf,
}

enum Origin {
  @JsonValue('urbaine')
  urbaine,
  @JsonValue('rurale')
  rurale,
}

enum LivingSituation {
  @JsonValue('seule')
  seule,
  @JsonValue('en famille')
  enFamille,
}

enum CityOfResidence {
  @JsonValue('sud')
  sud,
  @JsonValue('centre')
  centre,
}

enum EducationLevel {
  @JsonValue('secondaire')
  secondaire,
  @JsonValue('universitaire')
  universitaire,
  @JsonValue('analphabète')
  analphabete,
  @JsonValue('primaire')
  primaire,
}

enum ProfessionType {
  @JsonValue('irreguliere')
  irreguliere,
  @JsonValue('chomage')
  chomage,
  @JsonValue('reguliere')
  reguliere,
  @JsonValue('retraite')
  retraite,
  @JsonValue('eleve')
  eleve,
}

enum SocioeconomicLevel {
  @JsonValue('moyen')
  moyen,
  @JsonValue('bas')
  bas,
}

@freezed
class Patient with _$Patient {
  const factory Patient({
    String? id,
    required String nomPatient,
    required String prenPatient,
    int? cinCnam,
    int? telephone,
    String? dateNaiss,
    required PatientGender sexe,
    required AgeRange ageInt,
    required MaritalStatus etatcivil,
    required Origin origine,
    required LivingSituation lieuderesidence,
    required CityOfResidence villederesidence,
    required EducationLevel nvscolaire,
    required ProfessionType typeProf,
    required SocioeconomicLevel nvSocioeconomique,
    String? idSec,
    String? numDossier,
    bool? pendingDeletion,
    String? deletionReason,
    DateTime? deletionRequestedAt,
    DeletionRequestedBy? deletionRequestedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) {
    try {
      print('[PATIENT_PARSE] ======================================');
      print('[PATIENT_PARSE] Manual parsing with direct field mapping...');
      
      // Direct field mapping from API response
      final id = json['_id'] as String?;
      final nomPatient = json['nom_patient'] as String;
      final prenPatient = json['pren_patient'] as String;
      final cinCnam = json['cin_cnam'] as int?;
      final telephone = json['tel'] as int?;
      final dateNaiss = json['date_naiss'] as String?;
      final sexe = json['sexe'] as String;
      final ageInt = json['age_int'] as String;
      final etatcivil = json['etat_civil'] as String;
      final origine = json['origine'] as String;
      final lieuderesidence = json['lieu_de_residence'] as String;
      final villederesidence = json['ville_de_residence'] as String;
      final nvscolaire = json['nv_scolaire'] as String;
      final typeProf = json['type_prof'] as String;
      final nvSocioeconomique = json['nv_socioeconomique'] as String;
      final idSec = json['id_sec']?.toString();
      final numDossier = json['num_dossier'] as String?;
      final pendingDeletion = json['request_for_deletion'] as bool?;
      final deletionReason = json['deletion_reason'] as String?;
      final deletionRequestedAt = json['deletion_requested_at'] != null 
          ? DateTime.parse(json['deletion_requested_at']) 
          : null;
      final deletionRequestedBy = json['deletion_requested_by'] != null 
          ? DeletionRequestedBy.fromJson(json['deletion_requested_by']) 
          : null;
      final createdAt = json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null;
      final updatedAt = json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null;
      
      print('[PATIENT_PARSE] ✅ Mapped: $prenPatient $nomPatient (ID: $id)');
      
      return Patient(
        id: id,
        nomPatient: nomPatient,
        prenPatient: prenPatient,
        cinCnam: cinCnam,
        telephone: telephone,
        dateNaiss: dateNaiss,
        sexe: _parseGender(sexe),
        ageInt: _parseAgeRange(ageInt),
        etatcivil: _parseMaritalStatus(etatcivil),
        origine: _parseOrigin(origine),
        lieuderesidence: _parseLivingSituation(lieuderesidence),
        villederesidence: _parseCityOfResidence(villederesidence),
        nvscolaire: _parseEducationLevel(nvscolaire),
        typeProf: _parseProfessionType(typeProf),
        nvSocioeconomique: _parseSocioeconomicLevel(nvSocioeconomique),
        idSec: idSec,
        numDossier: numDossier,
        pendingDeletion: pendingDeletion,
        deletionReason: deletionReason,
        deletionRequestedAt: deletionRequestedAt,
        deletionRequestedBy: deletionRequestedBy,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
      
    } catch (e, stackTrace) {
      print('[PATIENT_PARSE] ❌ Error parsing patient: $e');
      print('[PATIENT_PARSE] JSON keys: ${json.keys.toList()}');
      print('[PATIENT_PARSE] Stack trace: $stackTrace');
      rethrow;
    }
  }
  
  static PatientGender _parseGender(String value) {
    switch (value.toLowerCase()) {
      case 'feminin':
        return PatientGender.feminin;
      case 'masculin':
        return PatientGender.masculin;
      default:
        return PatientGender.masculin;
    }
  }
  
  static AgeRange _parseAgeRange(String value) {
    switch (value) {
      case '18-29':
        return AgeRange.age18to29;
      case '30-39':
        return AgeRange.age30to39;
      case '40-49':
        return AgeRange.age40to49;
      case '50-59':
        return AgeRange.age50to59;
      case '>=60':
        return AgeRange.age60Plus;
      default:
        return AgeRange.age18to29;
    }
  }
  
  static MaritalStatus _parseMaritalStatus(String value) {
    switch (value) {
      case 'divorcé':
        return MaritalStatus.divorce;
      case 'célibataire':
        return MaritalStatus.celibataire;
      case 'marié':
        return MaritalStatus.marie;
      case 'voeuf':
        return MaritalStatus.voeuf;
      default:
        return MaritalStatus.celibataire;
    }
  }
  
  static Origin _parseOrigin(String value) {
    switch (value) {
      case 'urbaine':
        return Origin.urbaine;
      case 'rurale':
        return Origin.rurale;
      default:
        return Origin.urbaine;
    }
  }
  
  static LivingSituation _parseLivingSituation(String value) {
    switch (value) {
      case 'seule':
        return LivingSituation.seule;
      case 'en famille':
        return LivingSituation.enFamille;
      default:
        return LivingSituation.enFamille;
    }
  }
  
  static CityOfResidence _parseCityOfResidence(String value) {
    switch (value) {
      case 'sud':
        return CityOfResidence.sud;
      case 'centre':
        return CityOfResidence.centre;
      default:
        return CityOfResidence.centre;
    }
  }
  
  static EducationLevel _parseEducationLevel(String value) {
    switch (value) {
      case 'secondaire':
        return EducationLevel.secondaire;
      case 'universitaire':
        return EducationLevel.universitaire;
      case 'analphabète':
        return EducationLevel.analphabete;
      case 'primaire':
        return EducationLevel.primaire;
      default:
        return EducationLevel.secondaire;
    }
  }
  
  static ProfessionType _parseProfessionType(String value) {
    switch (value) {
      case 'irreguliere':
        return ProfessionType.irreguliere;
      case 'chomage':
        return ProfessionType.chomage;
      case 'reguliere':
        return ProfessionType.reguliere;
      case 'retraite':
        return ProfessionType.retraite;
      case 'eleve':
        return ProfessionType.eleve;
      default:
        return ProfessionType.reguliere;
    }
  }
  
  static SocioeconomicLevel _parseSocioeconomicLevel(String value) {
    switch (value) {
      case 'moyen':
        return SocioeconomicLevel.moyen;
      case 'bas':
        return SocioeconomicLevel.bas;
      default:
        return SocioeconomicLevel.moyen;
    }
  }
}

@freezed
class CreatePatientRequest with _$CreatePatientRequest {
  const factory CreatePatientRequest({
    required String nomPatient,
    required String prenPatient,
    int? cinCnam,
    int? telephone,
    String? dateNaiss,
    required PatientGender sexe,
    required AgeRange ageInt,
    required MaritalStatus etatcivil,
    required Origin origine,
    required LivingSituation lieuderesidence,
    required CityOfResidence villederesidence,
    required EducationLevel nvscolaire,
    required ProfessionType typeProf,
    required SocioeconomicLevel nvSocioeconomique,
    String? idSec,
  }) = _CreatePatientRequest;

  factory CreatePatientRequest.fromJson(Map<String, dynamic> json) => 
      _$CreatePatientRequestFromJson(json);
}

// Extension to add backend-specific JSON conversion
extension CreatePatientRequestBackendExt on CreatePatientRequest {
  Map<String, dynamic> toBackendJson() {
    return <String, dynamic>{
      'nom_patient': nomPatient,
      'pren_patient': prenPatient,
      if (cinCnam != null) 'cin_cnam': cinCnam,
      if (telephone != null) 'telephone': telephone,
      if (dateNaiss != null) 'date_naiss': dateNaiss,
      'sexe': _genderToBackendString(sexe),
      'age_int': _ageRangeToBackendString(ageInt),
      'etatcivil': _maritalStatusToBackendString(etatcivil),
      'origine': _originToBackendString(origine),
      'lieuderesidence': _livingSituationToBackendString(lieuderesidence),
      'villederesidence': _cityOfResidenceToBackendString(villederesidence),
      'nvscolaire': _educationLevelToBackendString(nvscolaire),
      'type_prof': _professionTypeToBackendString(typeProf),
      'nv_socioeconomique': _socioeconomicLevelToBackendString(nvSocioeconomique),
      if (idSec != null) 'id_sec': idSec,
    };
  }

  String _genderToBackendString(PatientGender gender) {
    switch (gender) {
      case PatientGender.feminin:
        return 'feminin';
      case PatientGender.masculin:
        return 'masculin';
    }
  }

  String _ageRangeToBackendString(AgeRange ageRange) {
    switch (ageRange) {
      case AgeRange.age18to29:
        return '18-29';
      case AgeRange.age30to39:
        return '30-39';
      case AgeRange.age40to49:
        return '40-49';
      case AgeRange.age50to59:
        return '50-59';
      case AgeRange.age60Plus:
        return '>=60';
    }
  }

  String _maritalStatusToBackendString(MaritalStatus status) {
    switch (status) {
      case MaritalStatus.divorce:
        return 'divorcé';
      case MaritalStatus.celibataire:
        return 'célibataire';
      case MaritalStatus.marie:
        return 'marié';
      case MaritalStatus.voeuf:
        return 'voeuf';
    }
  }

  String _originToBackendString(Origin origin) {
    switch (origin) {
      case Origin.urbaine:
        return 'urbaine';
      case Origin.rurale:
        return 'rurale';
    }
  }

  String _livingSituationToBackendString(LivingSituation situation) {
    switch (situation) {
      case LivingSituation.seule:
        return 'seule';
      case LivingSituation.enFamille:
        return 'en famille';
    }
  }

  String _cityOfResidenceToBackendString(CityOfResidence city) {
    switch (city) {
      case CityOfResidence.sud:
        return 'sud';
      case CityOfResidence.centre:
        return 'centre';
    }
  }

  String _educationLevelToBackendString(EducationLevel level) {
    switch (level) {
      case EducationLevel.secondaire:
        return 'secondaire';
      case EducationLevel.universitaire:
        return 'universitaire';
      case EducationLevel.analphabete:
        return 'analphabète';
      case EducationLevel.primaire:
        return 'primaire';
    }
  }

  String _professionTypeToBackendString(ProfessionType profession) {
    switch (profession) {
      case ProfessionType.irreguliere:
        return 'irreguliere';
      case ProfessionType.chomage:
        return 'chomage';
      case ProfessionType.reguliere:
        return 'reguliere';
      case ProfessionType.retraite:
        return 'retraite';
      case ProfessionType.eleve:
        return 'eleve';
    }
  }

  String _socioeconomicLevelToBackendString(SocioeconomicLevel level) {
    switch (level) {
      case SocioeconomicLevel.moyen:
        return 'moyen';
      case SocioeconomicLevel.bas:
        return 'bas';
    }
  }
}

@freezed
class UpdatePatientRequest with _$UpdatePatientRequest {
  const factory UpdatePatientRequest({
    String? nomPatient,
    String? prenPatient,
    int? cinCnam,
    int? telephone,
    String? dateNaiss,
    PatientGender? sexe,
    AgeRange? ageInt,
    MaritalStatus? etatcivil,
    Origin? origine,
    LivingSituation? lieuderesidence,
    CityOfResidence? villederesidence,
    EducationLevel? nvscolaire,
    ProfessionType? typeProf,
    SocioeconomicLevel? nvSocioeconomique,
    String? idSec,
  }) = _UpdatePatientRequest;

  factory UpdatePatientRequest.fromJson(Map<String, dynamic> json) => 
      _$UpdatePatientRequestFromJson(json);
}

// Extension to add backend-specific JSON conversion for updates
extension UpdatePatientRequestBackendExt on UpdatePatientRequest {
  Map<String, dynamic> toBackendJson() {
    return <String, dynamic>{
      if (nomPatient != null) 'nom_patient': nomPatient,
      if (prenPatient != null) 'pren_patient': prenPatient,
      if (cinCnam != null) 'cin_cnam': cinCnam,
      if (telephone != null) 'telephone': telephone,
      if (dateNaiss != null) 'date_naiss': dateNaiss,
      if (sexe != null) 'sexe': _genderToBackendString(sexe!),
      if (ageInt != null) 'age_int': _ageRangeToBackendString(ageInt!),
      if (etatcivil != null) 'etatcivil': _maritalStatusToBackendString(etatcivil!),
      if (origine != null) 'origine': _originToBackendString(origine!),
      if (lieuderesidence != null) 'lieuderesidence': _livingSituationToBackendString(lieuderesidence!),
      if (villederesidence != null) 'villederesidence': _cityOfResidenceToBackendString(villederesidence!),
      if (nvscolaire != null) 'nvscolaire': _educationLevelToBackendString(nvscolaire!),
      if (typeProf != null) 'type_prof': _professionTypeToBackendString(typeProf!),
      if (nvSocioeconomique != null) 'nv_socioeconomique': _socioeconomicLevelToBackendString(nvSocioeconomique!),
      if (idSec != null) 'id_sec': idSec,
    };
  }

  String _genderToBackendString(PatientGender gender) {
    switch (gender) {
      case PatientGender.feminin:
        return 'feminin';
      case PatientGender.masculin:
        return 'masculin';
    }
  }

  String _ageRangeToBackendString(AgeRange ageRange) {
    switch (ageRange) {
      case AgeRange.age18to29:
        return '18-29';
      case AgeRange.age30to39:
        return '30-39';
      case AgeRange.age40to49:
        return '40-49';
      case AgeRange.age50to59:
        return '50-59';
      case AgeRange.age60Plus:
        return '>=60';
    }
  }

  String _maritalStatusToBackendString(MaritalStatus status) {
    switch (status) {
      case MaritalStatus.divorce:
        return 'divorcé';
      case MaritalStatus.celibataire:
        return 'célibataire';
      case MaritalStatus.marie:
        return 'marié';
      case MaritalStatus.voeuf:
        return 'voeuf';
    }
  }

  String _originToBackendString(Origin origin) {
    switch (origin) {
      case Origin.urbaine:
        return 'urbaine';
      case Origin.rurale:
        return 'rurale';
    }
  }

  String _livingSituationToBackendString(LivingSituation situation) {
    switch (situation) {
      case LivingSituation.seule:
        return 'seule';
      case LivingSituation.enFamille:
        return 'en famille';
    }
  }

  String _cityOfResidenceToBackendString(CityOfResidence city) {
    switch (city) {
      case CityOfResidence.sud:
        return 'sud';
      case CityOfResidence.centre:
        return 'centre';
    }
  }

  String _educationLevelToBackendString(EducationLevel level) {
    switch (level) {
      case EducationLevel.secondaire:
        return 'secondaire';
      case EducationLevel.universitaire:
        return 'universitaire';
      case EducationLevel.analphabete:
        return 'analphabète';
      case EducationLevel.primaire:
        return 'primaire';
    }
  }

  String _professionTypeToBackendString(ProfessionType profession) {
    switch (profession) {
      case ProfessionType.irreguliere:
        return 'irreguliere';
      case ProfessionType.chomage:
        return 'chomage';
      case ProfessionType.reguliere:
        return 'reguliere';
      case ProfessionType.retraite:
        return 'retraite';
      case ProfessionType.eleve:
        return 'eleve';
    }
  }

  String _socioeconomicLevelToBackendString(SocioeconomicLevel level) {
    switch (level) {
      case SocioeconomicLevel.moyen:
        return 'moyen';
      case SocioeconomicLevel.bas:
        return 'bas';
    }
  }
}

@freezed
class RequestPatientDeletionRequest with _$RequestPatientDeletionRequest {
  const factory RequestPatientDeletionRequest({
    required String reason,
  }) = _RequestPatientDeletionRequest;

  factory RequestPatientDeletionRequest.fromJson(Map<String, dynamic> json) => 
      _$RequestPatientDeletionRequestFromJson(json);
} 