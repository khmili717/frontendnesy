import 'package:foresight_care/data/models/patient_details_dto.dart';
import 'package:foresight_care/domain/entities/patient_details.dart';

class PatientDetailsMapper {
  static PatientDetails fromDto(PatientDetailsDto dto) {
    return PatientDetails(
      id: dto.id,
      numDossier: dto.numDossier,
      nomPatient: dto.nomPatient,
      prenPatient: dto.prenPatient,
      cinCnam: dto.cinCnam,
      telephone: dto.tel,
      dateNaiss: dto.dateNaiss,
      sexe: _parseGender(dto.sexe),
      ageInt: _parseAgeRange(dto.ageInt),
      etatCivil: _parseMaritalStatus(dto.etatCivil),
      origine: _parseOrigin(dto.origine),
      lieuDeResidence: _parseResidenceLocation(dto.lieuDeResidence),
      villeDeResidence: _parseResidenceCity(dto.villeDeResidence),
      typeProf: _parseProfessionType(dto.typeProf),
      nvSocioeconomique: _parseSocioeconomicLevel(dto.nvSocioeconomique),
      nvScolaire: _parseEducationLevel(dto.nvScolaire),
      idSec: dto.idSec,
      dateCreated: DateTime.parse(dto.date),
      requestForDeletion: dto.requestForDeletion,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static PatientGender _parseGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'masculin':
        return PatientGender.masculin;
      case 'feminin':
        return PatientGender.feminin;
      default:
        return PatientGender.masculin;
    }
  }

  static AgeRange _parseAgeRange(String ageRange) {
    switch (ageRange) {
      case '18-29':
        return AgeRange.age18to29;
      case '30-39':
        return AgeRange.age30to39;
      case '40-49':
        return AgeRange.age40to49;
      case '50-59':
        return AgeRange.age50to59;
      case '60+':
        return AgeRange.age60Plus;
      default:
        return AgeRange.age18to29;
    }
  }

  static MaritalStatus _parseMaritalStatus(String status) {
    switch (status) {
      case 'célibataire':
        return MaritalStatus.celibataire;
      case 'marié':
        return MaritalStatus.marie;
      case 'divorcé':
        return MaritalStatus.divorce;
      case 'veuf/veuve':
        return MaritalStatus.veuf;
      default:
        return MaritalStatus.celibataire;
    }
  }

  static Origin _parseOrigin(String origin) {
    switch (origin) {
      case 'urbaine':
        return Origin.urbaine;
      case 'rurale':
        return Origin.rurale;
      default:
        return Origin.urbaine;
    }
  }

  static ResidenceLocation _parseResidenceLocation(String location) {
    switch (location) {
      case 'en famille':
        return ResidenceLocation.enFamille;
      case 'seul':
        return ResidenceLocation.seul;
      case 'foyer':
        return ResidenceLocation.foyer;
      default:
        return ResidenceLocation.enFamille;
    }
  }

  static ResidenceCity _parseResidenceCity(String city) {
    switch (city) {
      case 'centre':
        return ResidenceCity.centre;
      case 'nord':
        return ResidenceCity.nord;
      case 'sud':
        return ResidenceCity.sud;
      case 'est':
        return ResidenceCity.est;
      case 'ouest':
        return ResidenceCity.ouest;
      default:
        return ResidenceCity.centre;
    }
  }

  static ProfessionType _parseProfessionType(String type) {
    switch (type) {
      case 'reguliere':
        return ProfessionType.reguliere;
      case 'irreguliere':
        return ProfessionType.irreguliere;
      case 'sans emploi':
        return ProfessionType.sansEmploi;
      default:
        return ProfessionType.reguliere;
    }
  }

  static SocioeconomicLevel _parseSocioeconomicLevel(String level) {
    switch (level) {
      case 'faible':
        return SocioeconomicLevel.faible;
      case 'moyen':
        return SocioeconomicLevel.moyen;
      case 'élévé':
        return SocioeconomicLevel.eleve;
      default:
        return SocioeconomicLevel.moyen;
    }
  }

  static EducationLevel _parseEducationLevel(String level) {
    switch (level) {
      case 'primaire':
        return EducationLevel.primaire;
      case 'secondaire':
        return EducationLevel.secondaire;
      case 'universitaire':
        return EducationLevel.universitaire;
      case 'aucun':
        return EducationLevel.aucun;
      default:
        return EducationLevel.secondaire;
    }
  }
}

class PatientAppointmentMapper {
  static PatientAppointment fromDto(PatientAppointmentDto dto) {
    return PatientAppointment(
      id: dto.id,
      rdvId: dto.rdvId,
      doctor: PatientDoctorMapper.fromDto(dto.doctor),
      patientId: dto.patientId,
      date: DateTime.parse(dto.date),
      heure: dto.heure,
      linkedConsultation: dto.linkedConsultation,
      status: _parseAppointmentStatus(dto.status),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static AppointmentStatus _parseAppointmentStatus(String status) {
    switch (status) {
      case 'en attente':
        return AppointmentStatus.enAttente;
      case 'terminé':
        return AppointmentStatus.termine;
      case 'annulé':
        return AppointmentStatus.annule;
      case 'confirmé':
        return AppointmentStatus.confirme;
      default:
        return AppointmentStatus.enAttente;
    }
  }
}

class PatientDoctorMapper {
  static PatientDoctor fromDto(DoctorDto dto) {
    return PatientDoctor(
      id: dto.id,
      nom: dto.nom,
      prenom: dto.prenom,
      cin: dto.cin,
      role: dto.role,
    );
  }
}

class PatientConsultationMapper {
  static PatientConsultation fromDto(PatientConsultationDto dto) {
    return PatientConsultation(
      id: dto.id,
      numConsult: dto.numConsult,
      numDossier: dto.numDossier,
      doctor: dto.doctor != null ? PatientDoctorMapper.fromDto(dto.doctor!) : null,
      dateHeure: DateTime.parse(dto.dateHeure),
      diagnosticRetenu: dto.diagnosticRetenu,
      remarque: dto.remarque,
      predictionGeneree: dto.predictionGeneree,
      predictionRisque: dto.predictionRisque,
      nomMed: dto.nomMed,
      prenMed: dto.prenMed,
      addiction: dto.addiction,
      tabac: dto.tabac,
      alcool: dto.alcool,
      cannabis: dto.cannabis,
      medicaments: dto.medicaments,
      atcdsPTs: dto.atcdsPTs,
      ideesSuiAnt: dto.ideesSuiAnt,
      hospitAnt: dto.hospitAnt,
      etatdepressif: dto.etatdepressif,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
} 