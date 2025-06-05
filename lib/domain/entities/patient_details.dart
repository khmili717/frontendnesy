import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_details.freezed.dart';

@freezed
class PatientDetails with _$PatientDetails {
  const factory PatientDetails({
    required String id,
    required String numDossier,
    required String nomPatient,
    required String prenPatient,
    required int cinCnam,
    required int telephone,
    required String dateNaiss,
    required PatientGender sexe,
    required AgeRange ageInt,
    required MaritalStatus etatCivil,
    required Origin origine,
    required ResidenceLocation lieuDeResidence,
    required ResidenceCity villeDeResidence,
    required ProfessionType typeProf,
    required SocioeconomicLevel nvSocioeconomique,
    required EducationLevel nvScolaire,
    String? idSec,
    required DateTime dateCreated,
    required bool requestForDeletion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PatientDetails;
}

@freezed
class PatientAppointment with _$PatientAppointment {
  const factory PatientAppointment({
    required String id,
    required String rdvId,
    required PatientDoctor doctor,
    required String patientId,
    required DateTime date,
    required String heure,
    String? linkedConsultation,
    required AppointmentStatus status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PatientAppointment;
}

@freezed
class PatientDoctor with _$PatientDoctor {
  const factory PatientDoctor({
    required String id,
    required String nom,
    required String prenom,
    required int cin,
    required String role,
  }) = _PatientDoctor;
}

@freezed
class PatientConsultation with _$PatientConsultation {
  const factory PatientConsultation({
    required String id,
    required String numConsult,
    required String numDossier,
    PatientDoctor? doctor,
    required DateTime dateHeure,
    String? diagnosticRetenu,
    String? remarque,
    required bool predictionGeneree,
    String? predictionRisque,
    String? nomMed,
    String? prenMed,
    
    // Psychiatric history
    required bool addiction,
    required bool tabac,
    required bool alcool,
    required bool cannabis,
    required bool medicaments,
    required bool atcdsPTs,
    required bool ideesSuiAnt,
    required bool hospitAnt,
    required bool etatdepressif,
    
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PatientConsultation;
}

// Enums for patient details
enum PatientGender {
  masculin,
  feminin,
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
  @JsonValue('60+')
  age60Plus,
}

enum MaritalStatus {
  @JsonValue('célibataire')
  celibataire,
  @JsonValue('marié')
  marie,
  @JsonValue('divorcé')
  divorce,
  @JsonValue('veuf/veuve')
  veuf,
}

enum Origin {
  @JsonValue('urbaine')
  urbaine,
  @JsonValue('rurale')
  rurale,
}

enum ResidenceLocation {
  @JsonValue('en famille')
  enFamille,
  @JsonValue('seul')
  seul,
  @JsonValue('foyer')
  foyer,
}

enum ResidenceCity {
  @JsonValue('centre')
  centre,
  @JsonValue('nord')
  nord,
  @JsonValue('sud')
  sud,
  @JsonValue('est')
  est,
  @JsonValue('ouest')
  ouest,
}

enum ProfessionType {
  @JsonValue('reguliere')
  reguliere,
  @JsonValue('irreguliere')
  irreguliere,
  @JsonValue('sans emploi')
  sansEmploi,
}

enum SocioeconomicLevel {
  @JsonValue('faible')
  faible,
  @JsonValue('moyen')
  moyen,
  @JsonValue('élévé')
  eleve,
}

enum EducationLevel {
  @JsonValue('primaire')
  primaire,
  @JsonValue('secondaire')
  secondaire,
  @JsonValue('universitaire')
  universitaire,
  @JsonValue('aucun')
  aucun,
}

enum AppointmentStatus {
  @JsonValue('en attente')
  enAttente,
  @JsonValue('terminé')
  termine,
  @JsonValue('annulé')
  annule,
  @JsonValue('confirmé')
  confirme,
}

// Extensions for display purposes
extension PatientDetailsDisplayExtension on PatientDetails {
  String get fullName => '$prenPatient $nomPatient';
  
  String get formattedPhone => '+216 $telephone';
  
  String get genderDisplay {
    switch (sexe) {
      case PatientGender.masculin:
        return 'Homme';
      case PatientGender.feminin:
        return 'Femme';
    }
  }
  
  String get ageRangeDisplay {
    switch (ageInt) {
      case AgeRange.age18to29:
        return '18-29 ans';
      case AgeRange.age30to39:
        return '30-39 ans';
      case AgeRange.age40to49:
        return '40-49 ans';
      case AgeRange.age50to59:
        return '50-59 ans';
      case AgeRange.age60Plus:
        return '60+ ans';
    }
  }
  
  String get maritalStatusDisplay {
    switch (etatCivil) {
      case MaritalStatus.celibataire:
        return 'Célibataire';
      case MaritalStatus.marie:
        return 'Marié(e)';
      case MaritalStatus.divorce:
        return 'Divorcé(e)';
      case MaritalStatus.veuf:
        return 'Veuf/Veuve';
    }
  }
  
  String get residenceLocationDisplay {
    switch (lieuDeResidence) {
      case ResidenceLocation.enFamille:
        return 'En famille';
      case ResidenceLocation.seul:
        return 'Seul(e)';
      case ResidenceLocation.foyer:
        return 'Foyer';
    }
  }
  
  String get professionTypeDisplay {
    switch (typeProf) {
      case ProfessionType.reguliere:
        return 'Emploi régulier';
      case ProfessionType.irreguliere:
        return 'Emploi irrégulier';
      case ProfessionType.sansEmploi:
        return 'Sans emploi';
    }
  }
  
  String get socioeconomicLevelDisplay {
    switch (nvSocioeconomique) {
      case SocioeconomicLevel.faible:
        return 'Faible';
      case SocioeconomicLevel.moyen:
        return 'Moyen';
      case SocioeconomicLevel.eleve:
        return 'Élevé';
    }
  }
  
  String get educationLevelDisplay {
    switch (nvScolaire) {
      case EducationLevel.primaire:
        return 'Primaire';
      case EducationLevel.secondaire:
        return 'Secondaire';
      case EducationLevel.universitaire:
        return 'Universitaire';
      case EducationLevel.aucun:
        return 'Aucun';
    }
  }
}

extension PatientAppointmentDisplayExtension on PatientAppointment {
  String get doctorFullName => '${doctor.prenom} ${doctor.nom}';
  
  String get formattedDate {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
  
  String get statusDisplay {
    switch (status) {
      case AppointmentStatus.enAttente:
        return 'En attente';
      case AppointmentStatus.termine:
        return 'Terminé';
      case AppointmentStatus.annule:
        return 'Annulé';
      case AppointmentStatus.confirme:
        return 'Confirmé';
    }
  }
}

extension PatientConsultationDisplayExtension on PatientConsultation {
  String get doctorFullName {
    if (doctor != null) {
      return '${doctor!.prenom} ${doctor!.nom}';
    } else if (nomMed != null && prenMed != null) {
      return '$prenMed $nomMed';
    }
    return 'Non spécifié';
  }
  
  String get formattedDate {
    return '${dateHeure.day.toString().padLeft(2, '0')}/${dateHeure.month.toString().padLeft(2, '0')}/${dateHeure.year}';
  }
  
  String get riskLevelDisplay {
    if (predictionRisque != null) {
      switch (predictionRisque!.toLowerCase()) {
        case 'élevé':
        case 'eleve':
          return 'Élevé';
        case 'moyen':
          return 'Moyen';
        case 'faible':
          return 'Faible';
        default:
          return predictionRisque!;
      }
    }
    return 'Non évalué';
  }
  
  String get diagnosticDisplay {
    return diagnosticRetenu ?? 'Non spécifié';
  }
} 