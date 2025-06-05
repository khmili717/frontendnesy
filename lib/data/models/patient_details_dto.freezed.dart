// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PatientDetailsDto {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_dossier')
  String get numDossier => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom_patient')
  String get nomPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'pren_patient')
  String get prenPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'cin_cnam')
  int get cinCnam => throw _privateConstructorUsedError;
  int get tel => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_naiss')
  String get dateNaiss => throw _privateConstructorUsedError;
  String get sexe => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_int')
  String get ageInt => throw _privateConstructorUsedError;
  @JsonKey(name: 'etat_civil')
  String get etatCivil => throw _privateConstructorUsedError;
  String get origine => throw _privateConstructorUsedError;
  @JsonKey(name: 'lieu_de_residence')
  String get lieuDeResidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'ville_de_residence')
  String get villeDeResidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_prof')
  String get typeProf => throw _privateConstructorUsedError;
  @JsonKey(name: 'nv_socioeconomique')
  String get nvSocioeconomique => throw _privateConstructorUsedError;
  @JsonKey(name: 'nv_scolaire')
  String get nvScolaire => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_sec')
  String? get idSec => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'request_for_deletion')
  bool get requestForDeletion => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of PatientDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientDetailsDtoCopyWith<PatientDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDetailsDtoCopyWith<$Res> {
  factory $PatientDetailsDtoCopyWith(
          PatientDetailsDto value, $Res Function(PatientDetailsDto) then) =
      _$PatientDetailsDtoCopyWithImpl<$Res, PatientDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'num_dossier') String numDossier,
      @JsonKey(name: 'nom_patient') String nomPatient,
      @JsonKey(name: 'pren_patient') String prenPatient,
      @JsonKey(name: 'cin_cnam') int cinCnam,
      int tel,
      @JsonKey(name: 'date_naiss') String dateNaiss,
      String sexe,
      @JsonKey(name: 'age_int') String ageInt,
      @JsonKey(name: 'etat_civil') String etatCivil,
      String origine,
      @JsonKey(name: 'lieu_de_residence') String lieuDeResidence,
      @JsonKey(name: 'ville_de_residence') String villeDeResidence,
      @JsonKey(name: 'type_prof') String typeProf,
      @JsonKey(name: 'nv_socioeconomique') String nvSocioeconomique,
      @JsonKey(name: 'nv_scolaire') String nvScolaire,
      @JsonKey(name: 'id_sec') String? idSec,
      String date,
      @JsonKey(name: 'request_for_deletion') bool requestForDeletion,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PatientDetailsDtoCopyWithImpl<$Res, $Val extends PatientDetailsDto>
    implements $PatientDetailsDtoCopyWith<$Res> {
  _$PatientDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numDossier = null,
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = null,
    Object? tel = null,
    Object? dateNaiss = null,
    Object? sexe = null,
    Object? ageInt = null,
    Object? etatCivil = null,
    Object? origine = null,
    Object? lieuDeResidence = null,
    Object? villeDeResidence = null,
    Object? typeProf = null,
    Object? nvSocioeconomique = null,
    Object? nvScolaire = null,
    Object? idSec = freezed,
    Object? date = null,
    Object? requestForDeletion = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numDossier: null == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String,
      nomPatient: null == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String,
      prenPatient: null == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String,
      cinCnam: null == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as int,
      dateNaiss: null == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String,
      ageInt: null == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as String,
      etatCivil: null == etatCivil
          ? _value.etatCivil
          : etatCivil // ignore: cast_nullable_to_non_nullable
              as String,
      origine: null == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as String,
      lieuDeResidence: null == lieuDeResidence
          ? _value.lieuDeResidence
          : lieuDeResidence // ignore: cast_nullable_to_non_nullable
              as String,
      villeDeResidence: null == villeDeResidence
          ? _value.villeDeResidence
          : villeDeResidence // ignore: cast_nullable_to_non_nullable
              as String,
      typeProf: null == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as String,
      nvSocioeconomique: null == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as String,
      nvScolaire: null == nvScolaire
          ? _value.nvScolaire
          : nvScolaire // ignore: cast_nullable_to_non_nullable
              as String,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      requestForDeletion: null == requestForDeletion
          ? _value.requestForDeletion
          : requestForDeletion // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatientDetailsDtoImplCopyWith<$Res>
    implements $PatientDetailsDtoCopyWith<$Res> {
  factory _$$PatientDetailsDtoImplCopyWith(_$PatientDetailsDtoImpl value,
          $Res Function(_$PatientDetailsDtoImpl) then) =
      __$$PatientDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'num_dossier') String numDossier,
      @JsonKey(name: 'nom_patient') String nomPatient,
      @JsonKey(name: 'pren_patient') String prenPatient,
      @JsonKey(name: 'cin_cnam') int cinCnam,
      int tel,
      @JsonKey(name: 'date_naiss') String dateNaiss,
      String sexe,
      @JsonKey(name: 'age_int') String ageInt,
      @JsonKey(name: 'etat_civil') String etatCivil,
      String origine,
      @JsonKey(name: 'lieu_de_residence') String lieuDeResidence,
      @JsonKey(name: 'ville_de_residence') String villeDeResidence,
      @JsonKey(name: 'type_prof') String typeProf,
      @JsonKey(name: 'nv_socioeconomique') String nvSocioeconomique,
      @JsonKey(name: 'nv_scolaire') String nvScolaire,
      @JsonKey(name: 'id_sec') String? idSec,
      String date,
      @JsonKey(name: 'request_for_deletion') bool requestForDeletion,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PatientDetailsDtoImplCopyWithImpl<$Res>
    extends _$PatientDetailsDtoCopyWithImpl<$Res, _$PatientDetailsDtoImpl>
    implements _$$PatientDetailsDtoImplCopyWith<$Res> {
  __$$PatientDetailsDtoImplCopyWithImpl(_$PatientDetailsDtoImpl _value,
      $Res Function(_$PatientDetailsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numDossier = null,
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = null,
    Object? tel = null,
    Object? dateNaiss = null,
    Object? sexe = null,
    Object? ageInt = null,
    Object? etatCivil = null,
    Object? origine = null,
    Object? lieuDeResidence = null,
    Object? villeDeResidence = null,
    Object? typeProf = null,
    Object? nvSocioeconomique = null,
    Object? nvScolaire = null,
    Object? idSec = freezed,
    Object? date = null,
    Object? requestForDeletion = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatientDetailsDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numDossier: null == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String,
      nomPatient: null == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String,
      prenPatient: null == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String,
      cinCnam: null == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as int,
      dateNaiss: null == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String,
      ageInt: null == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as String,
      etatCivil: null == etatCivil
          ? _value.etatCivil
          : etatCivil // ignore: cast_nullable_to_non_nullable
              as String,
      origine: null == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as String,
      lieuDeResidence: null == lieuDeResidence
          ? _value.lieuDeResidence
          : lieuDeResidence // ignore: cast_nullable_to_non_nullable
              as String,
      villeDeResidence: null == villeDeResidence
          ? _value.villeDeResidence
          : villeDeResidence // ignore: cast_nullable_to_non_nullable
              as String,
      typeProf: null == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as String,
      nvSocioeconomique: null == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as String,
      nvScolaire: null == nvScolaire
          ? _value.nvScolaire
          : nvScolaire // ignore: cast_nullable_to_non_nullable
              as String,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      requestForDeletion: null == requestForDeletion
          ? _value.requestForDeletion
          : requestForDeletion // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PatientDetailsDtoImpl implements _PatientDetailsDto {
  const _$PatientDetailsDtoImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'num_dossier') required this.numDossier,
      @JsonKey(name: 'nom_patient') required this.nomPatient,
      @JsonKey(name: 'pren_patient') required this.prenPatient,
      @JsonKey(name: 'cin_cnam') required this.cinCnam,
      required this.tel,
      @JsonKey(name: 'date_naiss') required this.dateNaiss,
      required this.sexe,
      @JsonKey(name: 'age_int') required this.ageInt,
      @JsonKey(name: 'etat_civil') required this.etatCivil,
      required this.origine,
      @JsonKey(name: 'lieu_de_residence') required this.lieuDeResidence,
      @JsonKey(name: 'ville_de_residence') required this.villeDeResidence,
      @JsonKey(name: 'type_prof') required this.typeProf,
      @JsonKey(name: 'nv_socioeconomique') required this.nvSocioeconomique,
      @JsonKey(name: 'nv_scolaire') required this.nvScolaire,
      @JsonKey(name: 'id_sec') this.idSec,
      required this.date,
      @JsonKey(name: 'request_for_deletion') this.requestForDeletion = false,
      this.createdAt,
      this.updatedAt});

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'num_dossier')
  final String numDossier;
  @override
  @JsonKey(name: 'nom_patient')
  final String nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  final String prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  final int cinCnam;
  @override
  final int tel;
  @override
  @JsonKey(name: 'date_naiss')
  final String dateNaiss;
  @override
  final String sexe;
  @override
  @JsonKey(name: 'age_int')
  final String ageInt;
  @override
  @JsonKey(name: 'etat_civil')
  final String etatCivil;
  @override
  final String origine;
  @override
  @JsonKey(name: 'lieu_de_residence')
  final String lieuDeResidence;
  @override
  @JsonKey(name: 'ville_de_residence')
  final String villeDeResidence;
  @override
  @JsonKey(name: 'type_prof')
  final String typeProf;
  @override
  @JsonKey(name: 'nv_socioeconomique')
  final String nvSocioeconomique;
  @override
  @JsonKey(name: 'nv_scolaire')
  final String nvScolaire;
  @override
  @JsonKey(name: 'id_sec')
  final String? idSec;
  @override
  final String date;
  @override
  @JsonKey(name: 'request_for_deletion')
  final bool requestForDeletion;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PatientDetailsDto(id: $id, numDossier: $numDossier, nomPatient: $nomPatient, prenPatient: $prenPatient, cinCnam: $cinCnam, tel: $tel, dateNaiss: $dateNaiss, sexe: $sexe, ageInt: $ageInt, etatCivil: $etatCivil, origine: $origine, lieuDeResidence: $lieuDeResidence, villeDeResidence: $villeDeResidence, typeProf: $typeProf, nvSocioeconomique: $nvSocioeconomique, nvScolaire: $nvScolaire, idSec: $idSec, date: $date, requestForDeletion: $requestForDeletion, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientDetailsDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numDossier, numDossier) ||
                other.numDossier == numDossier) &&
            (identical(other.nomPatient, nomPatient) ||
                other.nomPatient == nomPatient) &&
            (identical(other.prenPatient, prenPatient) ||
                other.prenPatient == prenPatient) &&
            (identical(other.cinCnam, cinCnam) || other.cinCnam == cinCnam) &&
            (identical(other.tel, tel) || other.tel == tel) &&
            (identical(other.dateNaiss, dateNaiss) ||
                other.dateNaiss == dateNaiss) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.ageInt, ageInt) || other.ageInt == ageInt) &&
            (identical(other.etatCivil, etatCivil) ||
                other.etatCivil == etatCivil) &&
            (identical(other.origine, origine) || other.origine == origine) &&
            (identical(other.lieuDeResidence, lieuDeResidence) ||
                other.lieuDeResidence == lieuDeResidence) &&
            (identical(other.villeDeResidence, villeDeResidence) ||
                other.villeDeResidence == villeDeResidence) &&
            (identical(other.typeProf, typeProf) ||
                other.typeProf == typeProf) &&
            (identical(other.nvSocioeconomique, nvSocioeconomique) ||
                other.nvSocioeconomique == nvSocioeconomique) &&
            (identical(other.nvScolaire, nvScolaire) ||
                other.nvScolaire == nvScolaire) &&
            (identical(other.idSec, idSec) || other.idSec == idSec) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.requestForDeletion, requestForDeletion) ||
                other.requestForDeletion == requestForDeletion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        numDossier,
        nomPatient,
        prenPatient,
        cinCnam,
        tel,
        dateNaiss,
        sexe,
        ageInt,
        etatCivil,
        origine,
        lieuDeResidence,
        villeDeResidence,
        typeProf,
        nvSocioeconomique,
        nvScolaire,
        idSec,
        date,
        requestForDeletion,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of PatientDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDetailsDtoImplCopyWith<_$PatientDetailsDtoImpl> get copyWith =>
      __$$PatientDetailsDtoImplCopyWithImpl<_$PatientDetailsDtoImpl>(
          this, _$identity);
}

abstract class _PatientDetailsDto implements PatientDetailsDto {
  const factory _PatientDetailsDto(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'num_dossier') required final String numDossier,
      @JsonKey(name: 'nom_patient') required final String nomPatient,
      @JsonKey(name: 'pren_patient') required final String prenPatient,
      @JsonKey(name: 'cin_cnam') required final int cinCnam,
      required final int tel,
      @JsonKey(name: 'date_naiss') required final String dateNaiss,
      required final String sexe,
      @JsonKey(name: 'age_int') required final String ageInt,
      @JsonKey(name: 'etat_civil') required final String etatCivil,
      required final String origine,
      @JsonKey(name: 'lieu_de_residence') required final String lieuDeResidence,
      @JsonKey(name: 'ville_de_residence')
      required final String villeDeResidence,
      @JsonKey(name: 'type_prof') required final String typeProf,
      @JsonKey(name: 'nv_socioeconomique')
      required final String nvSocioeconomique,
      @JsonKey(name: 'nv_scolaire') required final String nvScolaire,
      @JsonKey(name: 'id_sec') final String? idSec,
      required final String date,
      @JsonKey(name: 'request_for_deletion') final bool requestForDeletion,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PatientDetailsDtoImpl;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'num_dossier')
  String get numDossier;
  @override
  @JsonKey(name: 'nom_patient')
  String get nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  String get prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  int get cinCnam;
  @override
  int get tel;
  @override
  @JsonKey(name: 'date_naiss')
  String get dateNaiss;
  @override
  String get sexe;
  @override
  @JsonKey(name: 'age_int')
  String get ageInt;
  @override
  @JsonKey(name: 'etat_civil')
  String get etatCivil;
  @override
  String get origine;
  @override
  @JsonKey(name: 'lieu_de_residence')
  String get lieuDeResidence;
  @override
  @JsonKey(name: 'ville_de_residence')
  String get villeDeResidence;
  @override
  @JsonKey(name: 'type_prof')
  String get typeProf;
  @override
  @JsonKey(name: 'nv_socioeconomique')
  String get nvSocioeconomique;
  @override
  @JsonKey(name: 'nv_scolaire')
  String get nvScolaire;
  @override
  @JsonKey(name: 'id_sec')
  String? get idSec;
  @override
  String get date;
  @override
  @JsonKey(name: 'request_for_deletion')
  bool get requestForDeletion;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PatientDetailsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDetailsDtoImplCopyWith<_$PatientDetailsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PatientAppointmentDto {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'rdv_id')
  String get rdvId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_med')
  DoctorDto get doctor => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_num_dossier')
  String get patientId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get heure => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of PatientAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientAppointmentDtoCopyWith<PatientAppointmentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientAppointmentDtoCopyWith<$Res> {
  factory $PatientAppointmentDtoCopyWith(PatientAppointmentDto value,
          $Res Function(PatientAppointmentDto) then) =
      _$PatientAppointmentDtoCopyWithImpl<$Res, PatientAppointmentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'rdv_id') String rdvId,
      @JsonKey(name: 'id_med') DoctorDto doctor,
      @JsonKey(name: 'id_num_dossier') String patientId,
      String date,
      String heure,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});

  $DoctorDtoCopyWith<$Res> get doctor;
}

/// @nodoc
class _$PatientAppointmentDtoCopyWithImpl<$Res,
        $Val extends PatientAppointmentDto>
    implements $PatientAppointmentDtoCopyWith<$Res> {
  _$PatientAppointmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rdvId = null,
    Object? doctor = null,
    Object? patientId = null,
    Object? date = null,
    Object? heure = null,
    Object? linkedConsultation = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rdvId: null == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorDto,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of PatientAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorDtoCopyWith<$Res> get doctor {
    return $DoctorDtoCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientAppointmentDtoImplCopyWith<$Res>
    implements $PatientAppointmentDtoCopyWith<$Res> {
  factory _$$PatientAppointmentDtoImplCopyWith(
          _$PatientAppointmentDtoImpl value,
          $Res Function(_$PatientAppointmentDtoImpl) then) =
      __$$PatientAppointmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'rdv_id') String rdvId,
      @JsonKey(name: 'id_med') DoctorDto doctor,
      @JsonKey(name: 'id_num_dossier') String patientId,
      String date,
      String heure,
      @JsonKey(name: 'linkedConsultation') String? linkedConsultation,
      String status,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $DoctorDtoCopyWith<$Res> get doctor;
}

/// @nodoc
class __$$PatientAppointmentDtoImplCopyWithImpl<$Res>
    extends _$PatientAppointmentDtoCopyWithImpl<$Res,
        _$PatientAppointmentDtoImpl>
    implements _$$PatientAppointmentDtoImplCopyWith<$Res> {
  __$$PatientAppointmentDtoImplCopyWithImpl(_$PatientAppointmentDtoImpl _value,
      $Res Function(_$PatientAppointmentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rdvId = null,
    Object? doctor = null,
    Object? patientId = null,
    Object? date = null,
    Object? heure = null,
    Object? linkedConsultation = freezed,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatientAppointmentDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rdvId: null == rdvId
          ? _value.rdvId
          : rdvId // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: null == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorDto,
      patientId: null == patientId
          ? _value.patientId
          : patientId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      heure: null == heure
          ? _value.heure
          : heure // ignore: cast_nullable_to_non_nullable
              as String,
      linkedConsultation: freezed == linkedConsultation
          ? _value.linkedConsultation
          : linkedConsultation // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PatientAppointmentDtoImpl implements _PatientAppointmentDto {
  const _$PatientAppointmentDtoImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'rdv_id') required this.rdvId,
      @JsonKey(name: 'id_med') required this.doctor,
      @JsonKey(name: 'id_num_dossier') required this.patientId,
      required this.date,
      required this.heure,
      @JsonKey(name: 'linkedConsultation') this.linkedConsultation,
      required this.status,
      this.createdAt,
      this.updatedAt});

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'rdv_id')
  final String rdvId;
  @override
  @JsonKey(name: 'id_med')
  final DoctorDto doctor;
  @override
  @JsonKey(name: 'id_num_dossier')
  final String patientId;
  @override
  final String date;
  @override
  final String heure;
  @override
  @JsonKey(name: 'linkedConsultation')
  final String? linkedConsultation;
  @override
  final String status;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PatientAppointmentDto(id: $id, rdvId: $rdvId, doctor: $doctor, patientId: $patientId, date: $date, heure: $heure, linkedConsultation: $linkedConsultation, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientAppointmentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rdvId, rdvId) || other.rdvId == rdvId) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.patientId, patientId) ||
                other.patientId == patientId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.heure, heure) || other.heure == heure) &&
            (identical(other.linkedConsultation, linkedConsultation) ||
                other.linkedConsultation == linkedConsultation) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, rdvId, doctor, patientId,
      date, heure, linkedConsultation, status, createdAt, updatedAt);

  /// Create a copy of PatientAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientAppointmentDtoImplCopyWith<_$PatientAppointmentDtoImpl>
      get copyWith => __$$PatientAppointmentDtoImplCopyWithImpl<
          _$PatientAppointmentDtoImpl>(this, _$identity);
}

abstract class _PatientAppointmentDto implements PatientAppointmentDto {
  const factory _PatientAppointmentDto(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'rdv_id') required final String rdvId,
      @JsonKey(name: 'id_med') required final DoctorDto doctor,
      @JsonKey(name: 'id_num_dossier') required final String patientId,
      required final String date,
      required final String heure,
      @JsonKey(name: 'linkedConsultation') final String? linkedConsultation,
      required final String status,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PatientAppointmentDtoImpl;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'rdv_id')
  String get rdvId;
  @override
  @JsonKey(name: 'id_med')
  DoctorDto get doctor;
  @override
  @JsonKey(name: 'id_num_dossier')
  String get patientId;
  @override
  String get date;
  @override
  String get heure;
  @override
  @JsonKey(name: 'linkedConsultation')
  String? get linkedConsultation;
  @override
  String get status;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PatientAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientAppointmentDtoImplCopyWith<_$PatientAppointmentDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DoctorDto {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  int get cin => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Create a copy of DoctorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorDtoCopyWith<DoctorDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorDtoCopyWith<$Res> {
  factory $DoctorDtoCopyWith(DoctorDto value, $Res Function(DoctorDto) then) =
      _$DoctorDtoCopyWithImpl<$Res, DoctorDto>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String nom,
      String prenom,
      int cin,
      String role});
}

/// @nodoc
class _$DoctorDtoCopyWithImpl<$Res, $Val extends DoctorDto>
    implements $DoctorDtoCopyWith<$Res> {
  _$DoctorDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoctorDtoImplCopyWith<$Res>
    implements $DoctorDtoCopyWith<$Res> {
  factory _$$DoctorDtoImplCopyWith(
          _$DoctorDtoImpl value, $Res Function(_$DoctorDtoImpl) then) =
      __$$DoctorDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      String nom,
      String prenom,
      int cin,
      String role});
}

/// @nodoc
class __$$DoctorDtoImplCopyWithImpl<$Res>
    extends _$DoctorDtoCopyWithImpl<$Res, _$DoctorDtoImpl>
    implements _$$DoctorDtoImplCopyWith<$Res> {
  __$$DoctorDtoImplCopyWithImpl(
      _$DoctorDtoImpl _value, $Res Function(_$DoctorDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DoctorDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
  }) {
    return _then(_$DoctorDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DoctorDtoImpl implements _DoctorDto {
  const _$DoctorDtoImpl(
      {@JsonKey(name: '_id') required this.id,
      required this.nom,
      required this.prenom,
      required this.cin,
      required this.role});

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  final String nom;
  @override
  final String prenom;
  @override
  final int cin;
  @override
  final String role;

  @override
  String toString() {
    return 'DoctorDto(id: $id, nom: $nom, prenom: $prenom, cin: $cin, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nom, prenom, cin, role);

  /// Create a copy of DoctorDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorDtoImplCopyWith<_$DoctorDtoImpl> get copyWith =>
      __$$DoctorDtoImplCopyWithImpl<_$DoctorDtoImpl>(this, _$identity);
}

abstract class _DoctorDto implements DoctorDto {
  const factory _DoctorDto(
      {@JsonKey(name: '_id') required final String id,
      required final String nom,
      required final String prenom,
      required final int cin,
      required final String role}) = _$DoctorDtoImpl;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  String get nom;
  @override
  String get prenom;
  @override
  int get cin;
  @override
  String get role;

  /// Create a copy of DoctorDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorDtoImplCopyWith<_$DoctorDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PatientConsultationDto {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_consult')
  String get numConsult => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_dossier')
  String get numDossier => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_med')
  DoctorDto? get doctor => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_heure')
  String get dateHeure => throw _privateConstructorUsedError;
  @JsonKey(name: 'diagnostic_retenu')
  String? get diagnosticRetenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarque')
  String? get remarque => throw _privateConstructorUsedError;
  @JsonKey(name: 'prediction_generee')
  bool get predictionGeneree => throw _privateConstructorUsedError;
  @JsonKey(name: 'prediction_risque')
  String? get predictionRisque => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom_med')
  String? get nomMed => throw _privateConstructorUsedError;
  @JsonKey(name: 'pren_med')
  String? get prenMed =>
      throw _privateConstructorUsedError; // Psychiatric history
  bool get addiction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TABAC')
  bool get tabac => throw _privateConstructorUsedError;
  bool get alcool => throw _privateConstructorUsedError;
  bool get cannabis => throw _privateConstructorUsedError;
  bool get medicaments => throw _privateConstructorUsedError;
  @JsonKey(name: 'AtcdsP_TS')
  bool get atcdsPTs => throw _privateConstructorUsedError;
  @JsonKey(name: 'idees_sui_ant')
  bool get ideesSuiAnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'hospit_ant')
  bool get hospitAnt => throw _privateConstructorUsedError;
  bool get etatdepressif => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of PatientConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientConsultationDtoCopyWith<PatientConsultationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientConsultationDtoCopyWith<$Res> {
  factory $PatientConsultationDtoCopyWith(PatientConsultationDto value,
          $Res Function(PatientConsultationDto) then) =
      _$PatientConsultationDtoCopyWithImpl<$Res, PatientConsultationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'num_consult') String numConsult,
      @JsonKey(name: 'num_dossier') String numDossier,
      @JsonKey(name: 'id_med') DoctorDto? doctor,
      @JsonKey(name: 'date_heure') String dateHeure,
      @JsonKey(name: 'diagnostic_retenu') String? diagnosticRetenu,
      @JsonKey(name: 'remarque') String? remarque,
      @JsonKey(name: 'prediction_generee') bool predictionGeneree,
      @JsonKey(name: 'prediction_risque') String? predictionRisque,
      @JsonKey(name: 'nom_med') String? nomMed,
      @JsonKey(name: 'pren_med') String? prenMed,
      bool addiction,
      @JsonKey(name: 'TABAC') bool tabac,
      bool alcool,
      bool cannabis,
      bool medicaments,
      @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') bool hospitAnt,
      bool etatdepressif,
      DateTime? createdAt,
      DateTime? updatedAt});

  $DoctorDtoCopyWith<$Res>? get doctor;
}

/// @nodoc
class _$PatientConsultationDtoCopyWithImpl<$Res,
        $Val extends PatientConsultationDto>
    implements $PatientConsultationDtoCopyWith<$Res> {
  _$PatientConsultationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numConsult = null,
    Object? numDossier = null,
    Object? doctor = freezed,
    Object? dateHeure = null,
    Object? diagnosticRetenu = freezed,
    Object? remarque = freezed,
    Object? predictionGeneree = null,
    Object? predictionRisque = freezed,
    Object? nomMed = freezed,
    Object? prenMed = freezed,
    Object? addiction = null,
    Object? tabac = null,
    Object? alcool = null,
    Object? cannabis = null,
    Object? medicaments = null,
    Object? atcdsPTs = null,
    Object? ideesSuiAnt = null,
    Object? hospitAnt = null,
    Object? etatdepressif = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numConsult: null == numConsult
          ? _value.numConsult
          : numConsult // ignore: cast_nullable_to_non_nullable
              as String,
      numDossier: null == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorDto?,
      dateHeure: null == dateHeure
          ? _value.dateHeure
          : dateHeure // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticRetenu: freezed == diagnosticRetenu
          ? _value.diagnosticRetenu
          : diagnosticRetenu // ignore: cast_nullable_to_non_nullable
              as String?,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
      predictionGeneree: null == predictionGeneree
          ? _value.predictionGeneree
          : predictionGeneree // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionRisque: freezed == predictionRisque
          ? _value.predictionRisque
          : predictionRisque // ignore: cast_nullable_to_non_nullable
              as String?,
      nomMed: freezed == nomMed
          ? _value.nomMed
          : nomMed // ignore: cast_nullable_to_non_nullable
              as String?,
      prenMed: freezed == prenMed
          ? _value.prenMed
          : prenMed // ignore: cast_nullable_to_non_nullable
              as String?,
      addiction: null == addiction
          ? _value.addiction
          : addiction // ignore: cast_nullable_to_non_nullable
              as bool,
      tabac: null == tabac
          ? _value.tabac
          : tabac // ignore: cast_nullable_to_non_nullable
              as bool,
      alcool: null == alcool
          ? _value.alcool
          : alcool // ignore: cast_nullable_to_non_nullable
              as bool,
      cannabis: null == cannabis
          ? _value.cannabis
          : cannabis // ignore: cast_nullable_to_non_nullable
              as bool,
      medicaments: null == medicaments
          ? _value.medicaments
          : medicaments // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPTs: null == atcdsPTs
          ? _value.atcdsPTs
          : atcdsPTs // ignore: cast_nullable_to_non_nullable
              as bool,
      ideesSuiAnt: null == ideesSuiAnt
          ? _value.ideesSuiAnt
          : ideesSuiAnt // ignore: cast_nullable_to_non_nullable
              as bool,
      hospitAnt: null == hospitAnt
          ? _value.hospitAnt
          : hospitAnt // ignore: cast_nullable_to_non_nullable
              as bool,
      etatdepressif: null == etatdepressif
          ? _value.etatdepressif
          : etatdepressif // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of PatientConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoctorDtoCopyWith<$Res>? get doctor {
    if (_value.doctor == null) {
      return null;
    }

    return $DoctorDtoCopyWith<$Res>(_value.doctor!, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientConsultationDtoImplCopyWith<$Res>
    implements $PatientConsultationDtoCopyWith<$Res> {
  factory _$$PatientConsultationDtoImplCopyWith(
          _$PatientConsultationDtoImpl value,
          $Res Function(_$PatientConsultationDtoImpl) then) =
      __$$PatientConsultationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: 'num_consult') String numConsult,
      @JsonKey(name: 'num_dossier') String numDossier,
      @JsonKey(name: 'id_med') DoctorDto? doctor,
      @JsonKey(name: 'date_heure') String dateHeure,
      @JsonKey(name: 'diagnostic_retenu') String? diagnosticRetenu,
      @JsonKey(name: 'remarque') String? remarque,
      @JsonKey(name: 'prediction_generee') bool predictionGeneree,
      @JsonKey(name: 'prediction_risque') String? predictionRisque,
      @JsonKey(name: 'nom_med') String? nomMed,
      @JsonKey(name: 'pren_med') String? prenMed,
      bool addiction,
      @JsonKey(name: 'TABAC') bool tabac,
      bool alcool,
      bool cannabis,
      bool medicaments,
      @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') bool hospitAnt,
      bool etatdepressif,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $DoctorDtoCopyWith<$Res>? get doctor;
}

/// @nodoc
class __$$PatientConsultationDtoImplCopyWithImpl<$Res>
    extends _$PatientConsultationDtoCopyWithImpl<$Res,
        _$PatientConsultationDtoImpl>
    implements _$$PatientConsultationDtoImplCopyWith<$Res> {
  __$$PatientConsultationDtoImplCopyWithImpl(
      _$PatientConsultationDtoImpl _value,
      $Res Function(_$PatientConsultationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatientConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? numConsult = null,
    Object? numDossier = null,
    Object? doctor = freezed,
    Object? dateHeure = null,
    Object? diagnosticRetenu = freezed,
    Object? remarque = freezed,
    Object? predictionGeneree = null,
    Object? predictionRisque = freezed,
    Object? nomMed = freezed,
    Object? prenMed = freezed,
    Object? addiction = null,
    Object? tabac = null,
    Object? alcool = null,
    Object? cannabis = null,
    Object? medicaments = null,
    Object? atcdsPTs = null,
    Object? ideesSuiAnt = null,
    Object? hospitAnt = null,
    Object? etatdepressif = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatientConsultationDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      numConsult: null == numConsult
          ? _value.numConsult
          : numConsult // ignore: cast_nullable_to_non_nullable
              as String,
      numDossier: null == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as DoctorDto?,
      dateHeure: null == dateHeure
          ? _value.dateHeure
          : dateHeure // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticRetenu: freezed == diagnosticRetenu
          ? _value.diagnosticRetenu
          : diagnosticRetenu // ignore: cast_nullable_to_non_nullable
              as String?,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
      predictionGeneree: null == predictionGeneree
          ? _value.predictionGeneree
          : predictionGeneree // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionRisque: freezed == predictionRisque
          ? _value.predictionRisque
          : predictionRisque // ignore: cast_nullable_to_non_nullable
              as String?,
      nomMed: freezed == nomMed
          ? _value.nomMed
          : nomMed // ignore: cast_nullable_to_non_nullable
              as String?,
      prenMed: freezed == prenMed
          ? _value.prenMed
          : prenMed // ignore: cast_nullable_to_non_nullable
              as String?,
      addiction: null == addiction
          ? _value.addiction
          : addiction // ignore: cast_nullable_to_non_nullable
              as bool,
      tabac: null == tabac
          ? _value.tabac
          : tabac // ignore: cast_nullable_to_non_nullable
              as bool,
      alcool: null == alcool
          ? _value.alcool
          : alcool // ignore: cast_nullable_to_non_nullable
              as bool,
      cannabis: null == cannabis
          ? _value.cannabis
          : cannabis // ignore: cast_nullable_to_non_nullable
              as bool,
      medicaments: null == medicaments
          ? _value.medicaments
          : medicaments // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPTs: null == atcdsPTs
          ? _value.atcdsPTs
          : atcdsPTs // ignore: cast_nullable_to_non_nullable
              as bool,
      ideesSuiAnt: null == ideesSuiAnt
          ? _value.ideesSuiAnt
          : ideesSuiAnt // ignore: cast_nullable_to_non_nullable
              as bool,
      hospitAnt: null == hospitAnt
          ? _value.hospitAnt
          : hospitAnt // ignore: cast_nullable_to_non_nullable
              as bool,
      etatdepressif: null == etatdepressif
          ? _value.etatdepressif
          : etatdepressif // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PatientConsultationDtoImpl implements _PatientConsultationDto {
  const _$PatientConsultationDtoImpl(
      {@JsonKey(name: '_id') required this.id,
      @JsonKey(name: 'num_consult') required this.numConsult,
      @JsonKey(name: 'num_dossier') required this.numDossier,
      @JsonKey(name: 'id_med') this.doctor,
      @JsonKey(name: 'date_heure') required this.dateHeure,
      @JsonKey(name: 'diagnostic_retenu') this.diagnosticRetenu,
      @JsonKey(name: 'remarque') this.remarque,
      @JsonKey(name: 'prediction_generee') this.predictionGeneree = false,
      @JsonKey(name: 'prediction_risque') this.predictionRisque,
      @JsonKey(name: 'nom_med') this.nomMed,
      @JsonKey(name: 'pren_med') this.prenMed,
      this.addiction = false,
      @JsonKey(name: 'TABAC') this.tabac = false,
      this.alcool = false,
      this.cannabis = false,
      this.medicaments = false,
      @JsonKey(name: 'AtcdsP_TS') this.atcdsPTs = false,
      @JsonKey(name: 'idees_sui_ant') this.ideesSuiAnt = false,
      @JsonKey(name: 'hospit_ant') this.hospitAnt = false,
      this.etatdepressif = false,
      this.createdAt,
      this.updatedAt});

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'num_consult')
  final String numConsult;
  @override
  @JsonKey(name: 'num_dossier')
  final String numDossier;
  @override
  @JsonKey(name: 'id_med')
  final DoctorDto? doctor;
  @override
  @JsonKey(name: 'date_heure')
  final String dateHeure;
  @override
  @JsonKey(name: 'diagnostic_retenu')
  final String? diagnosticRetenu;
  @override
  @JsonKey(name: 'remarque')
  final String? remarque;
  @override
  @JsonKey(name: 'prediction_generee')
  final bool predictionGeneree;
  @override
  @JsonKey(name: 'prediction_risque')
  final String? predictionRisque;
  @override
  @JsonKey(name: 'nom_med')
  final String? nomMed;
  @override
  @JsonKey(name: 'pren_med')
  final String? prenMed;
// Psychiatric history
  @override
  @JsonKey()
  final bool addiction;
  @override
  @JsonKey(name: 'TABAC')
  final bool tabac;
  @override
  @JsonKey()
  final bool alcool;
  @override
  @JsonKey()
  final bool cannabis;
  @override
  @JsonKey()
  final bool medicaments;
  @override
  @JsonKey(name: 'AtcdsP_TS')
  final bool atcdsPTs;
  @override
  @JsonKey(name: 'idees_sui_ant')
  final bool ideesSuiAnt;
  @override
  @JsonKey(name: 'hospit_ant')
  final bool hospitAnt;
  @override
  @JsonKey()
  final bool etatdepressif;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PatientConsultationDto(id: $id, numConsult: $numConsult, numDossier: $numDossier, doctor: $doctor, dateHeure: $dateHeure, diagnosticRetenu: $diagnosticRetenu, remarque: $remarque, predictionGeneree: $predictionGeneree, predictionRisque: $predictionRisque, nomMed: $nomMed, prenMed: $prenMed, addiction: $addiction, tabac: $tabac, alcool: $alcool, cannabis: $cannabis, medicaments: $medicaments, atcdsPTs: $atcdsPTs, ideesSuiAnt: $ideesSuiAnt, hospitAnt: $hospitAnt, etatdepressif: $etatdepressif, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientConsultationDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numConsult, numConsult) ||
                other.numConsult == numConsult) &&
            (identical(other.numDossier, numDossier) ||
                other.numDossier == numDossier) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.dateHeure, dateHeure) ||
                other.dateHeure == dateHeure) &&
            (identical(other.diagnosticRetenu, diagnosticRetenu) ||
                other.diagnosticRetenu == diagnosticRetenu) &&
            (identical(other.remarque, remarque) ||
                other.remarque == remarque) &&
            (identical(other.predictionGeneree, predictionGeneree) ||
                other.predictionGeneree == predictionGeneree) &&
            (identical(other.predictionRisque, predictionRisque) ||
                other.predictionRisque == predictionRisque) &&
            (identical(other.nomMed, nomMed) || other.nomMed == nomMed) &&
            (identical(other.prenMed, prenMed) || other.prenMed == prenMed) &&
            (identical(other.addiction, addiction) ||
                other.addiction == addiction) &&
            (identical(other.tabac, tabac) || other.tabac == tabac) &&
            (identical(other.alcool, alcool) || other.alcool == alcool) &&
            (identical(other.cannabis, cannabis) ||
                other.cannabis == cannabis) &&
            (identical(other.medicaments, medicaments) ||
                other.medicaments == medicaments) &&
            (identical(other.atcdsPTs, atcdsPTs) ||
                other.atcdsPTs == atcdsPTs) &&
            (identical(other.ideesSuiAnt, ideesSuiAnt) ||
                other.ideesSuiAnt == ideesSuiAnt) &&
            (identical(other.hospitAnt, hospitAnt) ||
                other.hospitAnt == hospitAnt) &&
            (identical(other.etatdepressif, etatdepressif) ||
                other.etatdepressif == etatdepressif) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        numConsult,
        numDossier,
        doctor,
        dateHeure,
        diagnosticRetenu,
        remarque,
        predictionGeneree,
        predictionRisque,
        nomMed,
        prenMed,
        addiction,
        tabac,
        alcool,
        cannabis,
        medicaments,
        atcdsPTs,
        ideesSuiAnt,
        hospitAnt,
        etatdepressif,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of PatientConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientConsultationDtoImplCopyWith<_$PatientConsultationDtoImpl>
      get copyWith => __$$PatientConsultationDtoImplCopyWithImpl<
          _$PatientConsultationDtoImpl>(this, _$identity);
}

abstract class _PatientConsultationDto implements PatientConsultationDto {
  const factory _PatientConsultationDto(
      {@JsonKey(name: '_id') required final String id,
      @JsonKey(name: 'num_consult') required final String numConsult,
      @JsonKey(name: 'num_dossier') required final String numDossier,
      @JsonKey(name: 'id_med') final DoctorDto? doctor,
      @JsonKey(name: 'date_heure') required final String dateHeure,
      @JsonKey(name: 'diagnostic_retenu') final String? diagnosticRetenu,
      @JsonKey(name: 'remarque') final String? remarque,
      @JsonKey(name: 'prediction_generee') final bool predictionGeneree,
      @JsonKey(name: 'prediction_risque') final String? predictionRisque,
      @JsonKey(name: 'nom_med') final String? nomMed,
      @JsonKey(name: 'pren_med') final String? prenMed,
      final bool addiction,
      @JsonKey(name: 'TABAC') final bool tabac,
      final bool alcool,
      final bool cannabis,
      final bool medicaments,
      @JsonKey(name: 'AtcdsP_TS') final bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') final bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') final bool hospitAnt,
      final bool etatdepressif,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PatientConsultationDtoImpl;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'num_consult')
  String get numConsult;
  @override
  @JsonKey(name: 'num_dossier')
  String get numDossier;
  @override
  @JsonKey(name: 'id_med')
  DoctorDto? get doctor;
  @override
  @JsonKey(name: 'date_heure')
  String get dateHeure;
  @override
  @JsonKey(name: 'diagnostic_retenu')
  String? get diagnosticRetenu;
  @override
  @JsonKey(name: 'remarque')
  String? get remarque;
  @override
  @JsonKey(name: 'prediction_generee')
  bool get predictionGeneree;
  @override
  @JsonKey(name: 'prediction_risque')
  String? get predictionRisque;
  @override
  @JsonKey(name: 'nom_med')
  String? get nomMed;
  @override
  @JsonKey(name: 'pren_med')
  String? get prenMed; // Psychiatric history
  @override
  bool get addiction;
  @override
  @JsonKey(name: 'TABAC')
  bool get tabac;
  @override
  bool get alcool;
  @override
  bool get cannabis;
  @override
  bool get medicaments;
  @override
  @JsonKey(name: 'AtcdsP_TS')
  bool get atcdsPTs;
  @override
  @JsonKey(name: 'idees_sui_ant')
  bool get ideesSuiAnt;
  @override
  @JsonKey(name: 'hospit_ant')
  bool get hospitAnt;
  @override
  bool get etatdepressif;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PatientConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientConsultationDtoImplCopyWith<_$PatientConsultationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
