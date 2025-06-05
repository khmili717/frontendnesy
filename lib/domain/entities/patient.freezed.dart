// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeletionRequestedBy {
  String? get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  int get cin => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  /// Create a copy of DeletionRequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeletionRequestedByCopyWith<DeletionRequestedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeletionRequestedByCopyWith<$Res> {
  factory $DeletionRequestedByCopyWith(
          DeletionRequestedBy value, $Res Function(DeletionRequestedBy) then) =
      _$DeletionRequestedByCopyWithImpl<$Res, DeletionRequestedBy>;
  @useResult
  $Res call({String? id, String nom, String prenom, int cin, String role});
}

/// @nodoc
class _$DeletionRequestedByCopyWithImpl<$Res, $Val extends DeletionRequestedBy>
    implements $DeletionRequestedByCopyWith<$Res> {
  _$DeletionRequestedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeletionRequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$DeletionRequestedByImplCopyWith<$Res>
    implements $DeletionRequestedByCopyWith<$Res> {
  factory _$$DeletionRequestedByImplCopyWith(_$DeletionRequestedByImpl value,
          $Res Function(_$DeletionRequestedByImpl) then) =
      __$$DeletionRequestedByImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String nom, String prenom, int cin, String role});
}

/// @nodoc
class __$$DeletionRequestedByImplCopyWithImpl<$Res>
    extends _$DeletionRequestedByCopyWithImpl<$Res, _$DeletionRequestedByImpl>
    implements _$$DeletionRequestedByImplCopyWith<$Res> {
  __$$DeletionRequestedByImplCopyWithImpl(_$DeletionRequestedByImpl _value,
      $Res Function(_$DeletionRequestedByImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeletionRequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
  }) {
    return _then(_$DeletionRequestedByImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$DeletionRequestedByImpl implements _DeletionRequestedBy {
  const _$DeletionRequestedByImpl(
      {this.id,
      required this.nom,
      required this.prenom,
      required this.cin,
      required this.role});

  @override
  final String? id;
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
    return 'DeletionRequestedBy(id: $id, nom: $nom, prenom: $prenom, cin: $cin, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletionRequestedByImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nom, prenom, cin, role);

  /// Create a copy of DeletionRequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletionRequestedByImplCopyWith<_$DeletionRequestedByImpl> get copyWith =>
      __$$DeletionRequestedByImplCopyWithImpl<_$DeletionRequestedByImpl>(
          this, _$identity);
}

abstract class _DeletionRequestedBy implements DeletionRequestedBy {
  const factory _DeletionRequestedBy(
      {final String? id,
      required final String nom,
      required final String prenom,
      required final int cin,
      required final String role}) = _$DeletionRequestedByImpl;

  @override
  String? get id;
  @override
  String get nom;
  @override
  String get prenom;
  @override
  int get cin;
  @override
  String get role;

  /// Create a copy of DeletionRequestedBy
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletionRequestedByImplCopyWith<_$DeletionRequestedByImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Patient {
  String? get id => throw _privateConstructorUsedError;
  String get nomPatient => throw _privateConstructorUsedError;
  String get prenPatient => throw _privateConstructorUsedError;
  int? get cinCnam => throw _privateConstructorUsedError;
  int? get telephone => throw _privateConstructorUsedError;
  String? get dateNaiss => throw _privateConstructorUsedError;
  PatientGender get sexe => throw _privateConstructorUsedError;
  AgeRange get ageInt => throw _privateConstructorUsedError;
  MaritalStatus get etatcivil => throw _privateConstructorUsedError;
  Origin get origine => throw _privateConstructorUsedError;
  LivingSituation get lieuderesidence => throw _privateConstructorUsedError;
  CityOfResidence get villederesidence => throw _privateConstructorUsedError;
  EducationLevel get nvscolaire => throw _privateConstructorUsedError;
  ProfessionType get typeProf => throw _privateConstructorUsedError;
  SocioeconomicLevel get nvSocioeconomique =>
      throw _privateConstructorUsedError;
  String? get idSec => throw _privateConstructorUsedError;
  String? get numDossier => throw _privateConstructorUsedError;
  bool? get pendingDeletion => throw _privateConstructorUsedError;
  String? get deletionReason => throw _privateConstructorUsedError;
  DateTime? get deletionRequestedAt => throw _privateConstructorUsedError;
  DeletionRequestedBy? get deletionRequestedBy =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {String? id,
      String nomPatient,
      String prenPatient,
      int? cinCnam,
      int? telephone,
      String? dateNaiss,
      PatientGender sexe,
      AgeRange ageInt,
      MaritalStatus etatcivil,
      Origin origine,
      LivingSituation lieuderesidence,
      CityOfResidence villederesidence,
      EducationLevel nvscolaire,
      ProfessionType typeProf,
      SocioeconomicLevel nvSocioeconomique,
      String? idSec,
      String? numDossier,
      bool? pendingDeletion,
      String? deletionReason,
      DateTime? deletionRequestedAt,
      DeletionRequestedBy? deletionRequestedBy,
      DateTime? createdAt,
      DateTime? updatedAt});

  $DeletionRequestedByCopyWith<$Res>? get deletionRequestedBy;
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = freezed,
    Object? telephone = freezed,
    Object? dateNaiss = freezed,
    Object? sexe = null,
    Object? ageInt = null,
    Object? etatcivil = null,
    Object? origine = null,
    Object? lieuderesidence = null,
    Object? villederesidence = null,
    Object? nvscolaire = null,
    Object? typeProf = null,
    Object? nvSocioeconomique = null,
    Object? idSec = freezed,
    Object? numDossier = freezed,
    Object? pendingDeletion = freezed,
    Object? deletionReason = freezed,
    Object? deletionRequestedAt = freezed,
    Object? deletionRequestedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nomPatient: null == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String,
      prenPatient: null == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as PatientGender,
      ageInt: null == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as AgeRange,
      etatcivil: null == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as MaritalStatus,
      origine: null == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as Origin,
      lieuderesidence: null == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as LivingSituation,
      villederesidence: null == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as CityOfResidence,
      nvscolaire: null == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      typeProf: null == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as ProfessionType,
      nvSocioeconomique: null == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as SocioeconomicLevel,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
      numDossier: freezed == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingDeletion: freezed == pendingDeletion
          ? _value.pendingDeletion
          : pendingDeletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      deletionReason: freezed == deletionReason
          ? _value.deletionReason
          : deletionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      deletionRequestedAt: freezed == deletionRequestedAt
          ? _value.deletionRequestedAt
          : deletionRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletionRequestedBy: freezed == deletionRequestedBy
          ? _value.deletionRequestedBy
          : deletionRequestedBy // ignore: cast_nullable_to_non_nullable
              as DeletionRequestedBy?,
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

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeletionRequestedByCopyWith<$Res>? get deletionRequestedBy {
    if (_value.deletionRequestedBy == null) {
      return null;
    }

    return $DeletionRequestedByCopyWith<$Res>(_value.deletionRequestedBy!,
        (value) {
      return _then(_value.copyWith(deletionRequestedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
          _$PatientImpl value, $Res Function(_$PatientImpl) then) =
      __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String nomPatient,
      String prenPatient,
      int? cinCnam,
      int? telephone,
      String? dateNaiss,
      PatientGender sexe,
      AgeRange ageInt,
      MaritalStatus etatcivil,
      Origin origine,
      LivingSituation lieuderesidence,
      CityOfResidence villederesidence,
      EducationLevel nvscolaire,
      ProfessionType typeProf,
      SocioeconomicLevel nvSocioeconomique,
      String? idSec,
      String? numDossier,
      bool? pendingDeletion,
      String? deletionReason,
      DateTime? deletionRequestedAt,
      DeletionRequestedBy? deletionRequestedBy,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $DeletionRequestedByCopyWith<$Res>? get deletionRequestedBy;
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
      _$PatientImpl _value, $Res Function(_$PatientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = freezed,
    Object? telephone = freezed,
    Object? dateNaiss = freezed,
    Object? sexe = null,
    Object? ageInt = null,
    Object? etatcivil = null,
    Object? origine = null,
    Object? lieuderesidence = null,
    Object? villederesidence = null,
    Object? nvscolaire = null,
    Object? typeProf = null,
    Object? nvSocioeconomique = null,
    Object? idSec = freezed,
    Object? numDossier = freezed,
    Object? pendingDeletion = freezed,
    Object? deletionReason = freezed,
    Object? deletionRequestedAt = freezed,
    Object? deletionRequestedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatientImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nomPatient: null == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String,
      prenPatient: null == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as PatientGender,
      ageInt: null == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as AgeRange,
      etatcivil: null == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as MaritalStatus,
      origine: null == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as Origin,
      lieuderesidence: null == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as LivingSituation,
      villederesidence: null == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as CityOfResidence,
      nvscolaire: null == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      typeProf: null == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as ProfessionType,
      nvSocioeconomique: null == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as SocioeconomicLevel,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
      numDossier: freezed == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingDeletion: freezed == pendingDeletion
          ? _value.pendingDeletion
          : pendingDeletion // ignore: cast_nullable_to_non_nullable
              as bool?,
      deletionReason: freezed == deletionReason
          ? _value.deletionReason
          : deletionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      deletionRequestedAt: freezed == deletionRequestedAt
          ? _value.deletionRequestedAt
          : deletionRequestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletionRequestedBy: freezed == deletionRequestedBy
          ? _value.deletionRequestedBy
          : deletionRequestedBy // ignore: cast_nullable_to_non_nullable
              as DeletionRequestedBy?,
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

class _$PatientImpl implements _Patient {
  const _$PatientImpl(
      {this.id,
      required this.nomPatient,
      required this.prenPatient,
      this.cinCnam,
      this.telephone,
      this.dateNaiss,
      required this.sexe,
      required this.ageInt,
      required this.etatcivil,
      required this.origine,
      required this.lieuderesidence,
      required this.villederesidence,
      required this.nvscolaire,
      required this.typeProf,
      required this.nvSocioeconomique,
      this.idSec,
      this.numDossier,
      this.pendingDeletion,
      this.deletionReason,
      this.deletionRequestedAt,
      this.deletionRequestedBy,
      this.createdAt,
      this.updatedAt});

  @override
  final String? id;
  @override
  final String nomPatient;
  @override
  final String prenPatient;
  @override
  final int? cinCnam;
  @override
  final int? telephone;
  @override
  final String? dateNaiss;
  @override
  final PatientGender sexe;
  @override
  final AgeRange ageInt;
  @override
  final MaritalStatus etatcivil;
  @override
  final Origin origine;
  @override
  final LivingSituation lieuderesidence;
  @override
  final CityOfResidence villederesidence;
  @override
  final EducationLevel nvscolaire;
  @override
  final ProfessionType typeProf;
  @override
  final SocioeconomicLevel nvSocioeconomique;
  @override
  final String? idSec;
  @override
  final String? numDossier;
  @override
  final bool? pendingDeletion;
  @override
  final String? deletionReason;
  @override
  final DateTime? deletionRequestedAt;
  @override
  final DeletionRequestedBy? deletionRequestedBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Patient(id: $id, nomPatient: $nomPatient, prenPatient: $prenPatient, cinCnam: $cinCnam, telephone: $telephone, dateNaiss: $dateNaiss, sexe: $sexe, ageInt: $ageInt, etatcivil: $etatcivil, origine: $origine, lieuderesidence: $lieuderesidence, villederesidence: $villederesidence, nvscolaire: $nvscolaire, typeProf: $typeProf, nvSocioeconomique: $nvSocioeconomique, idSec: $idSec, numDossier: $numDossier, pendingDeletion: $pendingDeletion, deletionReason: $deletionReason, deletionRequestedAt: $deletionRequestedAt, deletionRequestedBy: $deletionRequestedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nomPatient, nomPatient) ||
                other.nomPatient == nomPatient) &&
            (identical(other.prenPatient, prenPatient) ||
                other.prenPatient == prenPatient) &&
            (identical(other.cinCnam, cinCnam) || other.cinCnam == cinCnam) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.dateNaiss, dateNaiss) ||
                other.dateNaiss == dateNaiss) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.ageInt, ageInt) || other.ageInt == ageInt) &&
            (identical(other.etatcivil, etatcivil) ||
                other.etatcivil == etatcivil) &&
            (identical(other.origine, origine) || other.origine == origine) &&
            (identical(other.lieuderesidence, lieuderesidence) ||
                other.lieuderesidence == lieuderesidence) &&
            (identical(other.villederesidence, villederesidence) ||
                other.villederesidence == villederesidence) &&
            (identical(other.nvscolaire, nvscolaire) ||
                other.nvscolaire == nvscolaire) &&
            (identical(other.typeProf, typeProf) ||
                other.typeProf == typeProf) &&
            (identical(other.nvSocioeconomique, nvSocioeconomique) ||
                other.nvSocioeconomique == nvSocioeconomique) &&
            (identical(other.idSec, idSec) || other.idSec == idSec) &&
            (identical(other.numDossier, numDossier) ||
                other.numDossier == numDossier) &&
            (identical(other.pendingDeletion, pendingDeletion) ||
                other.pendingDeletion == pendingDeletion) &&
            (identical(other.deletionReason, deletionReason) ||
                other.deletionReason == deletionReason) &&
            (identical(other.deletionRequestedAt, deletionRequestedAt) ||
                other.deletionRequestedAt == deletionRequestedAt) &&
            (identical(other.deletionRequestedBy, deletionRequestedBy) ||
                other.deletionRequestedBy == deletionRequestedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        nomPatient,
        prenPatient,
        cinCnam,
        telephone,
        dateNaiss,
        sexe,
        ageInt,
        etatcivil,
        origine,
        lieuderesidence,
        villederesidence,
        nvscolaire,
        typeProf,
        nvSocioeconomique,
        idSec,
        numDossier,
        pendingDeletion,
        deletionReason,
        deletionRequestedAt,
        deletionRequestedBy,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {final String? id,
      required final String nomPatient,
      required final String prenPatient,
      final int? cinCnam,
      final int? telephone,
      final String? dateNaiss,
      required final PatientGender sexe,
      required final AgeRange ageInt,
      required final MaritalStatus etatcivil,
      required final Origin origine,
      required final LivingSituation lieuderesidence,
      required final CityOfResidence villederesidence,
      required final EducationLevel nvscolaire,
      required final ProfessionType typeProf,
      required final SocioeconomicLevel nvSocioeconomique,
      final String? idSec,
      final String? numDossier,
      final bool? pendingDeletion,
      final String? deletionReason,
      final DateTime? deletionRequestedAt,
      final DeletionRequestedBy? deletionRequestedBy,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PatientImpl;

  @override
  String? get id;
  @override
  String get nomPatient;
  @override
  String get prenPatient;
  @override
  int? get cinCnam;
  @override
  int? get telephone;
  @override
  String? get dateNaiss;
  @override
  PatientGender get sexe;
  @override
  AgeRange get ageInt;
  @override
  MaritalStatus get etatcivil;
  @override
  Origin get origine;
  @override
  LivingSituation get lieuderesidence;
  @override
  CityOfResidence get villederesidence;
  @override
  EducationLevel get nvscolaire;
  @override
  ProfessionType get typeProf;
  @override
  SocioeconomicLevel get nvSocioeconomique;
  @override
  String? get idSec;
  @override
  String? get numDossier;
  @override
  bool? get pendingDeletion;
  @override
  String? get deletionReason;
  @override
  DateTime? get deletionRequestedAt;
  @override
  DeletionRequestedBy? get deletionRequestedBy;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePatientRequest _$CreatePatientRequestFromJson(Map<String, dynamic> json) {
  return _CreatePatientRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePatientRequest {
  String get nomPatient => throw _privateConstructorUsedError;
  String get prenPatient => throw _privateConstructorUsedError;
  int? get cinCnam => throw _privateConstructorUsedError;
  int? get telephone => throw _privateConstructorUsedError;
  String? get dateNaiss => throw _privateConstructorUsedError;
  PatientGender get sexe => throw _privateConstructorUsedError;
  AgeRange get ageInt => throw _privateConstructorUsedError;
  MaritalStatus get etatcivil => throw _privateConstructorUsedError;
  Origin get origine => throw _privateConstructorUsedError;
  LivingSituation get lieuderesidence => throw _privateConstructorUsedError;
  CityOfResidence get villederesidence => throw _privateConstructorUsedError;
  EducationLevel get nvscolaire => throw _privateConstructorUsedError;
  ProfessionType get typeProf => throw _privateConstructorUsedError;
  SocioeconomicLevel get nvSocioeconomique =>
      throw _privateConstructorUsedError;
  String? get idSec => throw _privateConstructorUsedError;

  /// Serializes this CreatePatientRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePatientRequestCopyWith<CreatePatientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePatientRequestCopyWith<$Res> {
  factory $CreatePatientRequestCopyWith(CreatePatientRequest value,
          $Res Function(CreatePatientRequest) then) =
      _$CreatePatientRequestCopyWithImpl<$Res, CreatePatientRequest>;
  @useResult
  $Res call(
      {String nomPatient,
      String prenPatient,
      int? cinCnam,
      int? telephone,
      String? dateNaiss,
      PatientGender sexe,
      AgeRange ageInt,
      MaritalStatus etatcivil,
      Origin origine,
      LivingSituation lieuderesidence,
      CityOfResidence villederesidence,
      EducationLevel nvscolaire,
      ProfessionType typeProf,
      SocioeconomicLevel nvSocioeconomique,
      String? idSec});
}

/// @nodoc
class _$CreatePatientRequestCopyWithImpl<$Res,
        $Val extends CreatePatientRequest>
    implements $CreatePatientRequestCopyWith<$Res> {
  _$CreatePatientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = freezed,
    Object? telephone = freezed,
    Object? dateNaiss = freezed,
    Object? sexe = null,
    Object? ageInt = null,
    Object? etatcivil = null,
    Object? origine = null,
    Object? lieuderesidence = null,
    Object? villederesidence = null,
    Object? nvscolaire = null,
    Object? typeProf = null,
    Object? nvSocioeconomique = null,
    Object? idSec = freezed,
  }) {
    return _then(_value.copyWith(
      nomPatient: null == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String,
      prenPatient: null == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as PatientGender,
      ageInt: null == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as AgeRange,
      etatcivil: null == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as MaritalStatus,
      origine: null == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as Origin,
      lieuderesidence: null == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as LivingSituation,
      villederesidence: null == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as CityOfResidence,
      nvscolaire: null == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      typeProf: null == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as ProfessionType,
      nvSocioeconomique: null == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as SocioeconomicLevel,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePatientRequestImplCopyWith<$Res>
    implements $CreatePatientRequestCopyWith<$Res> {
  factory _$$CreatePatientRequestImplCopyWith(_$CreatePatientRequestImpl value,
          $Res Function(_$CreatePatientRequestImpl) then) =
      __$$CreatePatientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nomPatient,
      String prenPatient,
      int? cinCnam,
      int? telephone,
      String? dateNaiss,
      PatientGender sexe,
      AgeRange ageInt,
      MaritalStatus etatcivil,
      Origin origine,
      LivingSituation lieuderesidence,
      CityOfResidence villederesidence,
      EducationLevel nvscolaire,
      ProfessionType typeProf,
      SocioeconomicLevel nvSocioeconomique,
      String? idSec});
}

/// @nodoc
class __$$CreatePatientRequestImplCopyWithImpl<$Res>
    extends _$CreatePatientRequestCopyWithImpl<$Res, _$CreatePatientRequestImpl>
    implements _$$CreatePatientRequestImplCopyWith<$Res> {
  __$$CreatePatientRequestImplCopyWithImpl(_$CreatePatientRequestImpl _value,
      $Res Function(_$CreatePatientRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = freezed,
    Object? telephone = freezed,
    Object? dateNaiss = freezed,
    Object? sexe = null,
    Object? ageInt = null,
    Object? etatcivil = null,
    Object? origine = null,
    Object? lieuderesidence = null,
    Object? villederesidence = null,
    Object? nvscolaire = null,
    Object? typeProf = null,
    Object? nvSocioeconomique = null,
    Object? idSec = freezed,
  }) {
    return _then(_$CreatePatientRequestImpl(
      nomPatient: null == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String,
      prenPatient: null == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as PatientGender,
      ageInt: null == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as AgeRange,
      etatcivil: null == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as MaritalStatus,
      origine: null == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as Origin,
      lieuderesidence: null == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as LivingSituation,
      villederesidence: null == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as CityOfResidence,
      nvscolaire: null == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as EducationLevel,
      typeProf: null == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as ProfessionType,
      nvSocioeconomique: null == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as SocioeconomicLevel,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePatientRequestImpl implements _CreatePatientRequest {
  const _$CreatePatientRequestImpl(
      {required this.nomPatient,
      required this.prenPatient,
      this.cinCnam,
      this.telephone,
      this.dateNaiss,
      required this.sexe,
      required this.ageInt,
      required this.etatcivil,
      required this.origine,
      required this.lieuderesidence,
      required this.villederesidence,
      required this.nvscolaire,
      required this.typeProf,
      required this.nvSocioeconomique,
      this.idSec});

  factory _$CreatePatientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePatientRequestImplFromJson(json);

  @override
  final String nomPatient;
  @override
  final String prenPatient;
  @override
  final int? cinCnam;
  @override
  final int? telephone;
  @override
  final String? dateNaiss;
  @override
  final PatientGender sexe;
  @override
  final AgeRange ageInt;
  @override
  final MaritalStatus etatcivil;
  @override
  final Origin origine;
  @override
  final LivingSituation lieuderesidence;
  @override
  final CityOfResidence villederesidence;
  @override
  final EducationLevel nvscolaire;
  @override
  final ProfessionType typeProf;
  @override
  final SocioeconomicLevel nvSocioeconomique;
  @override
  final String? idSec;

  @override
  String toString() {
    return 'CreatePatientRequest(nomPatient: $nomPatient, prenPatient: $prenPatient, cinCnam: $cinCnam, telephone: $telephone, dateNaiss: $dateNaiss, sexe: $sexe, ageInt: $ageInt, etatcivil: $etatcivil, origine: $origine, lieuderesidence: $lieuderesidence, villederesidence: $villederesidence, nvscolaire: $nvscolaire, typeProf: $typeProf, nvSocioeconomique: $nvSocioeconomique, idSec: $idSec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePatientRequestImpl &&
            (identical(other.nomPatient, nomPatient) ||
                other.nomPatient == nomPatient) &&
            (identical(other.prenPatient, prenPatient) ||
                other.prenPatient == prenPatient) &&
            (identical(other.cinCnam, cinCnam) || other.cinCnam == cinCnam) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.dateNaiss, dateNaiss) ||
                other.dateNaiss == dateNaiss) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.ageInt, ageInt) || other.ageInt == ageInt) &&
            (identical(other.etatcivil, etatcivil) ||
                other.etatcivil == etatcivil) &&
            (identical(other.origine, origine) || other.origine == origine) &&
            (identical(other.lieuderesidence, lieuderesidence) ||
                other.lieuderesidence == lieuderesidence) &&
            (identical(other.villederesidence, villederesidence) ||
                other.villederesidence == villederesidence) &&
            (identical(other.nvscolaire, nvscolaire) ||
                other.nvscolaire == nvscolaire) &&
            (identical(other.typeProf, typeProf) ||
                other.typeProf == typeProf) &&
            (identical(other.nvSocioeconomique, nvSocioeconomique) ||
                other.nvSocioeconomique == nvSocioeconomique) &&
            (identical(other.idSec, idSec) || other.idSec == idSec));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nomPatient,
      prenPatient,
      cinCnam,
      telephone,
      dateNaiss,
      sexe,
      ageInt,
      etatcivil,
      origine,
      lieuderesidence,
      villederesidence,
      nvscolaire,
      typeProf,
      nvSocioeconomique,
      idSec);

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePatientRequestImplCopyWith<_$CreatePatientRequestImpl>
      get copyWith =>
          __$$CreatePatientRequestImplCopyWithImpl<_$CreatePatientRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePatientRequestImplToJson(
      this,
    );
  }
}

abstract class _CreatePatientRequest implements CreatePatientRequest {
  const factory _CreatePatientRequest(
      {required final String nomPatient,
      required final String prenPatient,
      final int? cinCnam,
      final int? telephone,
      final String? dateNaiss,
      required final PatientGender sexe,
      required final AgeRange ageInt,
      required final MaritalStatus etatcivil,
      required final Origin origine,
      required final LivingSituation lieuderesidence,
      required final CityOfResidence villederesidence,
      required final EducationLevel nvscolaire,
      required final ProfessionType typeProf,
      required final SocioeconomicLevel nvSocioeconomique,
      final String? idSec}) = _$CreatePatientRequestImpl;

  factory _CreatePatientRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePatientRequestImpl.fromJson;

  @override
  String get nomPatient;
  @override
  String get prenPatient;
  @override
  int? get cinCnam;
  @override
  int? get telephone;
  @override
  String? get dateNaiss;
  @override
  PatientGender get sexe;
  @override
  AgeRange get ageInt;
  @override
  MaritalStatus get etatcivil;
  @override
  Origin get origine;
  @override
  LivingSituation get lieuderesidence;
  @override
  CityOfResidence get villederesidence;
  @override
  EducationLevel get nvscolaire;
  @override
  ProfessionType get typeProf;
  @override
  SocioeconomicLevel get nvSocioeconomique;
  @override
  String? get idSec;

  /// Create a copy of CreatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePatientRequestImplCopyWith<_$CreatePatientRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdatePatientRequest _$UpdatePatientRequestFromJson(Map<String, dynamic> json) {
  return _UpdatePatientRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePatientRequest {
  String? get nomPatient => throw _privateConstructorUsedError;
  String? get prenPatient => throw _privateConstructorUsedError;
  int? get cinCnam => throw _privateConstructorUsedError;
  int? get telephone => throw _privateConstructorUsedError;
  String? get dateNaiss => throw _privateConstructorUsedError;
  PatientGender? get sexe => throw _privateConstructorUsedError;
  AgeRange? get ageInt => throw _privateConstructorUsedError;
  MaritalStatus? get etatcivil => throw _privateConstructorUsedError;
  Origin? get origine => throw _privateConstructorUsedError;
  LivingSituation? get lieuderesidence => throw _privateConstructorUsedError;
  CityOfResidence? get villederesidence => throw _privateConstructorUsedError;
  EducationLevel? get nvscolaire => throw _privateConstructorUsedError;
  ProfessionType? get typeProf => throw _privateConstructorUsedError;
  SocioeconomicLevel? get nvSocioeconomique =>
      throw _privateConstructorUsedError;
  String? get idSec => throw _privateConstructorUsedError;

  /// Serializes this UpdatePatientRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePatientRequestCopyWith<UpdatePatientRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePatientRequestCopyWith<$Res> {
  factory $UpdatePatientRequestCopyWith(UpdatePatientRequest value,
          $Res Function(UpdatePatientRequest) then) =
      _$UpdatePatientRequestCopyWithImpl<$Res, UpdatePatientRequest>;
  @useResult
  $Res call(
      {String? nomPatient,
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
      String? idSec});
}

/// @nodoc
class _$UpdatePatientRequestCopyWithImpl<$Res,
        $Val extends UpdatePatientRequest>
    implements $UpdatePatientRequestCopyWith<$Res> {
  _$UpdatePatientRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomPatient = freezed,
    Object? prenPatient = freezed,
    Object? cinCnam = freezed,
    Object? telephone = freezed,
    Object? dateNaiss = freezed,
    Object? sexe = freezed,
    Object? ageInt = freezed,
    Object? etatcivil = freezed,
    Object? origine = freezed,
    Object? lieuderesidence = freezed,
    Object? villederesidence = freezed,
    Object? nvscolaire = freezed,
    Object? typeProf = freezed,
    Object? nvSocioeconomique = freezed,
    Object? idSec = freezed,
  }) {
    return _then(_value.copyWith(
      nomPatient: freezed == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      prenPatient: freezed == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as PatientGender?,
      ageInt: freezed == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as AgeRange?,
      etatcivil: freezed == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as MaritalStatus?,
      origine: freezed == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as Origin?,
      lieuderesidence: freezed == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as LivingSituation?,
      villederesidence: freezed == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as CityOfResidence?,
      nvscolaire: freezed == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as EducationLevel?,
      typeProf: freezed == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as ProfessionType?,
      nvSocioeconomique: freezed == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as SocioeconomicLevel?,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePatientRequestImplCopyWith<$Res>
    implements $UpdatePatientRequestCopyWith<$Res> {
  factory _$$UpdatePatientRequestImplCopyWith(_$UpdatePatientRequestImpl value,
          $Res Function(_$UpdatePatientRequestImpl) then) =
      __$$UpdatePatientRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nomPatient,
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
      String? idSec});
}

/// @nodoc
class __$$UpdatePatientRequestImplCopyWithImpl<$Res>
    extends _$UpdatePatientRequestCopyWithImpl<$Res, _$UpdatePatientRequestImpl>
    implements _$$UpdatePatientRequestImplCopyWith<$Res> {
  __$$UpdatePatientRequestImplCopyWithImpl(_$UpdatePatientRequestImpl _value,
      $Res Function(_$UpdatePatientRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomPatient = freezed,
    Object? prenPatient = freezed,
    Object? cinCnam = freezed,
    Object? telephone = freezed,
    Object? dateNaiss = freezed,
    Object? sexe = freezed,
    Object? ageInt = freezed,
    Object? etatcivil = freezed,
    Object? origine = freezed,
    Object? lieuderesidence = freezed,
    Object? villederesidence = freezed,
    Object? nvscolaire = freezed,
    Object? typeProf = freezed,
    Object? nvSocioeconomique = freezed,
    Object? idSec = freezed,
  }) {
    return _then(_$UpdatePatientRequestImpl(
      nomPatient: freezed == nomPatient
          ? _value.nomPatient
          : nomPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      prenPatient: freezed == prenPatient
          ? _value.prenPatient
          : prenPatient // ignore: cast_nullable_to_non_nullable
              as String?,
      cinCnam: freezed == cinCnam
          ? _value.cinCnam
          : cinCnam // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as PatientGender?,
      ageInt: freezed == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as AgeRange?,
      etatcivil: freezed == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as MaritalStatus?,
      origine: freezed == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as Origin?,
      lieuderesidence: freezed == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as LivingSituation?,
      villederesidence: freezed == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as CityOfResidence?,
      nvscolaire: freezed == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as EducationLevel?,
      typeProf: freezed == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as ProfessionType?,
      nvSocioeconomique: freezed == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as SocioeconomicLevel?,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePatientRequestImpl implements _UpdatePatientRequest {
  const _$UpdatePatientRequestImpl(
      {this.nomPatient,
      this.prenPatient,
      this.cinCnam,
      this.telephone,
      this.dateNaiss,
      this.sexe,
      this.ageInt,
      this.etatcivil,
      this.origine,
      this.lieuderesidence,
      this.villederesidence,
      this.nvscolaire,
      this.typeProf,
      this.nvSocioeconomique,
      this.idSec});

  factory _$UpdatePatientRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePatientRequestImplFromJson(json);

  @override
  final String? nomPatient;
  @override
  final String? prenPatient;
  @override
  final int? cinCnam;
  @override
  final int? telephone;
  @override
  final String? dateNaiss;
  @override
  final PatientGender? sexe;
  @override
  final AgeRange? ageInt;
  @override
  final MaritalStatus? etatcivil;
  @override
  final Origin? origine;
  @override
  final LivingSituation? lieuderesidence;
  @override
  final CityOfResidence? villederesidence;
  @override
  final EducationLevel? nvscolaire;
  @override
  final ProfessionType? typeProf;
  @override
  final SocioeconomicLevel? nvSocioeconomique;
  @override
  final String? idSec;

  @override
  String toString() {
    return 'UpdatePatientRequest(nomPatient: $nomPatient, prenPatient: $prenPatient, cinCnam: $cinCnam, telephone: $telephone, dateNaiss: $dateNaiss, sexe: $sexe, ageInt: $ageInt, etatcivil: $etatcivil, origine: $origine, lieuderesidence: $lieuderesidence, villederesidence: $villederesidence, nvscolaire: $nvscolaire, typeProf: $typeProf, nvSocioeconomique: $nvSocioeconomique, idSec: $idSec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePatientRequestImpl &&
            (identical(other.nomPatient, nomPatient) ||
                other.nomPatient == nomPatient) &&
            (identical(other.prenPatient, prenPatient) ||
                other.prenPatient == prenPatient) &&
            (identical(other.cinCnam, cinCnam) || other.cinCnam == cinCnam) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.dateNaiss, dateNaiss) ||
                other.dateNaiss == dateNaiss) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.ageInt, ageInt) || other.ageInt == ageInt) &&
            (identical(other.etatcivil, etatcivil) ||
                other.etatcivil == etatcivil) &&
            (identical(other.origine, origine) || other.origine == origine) &&
            (identical(other.lieuderesidence, lieuderesidence) ||
                other.lieuderesidence == lieuderesidence) &&
            (identical(other.villederesidence, villederesidence) ||
                other.villederesidence == villederesidence) &&
            (identical(other.nvscolaire, nvscolaire) ||
                other.nvscolaire == nvscolaire) &&
            (identical(other.typeProf, typeProf) ||
                other.typeProf == typeProf) &&
            (identical(other.nvSocioeconomique, nvSocioeconomique) ||
                other.nvSocioeconomique == nvSocioeconomique) &&
            (identical(other.idSec, idSec) || other.idSec == idSec));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      nomPatient,
      prenPatient,
      cinCnam,
      telephone,
      dateNaiss,
      sexe,
      ageInt,
      etatcivil,
      origine,
      lieuderesidence,
      villederesidence,
      nvscolaire,
      typeProf,
      nvSocioeconomique,
      idSec);

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePatientRequestImplCopyWith<_$UpdatePatientRequestImpl>
      get copyWith =>
          __$$UpdatePatientRequestImplCopyWithImpl<_$UpdatePatientRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePatientRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdatePatientRequest implements UpdatePatientRequest {
  const factory _UpdatePatientRequest(
      {final String? nomPatient,
      final String? prenPatient,
      final int? cinCnam,
      final int? telephone,
      final String? dateNaiss,
      final PatientGender? sexe,
      final AgeRange? ageInt,
      final MaritalStatus? etatcivil,
      final Origin? origine,
      final LivingSituation? lieuderesidence,
      final CityOfResidence? villederesidence,
      final EducationLevel? nvscolaire,
      final ProfessionType? typeProf,
      final SocioeconomicLevel? nvSocioeconomique,
      final String? idSec}) = _$UpdatePatientRequestImpl;

  factory _UpdatePatientRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePatientRequestImpl.fromJson;

  @override
  String? get nomPatient;
  @override
  String? get prenPatient;
  @override
  int? get cinCnam;
  @override
  int? get telephone;
  @override
  String? get dateNaiss;
  @override
  PatientGender? get sexe;
  @override
  AgeRange? get ageInt;
  @override
  MaritalStatus? get etatcivil;
  @override
  Origin? get origine;
  @override
  LivingSituation? get lieuderesidence;
  @override
  CityOfResidence? get villederesidence;
  @override
  EducationLevel? get nvscolaire;
  @override
  ProfessionType? get typeProf;
  @override
  SocioeconomicLevel? get nvSocioeconomique;
  @override
  String? get idSec;

  /// Create a copy of UpdatePatientRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePatientRequestImplCopyWith<_$UpdatePatientRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RequestPatientDeletionRequest _$RequestPatientDeletionRequestFromJson(
    Map<String, dynamic> json) {
  return _RequestPatientDeletionRequest.fromJson(json);
}

/// @nodoc
mixin _$RequestPatientDeletionRequest {
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this RequestPatientDeletionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestPatientDeletionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestPatientDeletionRequestCopyWith<RequestPatientDeletionRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestPatientDeletionRequestCopyWith<$Res> {
  factory $RequestPatientDeletionRequestCopyWith(
          RequestPatientDeletionRequest value,
          $Res Function(RequestPatientDeletionRequest) then) =
      _$RequestPatientDeletionRequestCopyWithImpl<$Res,
          RequestPatientDeletionRequest>;
  @useResult
  $Res call({String reason});
}

/// @nodoc
class _$RequestPatientDeletionRequestCopyWithImpl<$Res,
        $Val extends RequestPatientDeletionRequest>
    implements $RequestPatientDeletionRequestCopyWith<$Res> {
  _$RequestPatientDeletionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestPatientDeletionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestPatientDeletionRequestImplCopyWith<$Res>
    implements $RequestPatientDeletionRequestCopyWith<$Res> {
  factory _$$RequestPatientDeletionRequestImplCopyWith(
          _$RequestPatientDeletionRequestImpl value,
          $Res Function(_$RequestPatientDeletionRequestImpl) then) =
      __$$RequestPatientDeletionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reason});
}

/// @nodoc
class __$$RequestPatientDeletionRequestImplCopyWithImpl<$Res>
    extends _$RequestPatientDeletionRequestCopyWithImpl<$Res,
        _$RequestPatientDeletionRequestImpl>
    implements _$$RequestPatientDeletionRequestImplCopyWith<$Res> {
  __$$RequestPatientDeletionRequestImplCopyWithImpl(
      _$RequestPatientDeletionRequestImpl _value,
      $Res Function(_$RequestPatientDeletionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestPatientDeletionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = null,
  }) {
    return _then(_$RequestPatientDeletionRequestImpl(
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestPatientDeletionRequestImpl
    implements _RequestPatientDeletionRequest {
  const _$RequestPatientDeletionRequestImpl({required this.reason});

  factory _$RequestPatientDeletionRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestPatientDeletionRequestImplFromJson(json);

  @override
  final String reason;

  @override
  String toString() {
    return 'RequestPatientDeletionRequest(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestPatientDeletionRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of RequestPatientDeletionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestPatientDeletionRequestImplCopyWith<
          _$RequestPatientDeletionRequestImpl>
      get copyWith => __$$RequestPatientDeletionRequestImplCopyWithImpl<
          _$RequestPatientDeletionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestPatientDeletionRequestImplToJson(
      this,
    );
  }
}

abstract class _RequestPatientDeletionRequest
    implements RequestPatientDeletionRequest {
  const factory _RequestPatientDeletionRequest({required final String reason}) =
      _$RequestPatientDeletionRequestImpl;

  factory _RequestPatientDeletionRequest.fromJson(Map<String, dynamic> json) =
      _$RequestPatientDeletionRequestImpl.fromJson;

  @override
  String get reason;

  /// Create a copy of RequestPatientDeletionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestPatientDeletionRequestImplCopyWith<
          _$RequestPatientDeletionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
