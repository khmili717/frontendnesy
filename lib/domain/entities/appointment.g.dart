// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentImpl _$$AppointmentImplFromJson(Map<String, dynamic> json) =>
    _$AppointmentImpl(
      id: json['_id'] as String?,
      rdvId: json['rdv_id'] as String?,
      doctor: DoctorInfo.fromJson(json['id_med'] as Map<String, dynamic>),
      patient:
          PatientInfo.fromJson(json['id_num_dossier'] as Map<String, dynamic>),
      date: json['date'] as String,
      heure: json['heure'] as String,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']) ??
          AppointmentStatus.enAttente,
      linkedConsultation: json['linkedConsultation'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AppointmentImplToJson(_$AppointmentImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rdv_id': instance.rdvId,
      'id_med': instance.doctor,
      'id_num_dossier': instance.patient,
      'date': instance.date,
      'heure': instance.heure,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'linkedConsultation': instance.linkedConsultation,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.enAttente: 'en attente',
  AppointmentStatus.reserve: 'réservé',
  AppointmentStatus.annule: 'annulé',
  AppointmentStatus.termine: 'terminé',
  AppointmentStatus.enCours: 'en cours',
  AppointmentStatus.complete: 'complété',
};

_$DoctorAppointmentImpl _$$DoctorAppointmentImplFromJson(
        Map<String, dynamic> json) =>
    _$DoctorAppointmentImpl(
      id: json['_id'] as String?,
      rdvId: json['rdv_id'] as String?,
      doctorId: json['id_med'] as String,
      patient:
          PatientInfo.fromJson(json['id_num_dossier'] as Map<String, dynamic>),
      date: json['date'] as String,
      heure: json['heure'] as String,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']) ??
          AppointmentStatus.enAttente,
      linkedConsultation: json['linkedConsultation'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DoctorAppointmentImplToJson(
        _$DoctorAppointmentImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rdv_id': instance.rdvId,
      'id_med': instance.doctorId,
      'id_num_dossier': instance.patient,
      'date': instance.date,
      'heure': instance.heure,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'linkedConsultation': instance.linkedConsultation,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$DoctorInfoImpl _$$DoctorInfoImplFromJson(Map<String, dynamic> json) =>
    _$DoctorInfoImpl(
      id: json['_id'] as String?,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      cin: (json['cin'] as num).toInt(),
      role: json['role'] as String,
    );

Map<String, dynamic> _$$DoctorInfoImplToJson(_$DoctorInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'cin': instance.cin,
      'role': instance.role,
    };

_$PatientInfoImpl _$$PatientInfoImplFromJson(Map<String, dynamic> json) =>
    _$PatientInfoImpl(
      id: json['_id'] as String?,
      nomPatient: json['nom_patient'] as String?,
      prenPatient: json['pren_patient'] as String?,
      cinCnam: (json['cin_cnam'] as num?)?.toInt(),
      tel: (json['tel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PatientInfoImplToJson(_$PatientInfoImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'nom_patient': instance.nomPatient,
      'pren_patient': instance.prenPatient,
      'cin_cnam': instance.cinCnam,
      'tel': instance.tel,
    };

_$CreateAppointmentRequestImpl _$$CreateAppointmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAppointmentRequestImpl(
      idMed: json['idMed'] as String,
      idNumDossier: json['idNumDossier'] as String,
      date: json['date'] as String,
      heure: json['heure'] as String,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$CreateAppointmentRequestImplToJson(
        _$CreateAppointmentRequestImpl instance) =>
    <String, dynamic>{
      'idMed': instance.idMed,
      'idNumDossier': instance.idNumDossier,
      'date': instance.date,
      'heure': instance.heure,
      'status': _$AppointmentStatusEnumMap[instance.status],
    };

_$UpdateAppointmentRequestImpl _$$UpdateAppointmentRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateAppointmentRequestImpl(
      idMed: json['idMed'] as String?,
      idNumDossier: json['idNumDossier'] as String?,
      date: json['date'] as String?,
      heure: json['heure'] as String?,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$UpdateAppointmentRequestImplToJson(
        _$UpdateAppointmentRequestImpl instance) =>
    <String, dynamic>{
      'idMed': instance.idMed,
      'idNumDossier': instance.idNumDossier,
      'date': instance.date,
      'heure': instance.heure,
      'status': _$AppointmentStatusEnumMap[instance.status],
    };

_$CreateAppointmentResponseImpl _$$CreateAppointmentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAppointmentResponseImpl(
      id: json['_id'] as String?,
      rdvId: json['rdv_id'] as String?,
      doctorId: json['id_med'] as String,
      patientId: json['id_num_dossier'] as String,
      date: json['date'] as String,
      heure: json['heure'] as String,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']) ??
          AppointmentStatus.enAttente,
      linkedConsultation: json['linkedConsultation'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CreateAppointmentResponseImplToJson(
        _$CreateAppointmentResponseImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rdv_id': instance.rdvId,
      'id_med': instance.doctorId,
      'id_num_dossier': instance.patientId,
      'date': instance.date,
      'heure': instance.heure,
      'status': _$AppointmentStatusEnumMap[instance.status]!,
      'linkedConsultation': instance.linkedConsultation,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
