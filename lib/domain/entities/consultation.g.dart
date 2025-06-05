// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationPatientInfoImpl _$$ConsultationPatientInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsultationPatientInfoImpl(
      id: json['_id'] as String?,
      nomPatient: json['nom_patient'] as String,
      prenPatient: json['pren_patient'] as String,
      cinCnam: (json['cin_cnam'] as num?)?.toInt(),
      dateNaiss: json['date_naiss'] as String?,
      ageInt: json['age_int'] as String?,
      telephone: (json['telephone'] as num?)?.toInt(),
      sexe: json['sexe'] as String?,
      etatcivil: json['etatcivil'] as String?,
      origine: json['origine'] as String?,
      lieuderesidence: json['lieuderesidence'] as String?,
      villederesidence: json['villederesidence'] as String?,
      nvscolaire: json['nvscolaire'] as String?,
      typeProf: json['type_prof'] as String?,
      nvSocioeconomique: json['nv_socioeconomique'] as String?,
    );

Map<String, dynamic> _$$ConsultationPatientInfoImplToJson(
        _$ConsultationPatientInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nom_patient': instance.nomPatient,
      'pren_patient': instance.prenPatient,
      'cin_cnam': instance.cinCnam,
      'date_naiss': instance.dateNaiss,
      'age_int': instance.ageInt,
      'telephone': instance.telephone,
      'sexe': instance.sexe,
      'etatcivil': instance.etatcivil,
      'origine': instance.origine,
      'lieuderesidence': instance.lieuderesidence,
      'villederesidence': instance.villederesidence,
      'nvscolaire': instance.nvscolaire,
      'type_prof': instance.typeProf,
      'nv_socioeconomique': instance.nvSocioeconomique,
    };

_$CreateConsultationDtoImpl _$$CreateConsultationDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateConsultationDtoImpl(
      numDossier: json['num_dossier'] as String,
      idMed: json['id_med'] as String?,
      date: json['date'] as String?,
      addiction: json['addiction'] as bool,
      tabac: json['TABAC'] as bool,
      alcool: json['alcool'] as bool,
      cannabis: json['cannabis'] as bool,
      medicaments: json['medicaments'] as bool,
      solvantsorg: json['solvantsorg'] as bool,
      atcdsPTs: json['AtcdsP_TS'] as bool,
      ideesSuiAnt: json['idees_sui_ant'] as bool,
      hospitAnt: json['hospit_ant'] as bool,
      atcdsFamSui: json['atcdsFam_SUI'] as bool,
      suicideAccompli: json['suicide_accompli'] as bool,
      atcdsPSomatik: json['AtcdsP_somatik'] as bool,
      condImpulsiv: json['cond_impulsiv'] as bool,
      automit: json['automit'] as bool,
      atcdsPJudic: json['atcds_p_judic'] as bool,
      immolation: json['immolation'] as bool,
      moyenphlebotomie: json['moyenphlebotomie'] as bool,
      mpendaison: json['Mpendaison'] as bool,
      mmedicaments: json['Mmedicaments'] as bool,
      mstrangulation: json['Mstrangulation'] as bool,
      mingestiontox: json['Mingestiontox'] as bool,
      equiSui: json['EQUIsui'] as bool,
      sautaltitude: json['sautaltitude'] as bool,
      mautres: json['Mautres'] as bool,
      nombresHospit: json['nombres_hospit'] as String,
      familleContenante: json['famille_contenante'] as bool,
      typeAtcdspsy: json['type_atcdspsy'] as String,
      diagnosticRetenu: json['diagnostic_retenu'] as String,
      typePersonn: json['type_personn'] as String,
      reactionStress: json['reaction_stress'] as bool,
      injoncSuicidaires: json['injonc_suicidaires'] as bool,
      angoissePsychotique: json['angoisse_psychotique'] as bool,
      etatdepressif: json['etatdepressif'] as bool,
      nbresDeTs: json['nbres_de_ts'] as String,
      anciennetemaladie: json['anciennetemaladie'] as String,
      agedebutannee: json['agedebutannee'] as String,
      motifTs: json['motifTS'] as bool,
      remarque: json['remarque'] as String?,
    );

Map<String, dynamic> _$$CreateConsultationDtoImplToJson(
        _$CreateConsultationDtoImpl instance) =>
    <String, dynamic>{
      'num_dossier': instance.numDossier,
      'id_med': instance.idMed,
      'date': instance.date,
      'addiction': instance.addiction,
      'TABAC': instance.tabac,
      'alcool': instance.alcool,
      'cannabis': instance.cannabis,
      'medicaments': instance.medicaments,
      'solvantsorg': instance.solvantsorg,
      'AtcdsP_TS': instance.atcdsPTs,
      'idees_sui_ant': instance.ideesSuiAnt,
      'hospit_ant': instance.hospitAnt,
      'atcdsFam_SUI': instance.atcdsFamSui,
      'suicide_accompli': instance.suicideAccompli,
      'AtcdsP_somatik': instance.atcdsPSomatik,
      'cond_impulsiv': instance.condImpulsiv,
      'automit': instance.automit,
      'atcds_p_judic': instance.atcdsPJudic,
      'immolation': instance.immolation,
      'moyenphlebotomie': instance.moyenphlebotomie,
      'Mpendaison': instance.mpendaison,
      'Mmedicaments': instance.mmedicaments,
      'Mstrangulation': instance.mstrangulation,
      'Mingestiontox': instance.mingestiontox,
      'EQUIsui': instance.equiSui,
      'sautaltitude': instance.sautaltitude,
      'Mautres': instance.mautres,
      'nombres_hospit': instance.nombresHospit,
      'famille_contenante': instance.familleContenante,
      'type_atcdspsy': instance.typeAtcdspsy,
      'diagnostic_retenu': instance.diagnosticRetenu,
      'type_personn': instance.typePersonn,
      'reaction_stress': instance.reactionStress,
      'injonc_suicidaires': instance.injoncSuicidaires,
      'angoisse_psychotique': instance.angoissePsychotique,
      'etatdepressif': instance.etatdepressif,
      'nbres_de_ts': instance.nbresDeTs,
      'anciennetemaladie': instance.anciennetemaladie,
      'agedebutannee': instance.agedebutannee,
      'motifTS': instance.motifTs,
      'remarque': instance.remarque,
    };

_$CreateConsultationFromAppointmentDtoImpl
    _$$CreateConsultationFromAppointmentDtoImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateConsultationFromAppointmentDtoImpl(
          appointmentId: json['appointmentId'] as String,
          consultationData: CreateConsultationDto.fromJson(
              json['consultationData'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$CreateConsultationFromAppointmentDtoImplToJson(
        _$CreateConsultationFromAppointmentDtoImpl instance) =>
    <String, dynamic>{
      'appointmentId': instance.appointmentId,
      'consultationData': instance.consultationData,
    };

_$CreateConsultationResponseImpl _$$CreateConsultationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateConsultationResponseImpl(
      message: json['message'] as String?,
      consultationId: json['consultationId'] as String?,
      appointmentId: json['appointmentId'] as String?,
    );

Map<String, dynamic> _$$CreateConsultationResponseImplToJson(
        _$CreateConsultationResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'consultationId': instance.consultationId,
      'appointmentId': instance.appointmentId,
    };
