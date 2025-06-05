// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatePatientRequestImpl _$$CreatePatientRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePatientRequestImpl(
      nomPatient: json['nomPatient'] as String,
      prenPatient: json['prenPatient'] as String,
      cinCnam: (json['cinCnam'] as num?)?.toInt(),
      telephone: (json['telephone'] as num?)?.toInt(),
      dateNaiss: json['dateNaiss'] as String?,
      sexe: $enumDecode(_$PatientGenderEnumMap, json['sexe']),
      ageInt: $enumDecode(_$AgeRangeEnumMap, json['ageInt']),
      etatcivil: $enumDecode(_$MaritalStatusEnumMap, json['etatcivil']),
      origine: $enumDecode(_$OriginEnumMap, json['origine']),
      lieuderesidence:
          $enumDecode(_$LivingSituationEnumMap, json['lieuderesidence']),
      villederesidence:
          $enumDecode(_$CityOfResidenceEnumMap, json['villederesidence']),
      nvscolaire: $enumDecode(_$EducationLevelEnumMap, json['nvscolaire']),
      typeProf: $enumDecode(_$ProfessionTypeEnumMap, json['typeProf']),
      nvSocioeconomique:
          $enumDecode(_$SocioeconomicLevelEnumMap, json['nvSocioeconomique']),
      idSec: json['idSec'] as String?,
    );

Map<String, dynamic> _$$CreatePatientRequestImplToJson(
        _$CreatePatientRequestImpl instance) =>
    <String, dynamic>{
      'nomPatient': instance.nomPatient,
      'prenPatient': instance.prenPatient,
      'cinCnam': instance.cinCnam,
      'telephone': instance.telephone,
      'dateNaiss': instance.dateNaiss,
      'sexe': _$PatientGenderEnumMap[instance.sexe]!,
      'ageInt': _$AgeRangeEnumMap[instance.ageInt]!,
      'etatcivil': _$MaritalStatusEnumMap[instance.etatcivil]!,
      'origine': _$OriginEnumMap[instance.origine]!,
      'lieuderesidence': _$LivingSituationEnumMap[instance.lieuderesidence]!,
      'villederesidence': _$CityOfResidenceEnumMap[instance.villederesidence]!,
      'nvscolaire': _$EducationLevelEnumMap[instance.nvscolaire]!,
      'typeProf': _$ProfessionTypeEnumMap[instance.typeProf]!,
      'nvSocioeconomique':
          _$SocioeconomicLevelEnumMap[instance.nvSocioeconomique]!,
      'idSec': instance.idSec,
    };

const _$PatientGenderEnumMap = {
  PatientGender.feminin: 'feminin',
  PatientGender.masculin: 'masculin',
};

const _$AgeRangeEnumMap = {
  AgeRange.age18to29: '18-29',
  AgeRange.age30to39: '30-39',
  AgeRange.age40to49: '40-49',
  AgeRange.age50to59: '50-59',
  AgeRange.age60Plus: '>=60',
};

const _$MaritalStatusEnumMap = {
  MaritalStatus.divorce: 'divorcé',
  MaritalStatus.celibataire: 'célibataire',
  MaritalStatus.marie: 'marié',
  MaritalStatus.voeuf: 'voeuf',
};

const _$OriginEnumMap = {
  Origin.urbaine: 'urbaine',
  Origin.rurale: 'rurale',
};

const _$LivingSituationEnumMap = {
  LivingSituation.seule: 'seule',
  LivingSituation.enFamille: 'en famille',
};

const _$CityOfResidenceEnumMap = {
  CityOfResidence.sud: 'sud',
  CityOfResidence.centre: 'centre',
};

const _$EducationLevelEnumMap = {
  EducationLevel.secondaire: 'secondaire',
  EducationLevel.universitaire: 'universitaire',
  EducationLevel.analphabete: 'analphabète',
  EducationLevel.primaire: 'primaire',
};

const _$ProfessionTypeEnumMap = {
  ProfessionType.irreguliere: 'irreguliere',
  ProfessionType.chomage: 'chomage',
  ProfessionType.reguliere: 'reguliere',
  ProfessionType.retraite: 'retraite',
  ProfessionType.eleve: 'eleve',
};

const _$SocioeconomicLevelEnumMap = {
  SocioeconomicLevel.moyen: 'moyen',
  SocioeconomicLevel.bas: 'bas',
};

_$UpdatePatientRequestImpl _$$UpdatePatientRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePatientRequestImpl(
      nomPatient: json['nomPatient'] as String?,
      prenPatient: json['prenPatient'] as String?,
      cinCnam: (json['cinCnam'] as num?)?.toInt(),
      telephone: (json['telephone'] as num?)?.toInt(),
      dateNaiss: json['dateNaiss'] as String?,
      sexe: $enumDecodeNullable(_$PatientGenderEnumMap, json['sexe']),
      ageInt: $enumDecodeNullable(_$AgeRangeEnumMap, json['ageInt']),
      etatcivil: $enumDecodeNullable(_$MaritalStatusEnumMap, json['etatcivil']),
      origine: $enumDecodeNullable(_$OriginEnumMap, json['origine']),
      lieuderesidence: $enumDecodeNullable(
          _$LivingSituationEnumMap, json['lieuderesidence']),
      villederesidence: $enumDecodeNullable(
          _$CityOfResidenceEnumMap, json['villederesidence']),
      nvscolaire:
          $enumDecodeNullable(_$EducationLevelEnumMap, json['nvscolaire']),
      typeProf: $enumDecodeNullable(_$ProfessionTypeEnumMap, json['typeProf']),
      nvSocioeconomique: $enumDecodeNullable(
          _$SocioeconomicLevelEnumMap, json['nvSocioeconomique']),
      idSec: json['idSec'] as String?,
    );

Map<String, dynamic> _$$UpdatePatientRequestImplToJson(
        _$UpdatePatientRequestImpl instance) =>
    <String, dynamic>{
      'nomPatient': instance.nomPatient,
      'prenPatient': instance.prenPatient,
      'cinCnam': instance.cinCnam,
      'telephone': instance.telephone,
      'dateNaiss': instance.dateNaiss,
      'sexe': _$PatientGenderEnumMap[instance.sexe],
      'ageInt': _$AgeRangeEnumMap[instance.ageInt],
      'etatcivil': _$MaritalStatusEnumMap[instance.etatcivil],
      'origine': _$OriginEnumMap[instance.origine],
      'lieuderesidence': _$LivingSituationEnumMap[instance.lieuderesidence],
      'villederesidence': _$CityOfResidenceEnumMap[instance.villederesidence],
      'nvscolaire': _$EducationLevelEnumMap[instance.nvscolaire],
      'typeProf': _$ProfessionTypeEnumMap[instance.typeProf],
      'nvSocioeconomique':
          _$SocioeconomicLevelEnumMap[instance.nvSocioeconomique],
      'idSec': instance.idSec,
    };

_$RequestPatientDeletionRequestImpl
    _$$RequestPatientDeletionRequestImplFromJson(Map<String, dynamic> json) =>
        _$RequestPatientDeletionRequestImpl(
          reason: json['reason'] as String,
        );

Map<String, dynamic> _$$RequestPatientDeletionRequestImplToJson(
        _$RequestPatientDeletionRequestImpl instance) =>
    <String, dynamic>{
      'reason': instance.reason,
    };
