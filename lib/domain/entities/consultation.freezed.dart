// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultationPatientInfo _$ConsultationPatientInfoFromJson(
    Map<String, dynamic> json) {
  return _ConsultationPatientInfo.fromJson(json);
}

/// @nodoc
mixin _$ConsultationPatientInfo {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom_patient')
  String get nomPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'pren_patient')
  String get prenPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'cin_cnam')
  int? get cinCnam => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_naiss')
  String? get dateNaiss => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_int')
  String? get ageInt => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephone')
  int? get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'sexe')
  String? get sexe => throw _privateConstructorUsedError;
  @JsonKey(name: 'etatcivil')
  String? get etatcivil => throw _privateConstructorUsedError;
  @JsonKey(name: 'origine')
  String? get origine => throw _privateConstructorUsedError;
  @JsonKey(name: 'lieuderesidence')
  String? get lieuderesidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'villederesidence')
  String? get villederesidence => throw _privateConstructorUsedError;
  @JsonKey(name: 'nvscolaire')
  String? get nvscolaire => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_prof')
  String? get typeProf => throw _privateConstructorUsedError;
  @JsonKey(name: 'nv_socioeconomique')
  String? get nvSocioeconomique => throw _privateConstructorUsedError;

  /// Serializes this ConsultationPatientInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsultationPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationPatientInfoCopyWith<ConsultationPatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationPatientInfoCopyWith<$Res> {
  factory $ConsultationPatientInfoCopyWith(ConsultationPatientInfo value,
          $Res Function(ConsultationPatientInfo) then) =
      _$ConsultationPatientInfoCopyWithImpl<$Res, ConsultationPatientInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'nom_patient') String nomPatient,
      @JsonKey(name: 'pren_patient') String prenPatient,
      @JsonKey(name: 'cin_cnam') int? cinCnam,
      @JsonKey(name: 'date_naiss') String? dateNaiss,
      @JsonKey(name: 'age_int') String? ageInt,
      @JsonKey(name: 'telephone') int? telephone,
      @JsonKey(name: 'sexe') String? sexe,
      @JsonKey(name: 'etatcivil') String? etatcivil,
      @JsonKey(name: 'origine') String? origine,
      @JsonKey(name: 'lieuderesidence') String? lieuderesidence,
      @JsonKey(name: 'villederesidence') String? villederesidence,
      @JsonKey(name: 'nvscolaire') String? nvscolaire,
      @JsonKey(name: 'type_prof') String? typeProf,
      @JsonKey(name: 'nv_socioeconomique') String? nvSocioeconomique});
}

/// @nodoc
class _$ConsultationPatientInfoCopyWithImpl<$Res,
        $Val extends ConsultationPatientInfo>
    implements $ConsultationPatientInfoCopyWith<$Res> {
  _$ConsultationPatientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsultationPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = freezed,
    Object? dateNaiss = freezed,
    Object? ageInt = freezed,
    Object? telephone = freezed,
    Object? sexe = freezed,
    Object? etatcivil = freezed,
    Object? origine = freezed,
    Object? lieuderesidence = freezed,
    Object? villederesidence = freezed,
    Object? nvscolaire = freezed,
    Object? typeProf = freezed,
    Object? nvSocioeconomique = freezed,
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
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      ageInt: freezed == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String?,
      etatcivil: freezed == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as String?,
      origine: freezed == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuderesidence: freezed == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      villederesidence: freezed == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      nvscolaire: freezed == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as String?,
      typeProf: freezed == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as String?,
      nvSocioeconomique: freezed == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultationPatientInfoImplCopyWith<$Res>
    implements $ConsultationPatientInfoCopyWith<$Res> {
  factory _$$ConsultationPatientInfoImplCopyWith(
          _$ConsultationPatientInfoImpl value,
          $Res Function(_$ConsultationPatientInfoImpl) then) =
      __$$ConsultationPatientInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'nom_patient') String nomPatient,
      @JsonKey(name: 'pren_patient') String prenPatient,
      @JsonKey(name: 'cin_cnam') int? cinCnam,
      @JsonKey(name: 'date_naiss') String? dateNaiss,
      @JsonKey(name: 'age_int') String? ageInt,
      @JsonKey(name: 'telephone') int? telephone,
      @JsonKey(name: 'sexe') String? sexe,
      @JsonKey(name: 'etatcivil') String? etatcivil,
      @JsonKey(name: 'origine') String? origine,
      @JsonKey(name: 'lieuderesidence') String? lieuderesidence,
      @JsonKey(name: 'villederesidence') String? villederesidence,
      @JsonKey(name: 'nvscolaire') String? nvscolaire,
      @JsonKey(name: 'type_prof') String? typeProf,
      @JsonKey(name: 'nv_socioeconomique') String? nvSocioeconomique});
}

/// @nodoc
class __$$ConsultationPatientInfoImplCopyWithImpl<$Res>
    extends _$ConsultationPatientInfoCopyWithImpl<$Res,
        _$ConsultationPatientInfoImpl>
    implements _$$ConsultationPatientInfoImplCopyWith<$Res> {
  __$$ConsultationPatientInfoImplCopyWithImpl(
      _$ConsultationPatientInfoImpl _value,
      $Res Function(_$ConsultationPatientInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsultationPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nomPatient = null,
    Object? prenPatient = null,
    Object? cinCnam = freezed,
    Object? dateNaiss = freezed,
    Object? ageInt = freezed,
    Object? telephone = freezed,
    Object? sexe = freezed,
    Object? etatcivil = freezed,
    Object? origine = freezed,
    Object? lieuderesidence = freezed,
    Object? villederesidence = freezed,
    Object? nvscolaire = freezed,
    Object? typeProf = freezed,
    Object? nvSocioeconomique = freezed,
  }) {
    return _then(_$ConsultationPatientInfoImpl(
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
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      ageInt: freezed == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String?,
      etatcivil: freezed == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as String?,
      origine: freezed == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuderesidence: freezed == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      villederesidence: freezed == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      nvscolaire: freezed == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as String?,
      typeProf: freezed == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as String?,
      nvSocioeconomique: freezed == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationPatientInfoImpl implements _ConsultationPatientInfo {
  const _$ConsultationPatientInfoImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'nom_patient') required this.nomPatient,
      @JsonKey(name: 'pren_patient') required this.prenPatient,
      @JsonKey(name: 'cin_cnam') this.cinCnam,
      @JsonKey(name: 'date_naiss') this.dateNaiss,
      @JsonKey(name: 'age_int') this.ageInt,
      @JsonKey(name: 'telephone') this.telephone,
      @JsonKey(name: 'sexe') this.sexe,
      @JsonKey(name: 'etatcivil') this.etatcivil,
      @JsonKey(name: 'origine') this.origine,
      @JsonKey(name: 'lieuderesidence') this.lieuderesidence,
      @JsonKey(name: 'villederesidence') this.villederesidence,
      @JsonKey(name: 'nvscolaire') this.nvscolaire,
      @JsonKey(name: 'type_prof') this.typeProf,
      @JsonKey(name: 'nv_socioeconomique') this.nvSocioeconomique});

  factory _$ConsultationPatientInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationPatientInfoImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'nom_patient')
  final String nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  final String prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  final int? cinCnam;
  @override
  @JsonKey(name: 'date_naiss')
  final String? dateNaiss;
  @override
  @JsonKey(name: 'age_int')
  final String? ageInt;
  @override
  @JsonKey(name: 'telephone')
  final int? telephone;
  @override
  @JsonKey(name: 'sexe')
  final String? sexe;
  @override
  @JsonKey(name: 'etatcivil')
  final String? etatcivil;
  @override
  @JsonKey(name: 'origine')
  final String? origine;
  @override
  @JsonKey(name: 'lieuderesidence')
  final String? lieuderesidence;
  @override
  @JsonKey(name: 'villederesidence')
  final String? villederesidence;
  @override
  @JsonKey(name: 'nvscolaire')
  final String? nvscolaire;
  @override
  @JsonKey(name: 'type_prof')
  final String? typeProf;
  @override
  @JsonKey(name: 'nv_socioeconomique')
  final String? nvSocioeconomique;

  @override
  String toString() {
    return 'ConsultationPatientInfo(id: $id, nomPatient: $nomPatient, prenPatient: $prenPatient, cinCnam: $cinCnam, dateNaiss: $dateNaiss, ageInt: $ageInt, telephone: $telephone, sexe: $sexe, etatcivil: $etatcivil, origine: $origine, lieuderesidence: $lieuderesidence, villederesidence: $villederesidence, nvscolaire: $nvscolaire, typeProf: $typeProf, nvSocioeconomique: $nvSocioeconomique)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationPatientInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nomPatient, nomPatient) ||
                other.nomPatient == nomPatient) &&
            (identical(other.prenPatient, prenPatient) ||
                other.prenPatient == prenPatient) &&
            (identical(other.cinCnam, cinCnam) || other.cinCnam == cinCnam) &&
            (identical(other.dateNaiss, dateNaiss) ||
                other.dateNaiss == dateNaiss) &&
            (identical(other.ageInt, ageInt) || other.ageInt == ageInt) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
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
                other.nvSocioeconomique == nvSocioeconomique));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nomPatient,
      prenPatient,
      cinCnam,
      dateNaiss,
      ageInt,
      telephone,
      sexe,
      etatcivil,
      origine,
      lieuderesidence,
      villederesidence,
      nvscolaire,
      typeProf,
      nvSocioeconomique);

  /// Create a copy of ConsultationPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationPatientInfoImplCopyWith<_$ConsultationPatientInfoImpl>
      get copyWith => __$$ConsultationPatientInfoImplCopyWithImpl<
          _$ConsultationPatientInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationPatientInfoImplToJson(
      this,
    );
  }
}

abstract class _ConsultationPatientInfo implements ConsultationPatientInfo {
  const factory _ConsultationPatientInfo(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'nom_patient') required final String nomPatient,
      @JsonKey(name: 'pren_patient') required final String prenPatient,
      @JsonKey(name: 'cin_cnam') final int? cinCnam,
      @JsonKey(name: 'date_naiss') final String? dateNaiss,
      @JsonKey(name: 'age_int') final String? ageInt,
      @JsonKey(name: 'telephone') final int? telephone,
      @JsonKey(name: 'sexe') final String? sexe,
      @JsonKey(name: 'etatcivil') final String? etatcivil,
      @JsonKey(name: 'origine') final String? origine,
      @JsonKey(name: 'lieuderesidence') final String? lieuderesidence,
      @JsonKey(name: 'villederesidence') final String? villederesidence,
      @JsonKey(name: 'nvscolaire') final String? nvscolaire,
      @JsonKey(name: 'type_prof') final String? typeProf,
      @JsonKey(name: 'nv_socioeconomique')
      final String? nvSocioeconomique}) = _$ConsultationPatientInfoImpl;

  factory _ConsultationPatientInfo.fromJson(Map<String, dynamic> json) =
      _$ConsultationPatientInfoImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'nom_patient')
  String get nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  String get prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  int? get cinCnam;
  @override
  @JsonKey(name: 'date_naiss')
  String? get dateNaiss;
  @override
  @JsonKey(name: 'age_int')
  String? get ageInt;
  @override
  @JsonKey(name: 'telephone')
  int? get telephone;
  @override
  @JsonKey(name: 'sexe')
  String? get sexe;
  @override
  @JsonKey(name: 'etatcivil')
  String? get etatcivil;
  @override
  @JsonKey(name: 'origine')
  String? get origine;
  @override
  @JsonKey(name: 'lieuderesidence')
  String? get lieuderesidence;
  @override
  @JsonKey(name: 'villederesidence')
  String? get villederesidence;
  @override
  @JsonKey(name: 'nvscolaire')
  String? get nvscolaire;
  @override
  @JsonKey(name: 'type_prof')
  String? get typeProf;
  @override
  @JsonKey(name: 'nv_socioeconomique')
  String? get nvSocioeconomique;

  /// Create a copy of ConsultationPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationPatientInfoImplCopyWith<_$ConsultationPatientInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Consultation {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_consult')
  String get numConsult => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_dossier')
  ConsultationPatientInfo? get numDossier => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_med')
  String? get idMed => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_heure')
  String? get dateHeure =>
      throw _privateConstructorUsedError; // Addiction and substance abuse
  bool get addiction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TABAC')
  bool get tabac => throw _privateConstructorUsedError;
  bool get alcool => throw _privateConstructorUsedError;
  bool get cannabis => throw _privateConstructorUsedError;
  bool get medicaments => throw _privateConstructorUsedError;
  bool get solvantsorg =>
      throw _privateConstructorUsedError; // Psychiatric history
  @JsonKey(name: 'AtcdsP_TS')
  bool get atcdsPTs => throw _privateConstructorUsedError;
  @JsonKey(name: 'idees_sui_ant')
  bool get ideesSuiAnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'hospit_ant')
  bool get hospitAnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'atcdsFam_SUI')
  bool get atcdsFamSui => throw _privateConstructorUsedError;
  @JsonKey(name: 'suicide_accompli')
  bool get suicideAccompli => throw _privateConstructorUsedError;
  @JsonKey(name: 'AtcdsP_somatik')
  bool get atcdsPSomatik => throw _privateConstructorUsedError;
  @JsonKey(name: 'cond_impulsiv')
  bool get condImpulsiv => throw _privateConstructorUsedError;
  bool get automil => throw _privateConstructorUsedError;
  @JsonKey(name: 'atcds_p_judic')
  bool get atcdsPJudic => throw _privateConstructorUsedError; // Suicide methods
  bool get immolation => throw _privateConstructorUsedError;
  bool get moyenphlebotomie => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mpendaison')
  bool get mpendaison => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mmedicaments')
  bool get mmedicaments => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mstrangulation')
  bool? get mstrangulation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mingestiontox')
  bool get mingestiontox => throw _privateConstructorUsedError;
  @JsonKey(name: 'EQUIsui')
  bool get equiSui => throw _privateConstructorUsedError;
  bool get sautaltitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mautres')
  bool get mautres => throw _privateConstructorUsedError; // Clinical assessment
  @JsonKey(name: 'nombres_hospit')
  String? get nombresHospit => throw _privateConstructorUsedError;
  @JsonKey(name: 'famille_contenante')
  bool get familleContenante => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_atcdspsy')
  TypeAtcdsPsy? get typeAtcdsPsy => throw _privateConstructorUsedError;
  @JsonKey(name: 'diagnostic_retenu')
  DiagnosticRetenu? get diagnosticRetenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_personn')
  TypePersonnalite? get typePersonn => throw _privateConstructorUsedError;
  @JsonKey(name: 'reaction_stress')
  bool get reactionStress => throw _privateConstructorUsedError;
  @JsonKey(name: 'injonc_suicidaires')
  bool get injoncSuicidaires => throw _privateConstructorUsedError;
  @JsonKey(name: 'angoisse_psychotique')
  bool get angoissePsychotique => throw _privateConstructorUsedError;
  bool get etatdepressif => throw _privateConstructorUsedError; // Statistics
  @JsonKey(name: 'nbres_de_ts')
  String? get nbresDeTs => throw _privateConstructorUsedError;
  @JsonKey(name: 'anciennetemaladie')
  String? get ancienneteMaladie => throw _privateConstructorUsedError;
  @JsonKey(name: 'agedebutannee')
  String? get ageDebutAnne => throw _privateConstructorUsedError;
  @JsonKey(name: 'motifTS')
  bool get motifTs => throw _privateConstructorUsedError;
  String? get remarque =>
      throw _privateConstructorUsedError; // Patient details (duplicated in consultation)
  @JsonKey(name: 'nom_patient')
  String? get nomPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'pren_patient')
  String? get prenPatient => throw _privateConstructorUsedError;
  @JsonKey(name: 'cin_cnam')
  int? get cinCnam => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_naiss')
  String? get dateNaiss => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_int')
  String? get ageInt => throw _privateConstructorUsedError;
  int? get telephone => throw _privateConstructorUsedError;
  String? get sexe => throw _privateConstructorUsedError;
  String? get etatcivil => throw _privateConstructorUsedError;
  String? get origine => throw _privateConstructorUsedError;
  String? get lieuderesidence => throw _privateConstructorUsedError;
  String? get villederesidence => throw _privateConstructorUsedError;
  String? get nvscolaire => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_prof')
  String? get typeProf => throw _privateConstructorUsedError;
  @JsonKey(name: 'nv_socioeconomique')
  String? get nvSocioeconomique =>
      throw _privateConstructorUsedError; // Medical staff info
  @JsonKey(name: 'id_sec')
  String? get idSec => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom_med')
  String? get nomMed => throw _privateConstructorUsedError;
  @JsonKey(name: 'pren_med')
  String? get prenMed => throw _privateConstructorUsedError; // Prediction
  @JsonKey(name: 'prediction_generee')
  bool get predictionGeneree => throw _privateConstructorUsedError;
  @JsonKey(name: 'prediction_risque')
  String? get predictionRisque => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_prediction')
  DateTime? get datePrediction => throw _privateConstructorUsedError;
  @JsonKey(name: 'prediction_results')
  PredictionResults? get predictionResults =>
      throw _privateConstructorUsedError; // Timestamps
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationCopyWith<Consultation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationCopyWith<$Res> {
  factory $ConsultationCopyWith(
          Consultation value, $Res Function(Consultation) then) =
      _$ConsultationCopyWithImpl<$Res, Consultation>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'num_consult') String numConsult,
      @JsonKey(name: 'num_dossier') ConsultationPatientInfo? numDossier,
      @JsonKey(name: 'id_med') String? idMed,
      @JsonKey(name: 'date_heure') String? dateHeure,
      bool addiction,
      @JsonKey(name: 'TABAC') bool tabac,
      bool alcool,
      bool cannabis,
      bool medicaments,
      bool solvantsorg,
      @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') bool hospitAnt,
      @JsonKey(name: 'atcdsFam_SUI') bool atcdsFamSui,
      @JsonKey(name: 'suicide_accompli') bool suicideAccompli,
      @JsonKey(name: 'AtcdsP_somatik') bool atcdsPSomatik,
      @JsonKey(name: 'cond_impulsiv') bool condImpulsiv,
      bool automil,
      @JsonKey(name: 'atcds_p_judic') bool atcdsPJudic,
      bool immolation,
      bool moyenphlebotomie,
      @JsonKey(name: 'Mpendaison') bool mpendaison,
      @JsonKey(name: 'Mmedicaments') bool mmedicaments,
      @JsonKey(name: 'Mstrangulation') bool? mstrangulation,
      @JsonKey(name: 'Mingestiontox') bool mingestiontox,
      @JsonKey(name: 'EQUIsui') bool equiSui,
      bool sautaltitude,
      @JsonKey(name: 'Mautres') bool mautres,
      @JsonKey(name: 'nombres_hospit') String? nombresHospit,
      @JsonKey(name: 'famille_contenante') bool familleContenante,
      @JsonKey(name: 'type_atcdspsy') TypeAtcdsPsy? typeAtcdsPsy,
      @JsonKey(name: 'diagnostic_retenu') DiagnosticRetenu? diagnosticRetenu,
      @JsonKey(name: 'type_personn') TypePersonnalite? typePersonn,
      @JsonKey(name: 'reaction_stress') bool reactionStress,
      @JsonKey(name: 'injonc_suicidaires') bool injoncSuicidaires,
      @JsonKey(name: 'angoisse_psychotique') bool angoissePsychotique,
      bool etatdepressif,
      @JsonKey(name: 'nbres_de_ts') String? nbresDeTs,
      @JsonKey(name: 'anciennetemaladie') String? ancienneteMaladie,
      @JsonKey(name: 'agedebutannee') String? ageDebutAnne,
      @JsonKey(name: 'motifTS') bool motifTs,
      String? remarque,
      @JsonKey(name: 'nom_patient') String? nomPatient,
      @JsonKey(name: 'pren_patient') String? prenPatient,
      @JsonKey(name: 'cin_cnam') int? cinCnam,
      @JsonKey(name: 'date_naiss') String? dateNaiss,
      @JsonKey(name: 'age_int') String? ageInt,
      int? telephone,
      String? sexe,
      String? etatcivil,
      String? origine,
      String? lieuderesidence,
      String? villederesidence,
      String? nvscolaire,
      @JsonKey(name: 'type_prof') String? typeProf,
      @JsonKey(name: 'nv_socioeconomique') String? nvSocioeconomique,
      @JsonKey(name: 'id_sec') String? idSec,
      @JsonKey(name: 'nom_med') String? nomMed,
      @JsonKey(name: 'pren_med') String? prenMed,
      @JsonKey(name: 'prediction_generee') bool predictionGeneree,
      @JsonKey(name: 'prediction_risque') String? predictionRisque,
      @JsonKey(name: 'date_prediction') DateTime? datePrediction,
      @JsonKey(name: 'prediction_results') PredictionResults? predictionResults,
      DateTime? createdAt,
      DateTime? updatedAt});

  $ConsultationPatientInfoCopyWith<$Res>? get numDossier;
  $PredictionResultsCopyWith<$Res>? get predictionResults;
}

/// @nodoc
class _$ConsultationCopyWithImpl<$Res, $Val extends Consultation>
    implements $ConsultationCopyWith<$Res> {
  _$ConsultationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numConsult = null,
    Object? numDossier = freezed,
    Object? idMed = freezed,
    Object? dateHeure = freezed,
    Object? addiction = null,
    Object? tabac = null,
    Object? alcool = null,
    Object? cannabis = null,
    Object? medicaments = null,
    Object? solvantsorg = null,
    Object? atcdsPTs = null,
    Object? ideesSuiAnt = null,
    Object? hospitAnt = null,
    Object? atcdsFamSui = null,
    Object? suicideAccompli = null,
    Object? atcdsPSomatik = null,
    Object? condImpulsiv = null,
    Object? automil = null,
    Object? atcdsPJudic = null,
    Object? immolation = null,
    Object? moyenphlebotomie = null,
    Object? mpendaison = null,
    Object? mmedicaments = null,
    Object? mstrangulation = freezed,
    Object? mingestiontox = null,
    Object? equiSui = null,
    Object? sautaltitude = null,
    Object? mautres = null,
    Object? nombresHospit = freezed,
    Object? familleContenante = null,
    Object? typeAtcdsPsy = freezed,
    Object? diagnosticRetenu = freezed,
    Object? typePersonn = freezed,
    Object? reactionStress = null,
    Object? injoncSuicidaires = null,
    Object? angoissePsychotique = null,
    Object? etatdepressif = null,
    Object? nbresDeTs = freezed,
    Object? ancienneteMaladie = freezed,
    Object? ageDebutAnne = freezed,
    Object? motifTs = null,
    Object? remarque = freezed,
    Object? nomPatient = freezed,
    Object? prenPatient = freezed,
    Object? cinCnam = freezed,
    Object? dateNaiss = freezed,
    Object? ageInt = freezed,
    Object? telephone = freezed,
    Object? sexe = freezed,
    Object? etatcivil = freezed,
    Object? origine = freezed,
    Object? lieuderesidence = freezed,
    Object? villederesidence = freezed,
    Object? nvscolaire = freezed,
    Object? typeProf = freezed,
    Object? nvSocioeconomique = freezed,
    Object? idSec = freezed,
    Object? nomMed = freezed,
    Object? prenMed = freezed,
    Object? predictionGeneree = null,
    Object? predictionRisque = freezed,
    Object? datePrediction = freezed,
    Object? predictionResults = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numConsult: null == numConsult
          ? _value.numConsult
          : numConsult // ignore: cast_nullable_to_non_nullable
              as String,
      numDossier: freezed == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as ConsultationPatientInfo?,
      idMed: freezed == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String?,
      dateHeure: freezed == dateHeure
          ? _value.dateHeure
          : dateHeure // ignore: cast_nullable_to_non_nullable
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
      solvantsorg: null == solvantsorg
          ? _value.solvantsorg
          : solvantsorg // ignore: cast_nullable_to_non_nullable
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
      atcdsFamSui: null == atcdsFamSui
          ? _value.atcdsFamSui
          : atcdsFamSui // ignore: cast_nullable_to_non_nullable
              as bool,
      suicideAccompli: null == suicideAccompli
          ? _value.suicideAccompli
          : suicideAccompli // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPSomatik: null == atcdsPSomatik
          ? _value.atcdsPSomatik
          : atcdsPSomatik // ignore: cast_nullable_to_non_nullable
              as bool,
      condImpulsiv: null == condImpulsiv
          ? _value.condImpulsiv
          : condImpulsiv // ignore: cast_nullable_to_non_nullable
              as bool,
      automil: null == automil
          ? _value.automil
          : automil // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPJudic: null == atcdsPJudic
          ? _value.atcdsPJudic
          : atcdsPJudic // ignore: cast_nullable_to_non_nullable
              as bool,
      immolation: null == immolation
          ? _value.immolation
          : immolation // ignore: cast_nullable_to_non_nullable
              as bool,
      moyenphlebotomie: null == moyenphlebotomie
          ? _value.moyenphlebotomie
          : moyenphlebotomie // ignore: cast_nullable_to_non_nullable
              as bool,
      mpendaison: null == mpendaison
          ? _value.mpendaison
          : mpendaison // ignore: cast_nullable_to_non_nullable
              as bool,
      mmedicaments: null == mmedicaments
          ? _value.mmedicaments
          : mmedicaments // ignore: cast_nullable_to_non_nullable
              as bool,
      mstrangulation: freezed == mstrangulation
          ? _value.mstrangulation
          : mstrangulation // ignore: cast_nullable_to_non_nullable
              as bool?,
      mingestiontox: null == mingestiontox
          ? _value.mingestiontox
          : mingestiontox // ignore: cast_nullable_to_non_nullable
              as bool,
      equiSui: null == equiSui
          ? _value.equiSui
          : equiSui // ignore: cast_nullable_to_non_nullable
              as bool,
      sautaltitude: null == sautaltitude
          ? _value.sautaltitude
          : sautaltitude // ignore: cast_nullable_to_non_nullable
              as bool,
      mautres: null == mautres
          ? _value.mautres
          : mautres // ignore: cast_nullable_to_non_nullable
              as bool,
      nombresHospit: freezed == nombresHospit
          ? _value.nombresHospit
          : nombresHospit // ignore: cast_nullable_to_non_nullable
              as String?,
      familleContenante: null == familleContenante
          ? _value.familleContenante
          : familleContenante // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAtcdsPsy: freezed == typeAtcdsPsy
          ? _value.typeAtcdsPsy
          : typeAtcdsPsy // ignore: cast_nullable_to_non_nullable
              as TypeAtcdsPsy?,
      diagnosticRetenu: freezed == diagnosticRetenu
          ? _value.diagnosticRetenu
          : diagnosticRetenu // ignore: cast_nullable_to_non_nullable
              as DiagnosticRetenu?,
      typePersonn: freezed == typePersonn
          ? _value.typePersonn
          : typePersonn // ignore: cast_nullable_to_non_nullable
              as TypePersonnalite?,
      reactionStress: null == reactionStress
          ? _value.reactionStress
          : reactionStress // ignore: cast_nullable_to_non_nullable
              as bool,
      injoncSuicidaires: null == injoncSuicidaires
          ? _value.injoncSuicidaires
          : injoncSuicidaires // ignore: cast_nullable_to_non_nullable
              as bool,
      angoissePsychotique: null == angoissePsychotique
          ? _value.angoissePsychotique
          : angoissePsychotique // ignore: cast_nullable_to_non_nullable
              as bool,
      etatdepressif: null == etatdepressif
          ? _value.etatdepressif
          : etatdepressif // ignore: cast_nullable_to_non_nullable
              as bool,
      nbresDeTs: freezed == nbresDeTs
          ? _value.nbresDeTs
          : nbresDeTs // ignore: cast_nullable_to_non_nullable
              as String?,
      ancienneteMaladie: freezed == ancienneteMaladie
          ? _value.ancienneteMaladie
          : ancienneteMaladie // ignore: cast_nullable_to_non_nullable
              as String?,
      ageDebutAnne: freezed == ageDebutAnne
          ? _value.ageDebutAnne
          : ageDebutAnne // ignore: cast_nullable_to_non_nullable
              as String?,
      motifTs: null == motifTs
          ? _value.motifTs
          : motifTs // ignore: cast_nullable_to_non_nullable
              as bool,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
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
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      ageInt: freezed == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String?,
      etatcivil: freezed == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as String?,
      origine: freezed == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuderesidence: freezed == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      villederesidence: freezed == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      nvscolaire: freezed == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as String?,
      typeProf: freezed == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as String?,
      nvSocioeconomique: freezed == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as String?,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
      nomMed: freezed == nomMed
          ? _value.nomMed
          : nomMed // ignore: cast_nullable_to_non_nullable
              as String?,
      prenMed: freezed == prenMed
          ? _value.prenMed
          : prenMed // ignore: cast_nullable_to_non_nullable
              as String?,
      predictionGeneree: null == predictionGeneree
          ? _value.predictionGeneree
          : predictionGeneree // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionRisque: freezed == predictionRisque
          ? _value.predictionRisque
          : predictionRisque // ignore: cast_nullable_to_non_nullable
              as String?,
      datePrediction: freezed == datePrediction
          ? _value.datePrediction
          : datePrediction // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      predictionResults: freezed == predictionResults
          ? _value.predictionResults
          : predictionResults // ignore: cast_nullable_to_non_nullable
              as PredictionResults?,
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

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConsultationPatientInfoCopyWith<$Res>? get numDossier {
    if (_value.numDossier == null) {
      return null;
    }

    return $ConsultationPatientInfoCopyWith<$Res>(_value.numDossier!, (value) {
      return _then(_value.copyWith(numDossier: value) as $Val);
    });
  }

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PredictionResultsCopyWith<$Res>? get predictionResults {
    if (_value.predictionResults == null) {
      return null;
    }

    return $PredictionResultsCopyWith<$Res>(_value.predictionResults!, (value) {
      return _then(_value.copyWith(predictionResults: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultationImplCopyWith<$Res>
    implements $ConsultationCopyWith<$Res> {
  factory _$$ConsultationImplCopyWith(
          _$ConsultationImpl value, $Res Function(_$ConsultationImpl) then) =
      __$$ConsultationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'num_consult') String numConsult,
      @JsonKey(name: 'num_dossier') ConsultationPatientInfo? numDossier,
      @JsonKey(name: 'id_med') String? idMed,
      @JsonKey(name: 'date_heure') String? dateHeure,
      bool addiction,
      @JsonKey(name: 'TABAC') bool tabac,
      bool alcool,
      bool cannabis,
      bool medicaments,
      bool solvantsorg,
      @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') bool hospitAnt,
      @JsonKey(name: 'atcdsFam_SUI') bool atcdsFamSui,
      @JsonKey(name: 'suicide_accompli') bool suicideAccompli,
      @JsonKey(name: 'AtcdsP_somatik') bool atcdsPSomatik,
      @JsonKey(name: 'cond_impulsiv') bool condImpulsiv,
      bool automil,
      @JsonKey(name: 'atcds_p_judic') bool atcdsPJudic,
      bool immolation,
      bool moyenphlebotomie,
      @JsonKey(name: 'Mpendaison') bool mpendaison,
      @JsonKey(name: 'Mmedicaments') bool mmedicaments,
      @JsonKey(name: 'Mstrangulation') bool? mstrangulation,
      @JsonKey(name: 'Mingestiontox') bool mingestiontox,
      @JsonKey(name: 'EQUIsui') bool equiSui,
      bool sautaltitude,
      @JsonKey(name: 'Mautres') bool mautres,
      @JsonKey(name: 'nombres_hospit') String? nombresHospit,
      @JsonKey(name: 'famille_contenante') bool familleContenante,
      @JsonKey(name: 'type_atcdspsy') TypeAtcdsPsy? typeAtcdsPsy,
      @JsonKey(name: 'diagnostic_retenu') DiagnosticRetenu? diagnosticRetenu,
      @JsonKey(name: 'type_personn') TypePersonnalite? typePersonn,
      @JsonKey(name: 'reaction_stress') bool reactionStress,
      @JsonKey(name: 'injonc_suicidaires') bool injoncSuicidaires,
      @JsonKey(name: 'angoisse_psychotique') bool angoissePsychotique,
      bool etatdepressif,
      @JsonKey(name: 'nbres_de_ts') String? nbresDeTs,
      @JsonKey(name: 'anciennetemaladie') String? ancienneteMaladie,
      @JsonKey(name: 'agedebutannee') String? ageDebutAnne,
      @JsonKey(name: 'motifTS') bool motifTs,
      String? remarque,
      @JsonKey(name: 'nom_patient') String? nomPatient,
      @JsonKey(name: 'pren_patient') String? prenPatient,
      @JsonKey(name: 'cin_cnam') int? cinCnam,
      @JsonKey(name: 'date_naiss') String? dateNaiss,
      @JsonKey(name: 'age_int') String? ageInt,
      int? telephone,
      String? sexe,
      String? etatcivil,
      String? origine,
      String? lieuderesidence,
      String? villederesidence,
      String? nvscolaire,
      @JsonKey(name: 'type_prof') String? typeProf,
      @JsonKey(name: 'nv_socioeconomique') String? nvSocioeconomique,
      @JsonKey(name: 'id_sec') String? idSec,
      @JsonKey(name: 'nom_med') String? nomMed,
      @JsonKey(name: 'pren_med') String? prenMed,
      @JsonKey(name: 'prediction_generee') bool predictionGeneree,
      @JsonKey(name: 'prediction_risque') String? predictionRisque,
      @JsonKey(name: 'date_prediction') DateTime? datePrediction,
      @JsonKey(name: 'prediction_results') PredictionResults? predictionResults,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $ConsultationPatientInfoCopyWith<$Res>? get numDossier;
  @override
  $PredictionResultsCopyWith<$Res>? get predictionResults;
}

/// @nodoc
class __$$ConsultationImplCopyWithImpl<$Res>
    extends _$ConsultationCopyWithImpl<$Res, _$ConsultationImpl>
    implements _$$ConsultationImplCopyWith<$Res> {
  __$$ConsultationImplCopyWithImpl(
      _$ConsultationImpl _value, $Res Function(_$ConsultationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? numConsult = null,
    Object? numDossier = freezed,
    Object? idMed = freezed,
    Object? dateHeure = freezed,
    Object? addiction = null,
    Object? tabac = null,
    Object? alcool = null,
    Object? cannabis = null,
    Object? medicaments = null,
    Object? solvantsorg = null,
    Object? atcdsPTs = null,
    Object? ideesSuiAnt = null,
    Object? hospitAnt = null,
    Object? atcdsFamSui = null,
    Object? suicideAccompli = null,
    Object? atcdsPSomatik = null,
    Object? condImpulsiv = null,
    Object? automil = null,
    Object? atcdsPJudic = null,
    Object? immolation = null,
    Object? moyenphlebotomie = null,
    Object? mpendaison = null,
    Object? mmedicaments = null,
    Object? mstrangulation = freezed,
    Object? mingestiontox = null,
    Object? equiSui = null,
    Object? sautaltitude = null,
    Object? mautres = null,
    Object? nombresHospit = freezed,
    Object? familleContenante = null,
    Object? typeAtcdsPsy = freezed,
    Object? diagnosticRetenu = freezed,
    Object? typePersonn = freezed,
    Object? reactionStress = null,
    Object? injoncSuicidaires = null,
    Object? angoissePsychotique = null,
    Object? etatdepressif = null,
    Object? nbresDeTs = freezed,
    Object? ancienneteMaladie = freezed,
    Object? ageDebutAnne = freezed,
    Object? motifTs = null,
    Object? remarque = freezed,
    Object? nomPatient = freezed,
    Object? prenPatient = freezed,
    Object? cinCnam = freezed,
    Object? dateNaiss = freezed,
    Object? ageInt = freezed,
    Object? telephone = freezed,
    Object? sexe = freezed,
    Object? etatcivil = freezed,
    Object? origine = freezed,
    Object? lieuderesidence = freezed,
    Object? villederesidence = freezed,
    Object? nvscolaire = freezed,
    Object? typeProf = freezed,
    Object? nvSocioeconomique = freezed,
    Object? idSec = freezed,
    Object? nomMed = freezed,
    Object? prenMed = freezed,
    Object? predictionGeneree = null,
    Object? predictionRisque = freezed,
    Object? datePrediction = freezed,
    Object? predictionResults = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ConsultationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numConsult: null == numConsult
          ? _value.numConsult
          : numConsult // ignore: cast_nullable_to_non_nullable
              as String,
      numDossier: freezed == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as ConsultationPatientInfo?,
      idMed: freezed == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String?,
      dateHeure: freezed == dateHeure
          ? _value.dateHeure
          : dateHeure // ignore: cast_nullable_to_non_nullable
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
      solvantsorg: null == solvantsorg
          ? _value.solvantsorg
          : solvantsorg // ignore: cast_nullable_to_non_nullable
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
      atcdsFamSui: null == atcdsFamSui
          ? _value.atcdsFamSui
          : atcdsFamSui // ignore: cast_nullable_to_non_nullable
              as bool,
      suicideAccompli: null == suicideAccompli
          ? _value.suicideAccompli
          : suicideAccompli // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPSomatik: null == atcdsPSomatik
          ? _value.atcdsPSomatik
          : atcdsPSomatik // ignore: cast_nullable_to_non_nullable
              as bool,
      condImpulsiv: null == condImpulsiv
          ? _value.condImpulsiv
          : condImpulsiv // ignore: cast_nullable_to_non_nullable
              as bool,
      automil: null == automil
          ? _value.automil
          : automil // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPJudic: null == atcdsPJudic
          ? _value.atcdsPJudic
          : atcdsPJudic // ignore: cast_nullable_to_non_nullable
              as bool,
      immolation: null == immolation
          ? _value.immolation
          : immolation // ignore: cast_nullable_to_non_nullable
              as bool,
      moyenphlebotomie: null == moyenphlebotomie
          ? _value.moyenphlebotomie
          : moyenphlebotomie // ignore: cast_nullable_to_non_nullable
              as bool,
      mpendaison: null == mpendaison
          ? _value.mpendaison
          : mpendaison // ignore: cast_nullable_to_non_nullable
              as bool,
      mmedicaments: null == mmedicaments
          ? _value.mmedicaments
          : mmedicaments // ignore: cast_nullable_to_non_nullable
              as bool,
      mstrangulation: freezed == mstrangulation
          ? _value.mstrangulation
          : mstrangulation // ignore: cast_nullable_to_non_nullable
              as bool?,
      mingestiontox: null == mingestiontox
          ? _value.mingestiontox
          : mingestiontox // ignore: cast_nullable_to_non_nullable
              as bool,
      equiSui: null == equiSui
          ? _value.equiSui
          : equiSui // ignore: cast_nullable_to_non_nullable
              as bool,
      sautaltitude: null == sautaltitude
          ? _value.sautaltitude
          : sautaltitude // ignore: cast_nullable_to_non_nullable
              as bool,
      mautres: null == mautres
          ? _value.mautres
          : mautres // ignore: cast_nullable_to_non_nullable
              as bool,
      nombresHospit: freezed == nombresHospit
          ? _value.nombresHospit
          : nombresHospit // ignore: cast_nullable_to_non_nullable
              as String?,
      familleContenante: null == familleContenante
          ? _value.familleContenante
          : familleContenante // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAtcdsPsy: freezed == typeAtcdsPsy
          ? _value.typeAtcdsPsy
          : typeAtcdsPsy // ignore: cast_nullable_to_non_nullable
              as TypeAtcdsPsy?,
      diagnosticRetenu: freezed == diagnosticRetenu
          ? _value.diagnosticRetenu
          : diagnosticRetenu // ignore: cast_nullable_to_non_nullable
              as DiagnosticRetenu?,
      typePersonn: freezed == typePersonn
          ? _value.typePersonn
          : typePersonn // ignore: cast_nullable_to_non_nullable
              as TypePersonnalite?,
      reactionStress: null == reactionStress
          ? _value.reactionStress
          : reactionStress // ignore: cast_nullable_to_non_nullable
              as bool,
      injoncSuicidaires: null == injoncSuicidaires
          ? _value.injoncSuicidaires
          : injoncSuicidaires // ignore: cast_nullable_to_non_nullable
              as bool,
      angoissePsychotique: null == angoissePsychotique
          ? _value.angoissePsychotique
          : angoissePsychotique // ignore: cast_nullable_to_non_nullable
              as bool,
      etatdepressif: null == etatdepressif
          ? _value.etatdepressif
          : etatdepressif // ignore: cast_nullable_to_non_nullable
              as bool,
      nbresDeTs: freezed == nbresDeTs
          ? _value.nbresDeTs
          : nbresDeTs // ignore: cast_nullable_to_non_nullable
              as String?,
      ancienneteMaladie: freezed == ancienneteMaladie
          ? _value.ancienneteMaladie
          : ancienneteMaladie // ignore: cast_nullable_to_non_nullable
              as String?,
      ageDebutAnne: freezed == ageDebutAnne
          ? _value.ageDebutAnne
          : ageDebutAnne // ignore: cast_nullable_to_non_nullable
              as String?,
      motifTs: null == motifTs
          ? _value.motifTs
          : motifTs // ignore: cast_nullable_to_non_nullable
              as bool,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
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
      dateNaiss: freezed == dateNaiss
          ? _value.dateNaiss
          : dateNaiss // ignore: cast_nullable_to_non_nullable
              as String?,
      ageInt: freezed == ageInt
          ? _value.ageInt
          : ageInt // ignore: cast_nullable_to_non_nullable
              as String?,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as String?,
      etatcivil: freezed == etatcivil
          ? _value.etatcivil
          : etatcivil // ignore: cast_nullable_to_non_nullable
              as String?,
      origine: freezed == origine
          ? _value.origine
          : origine // ignore: cast_nullable_to_non_nullable
              as String?,
      lieuderesidence: freezed == lieuderesidence
          ? _value.lieuderesidence
          : lieuderesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      villederesidence: freezed == villederesidence
          ? _value.villederesidence
          : villederesidence // ignore: cast_nullable_to_non_nullable
              as String?,
      nvscolaire: freezed == nvscolaire
          ? _value.nvscolaire
          : nvscolaire // ignore: cast_nullable_to_non_nullable
              as String?,
      typeProf: freezed == typeProf
          ? _value.typeProf
          : typeProf // ignore: cast_nullable_to_non_nullable
              as String?,
      nvSocioeconomique: freezed == nvSocioeconomique
          ? _value.nvSocioeconomique
          : nvSocioeconomique // ignore: cast_nullable_to_non_nullable
              as String?,
      idSec: freezed == idSec
          ? _value.idSec
          : idSec // ignore: cast_nullable_to_non_nullable
              as String?,
      nomMed: freezed == nomMed
          ? _value.nomMed
          : nomMed // ignore: cast_nullable_to_non_nullable
              as String?,
      prenMed: freezed == prenMed
          ? _value.prenMed
          : prenMed // ignore: cast_nullable_to_non_nullable
              as String?,
      predictionGeneree: null == predictionGeneree
          ? _value.predictionGeneree
          : predictionGeneree // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionRisque: freezed == predictionRisque
          ? _value.predictionRisque
          : predictionRisque // ignore: cast_nullable_to_non_nullable
              as String?,
      datePrediction: freezed == datePrediction
          ? _value.datePrediction
          : datePrediction // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      predictionResults: freezed == predictionResults
          ? _value.predictionResults
          : predictionResults // ignore: cast_nullable_to_non_nullable
              as PredictionResults?,
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

class _$ConsultationImpl implements _Consultation {
  const _$ConsultationImpl(
      {@JsonKey(name: '_id') this.id,
      @JsonKey(name: 'num_consult') required this.numConsult,
      @JsonKey(name: 'num_dossier') this.numDossier,
      @JsonKey(name: 'id_med') this.idMed,
      @JsonKey(name: 'date_heure') this.dateHeure,
      this.addiction = false,
      @JsonKey(name: 'TABAC') this.tabac = false,
      this.alcool = false,
      this.cannabis = false,
      this.medicaments = false,
      this.solvantsorg = false,
      @JsonKey(name: 'AtcdsP_TS') this.atcdsPTs = false,
      @JsonKey(name: 'idees_sui_ant') this.ideesSuiAnt = false,
      @JsonKey(name: 'hospit_ant') this.hospitAnt = false,
      @JsonKey(name: 'atcdsFam_SUI') this.atcdsFamSui = false,
      @JsonKey(name: 'suicide_accompli') this.suicideAccompli = false,
      @JsonKey(name: 'AtcdsP_somatik') this.atcdsPSomatik = false,
      @JsonKey(name: 'cond_impulsiv') this.condImpulsiv = false,
      this.automil = false,
      @JsonKey(name: 'atcds_p_judic') this.atcdsPJudic = false,
      this.immolation = false,
      this.moyenphlebotomie = false,
      @JsonKey(name: 'Mpendaison') this.mpendaison = false,
      @JsonKey(name: 'Mmedicaments') this.mmedicaments = false,
      @JsonKey(name: 'Mstrangulation') this.mstrangulation,
      @JsonKey(name: 'Mingestiontox') this.mingestiontox = false,
      @JsonKey(name: 'EQUIsui') this.equiSui = false,
      this.sautaltitude = false,
      @JsonKey(name: 'Mautres') this.mautres = false,
      @JsonKey(name: 'nombres_hospit') this.nombresHospit,
      @JsonKey(name: 'famille_contenante') this.familleContenante = false,
      @JsonKey(name: 'type_atcdspsy') this.typeAtcdsPsy,
      @JsonKey(name: 'diagnostic_retenu') this.diagnosticRetenu,
      @JsonKey(name: 'type_personn') this.typePersonn,
      @JsonKey(name: 'reaction_stress') this.reactionStress = false,
      @JsonKey(name: 'injonc_suicidaires') this.injoncSuicidaires = false,
      @JsonKey(name: 'angoisse_psychotique') this.angoissePsychotique = false,
      this.etatdepressif = false,
      @JsonKey(name: 'nbres_de_ts') this.nbresDeTs,
      @JsonKey(name: 'anciennetemaladie') this.ancienneteMaladie,
      @JsonKey(name: 'agedebutannee') this.ageDebutAnne,
      @JsonKey(name: 'motifTS') this.motifTs = false,
      this.remarque,
      @JsonKey(name: 'nom_patient') this.nomPatient,
      @JsonKey(name: 'pren_patient') this.prenPatient,
      @JsonKey(name: 'cin_cnam') this.cinCnam,
      @JsonKey(name: 'date_naiss') this.dateNaiss,
      @JsonKey(name: 'age_int') this.ageInt,
      this.telephone,
      this.sexe,
      this.etatcivil,
      this.origine,
      this.lieuderesidence,
      this.villederesidence,
      this.nvscolaire,
      @JsonKey(name: 'type_prof') this.typeProf,
      @JsonKey(name: 'nv_socioeconomique') this.nvSocioeconomique,
      @JsonKey(name: 'id_sec') this.idSec,
      @JsonKey(name: 'nom_med') this.nomMed,
      @JsonKey(name: 'pren_med') this.prenMed,
      @JsonKey(name: 'prediction_generee') this.predictionGeneree = false,
      @JsonKey(name: 'prediction_risque') this.predictionRisque,
      @JsonKey(name: 'date_prediction') this.datePrediction,
      @JsonKey(name: 'prediction_results') this.predictionResults,
      this.createdAt,
      this.updatedAt});

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'num_consult')
  final String numConsult;
  @override
  @JsonKey(name: 'num_dossier')
  final ConsultationPatientInfo? numDossier;
  @override
  @JsonKey(name: 'id_med')
  final String? idMed;
  @override
  @JsonKey(name: 'date_heure')
  final String? dateHeure;
// Addiction and substance abuse
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
  @JsonKey()
  final bool solvantsorg;
// Psychiatric history
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
  @JsonKey(name: 'atcdsFam_SUI')
  final bool atcdsFamSui;
  @override
  @JsonKey(name: 'suicide_accompli')
  final bool suicideAccompli;
  @override
  @JsonKey(name: 'AtcdsP_somatik')
  final bool atcdsPSomatik;
  @override
  @JsonKey(name: 'cond_impulsiv')
  final bool condImpulsiv;
  @override
  @JsonKey()
  final bool automil;
  @override
  @JsonKey(name: 'atcds_p_judic')
  final bool atcdsPJudic;
// Suicide methods
  @override
  @JsonKey()
  final bool immolation;
  @override
  @JsonKey()
  final bool moyenphlebotomie;
  @override
  @JsonKey(name: 'Mpendaison')
  final bool mpendaison;
  @override
  @JsonKey(name: 'Mmedicaments')
  final bool mmedicaments;
  @override
  @JsonKey(name: 'Mstrangulation')
  final bool? mstrangulation;
  @override
  @JsonKey(name: 'Mingestiontox')
  final bool mingestiontox;
  @override
  @JsonKey(name: 'EQUIsui')
  final bool equiSui;
  @override
  @JsonKey()
  final bool sautaltitude;
  @override
  @JsonKey(name: 'Mautres')
  final bool mautres;
// Clinical assessment
  @override
  @JsonKey(name: 'nombres_hospit')
  final String? nombresHospit;
  @override
  @JsonKey(name: 'famille_contenante')
  final bool familleContenante;
  @override
  @JsonKey(name: 'type_atcdspsy')
  final TypeAtcdsPsy? typeAtcdsPsy;
  @override
  @JsonKey(name: 'diagnostic_retenu')
  final DiagnosticRetenu? diagnosticRetenu;
  @override
  @JsonKey(name: 'type_personn')
  final TypePersonnalite? typePersonn;
  @override
  @JsonKey(name: 'reaction_stress')
  final bool reactionStress;
  @override
  @JsonKey(name: 'injonc_suicidaires')
  final bool injoncSuicidaires;
  @override
  @JsonKey(name: 'angoisse_psychotique')
  final bool angoissePsychotique;
  @override
  @JsonKey()
  final bool etatdepressif;
// Statistics
  @override
  @JsonKey(name: 'nbres_de_ts')
  final String? nbresDeTs;
  @override
  @JsonKey(name: 'anciennetemaladie')
  final String? ancienneteMaladie;
  @override
  @JsonKey(name: 'agedebutannee')
  final String? ageDebutAnne;
  @override
  @JsonKey(name: 'motifTS')
  final bool motifTs;
  @override
  final String? remarque;
// Patient details (duplicated in consultation)
  @override
  @JsonKey(name: 'nom_patient')
  final String? nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  final String? prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  final int? cinCnam;
  @override
  @JsonKey(name: 'date_naiss')
  final String? dateNaiss;
  @override
  @JsonKey(name: 'age_int')
  final String? ageInt;
  @override
  final int? telephone;
  @override
  final String? sexe;
  @override
  final String? etatcivil;
  @override
  final String? origine;
  @override
  final String? lieuderesidence;
  @override
  final String? villederesidence;
  @override
  final String? nvscolaire;
  @override
  @JsonKey(name: 'type_prof')
  final String? typeProf;
  @override
  @JsonKey(name: 'nv_socioeconomique')
  final String? nvSocioeconomique;
// Medical staff info
  @override
  @JsonKey(name: 'id_sec')
  final String? idSec;
  @override
  @JsonKey(name: 'nom_med')
  final String? nomMed;
  @override
  @JsonKey(name: 'pren_med')
  final String? prenMed;
// Prediction
  @override
  @JsonKey(name: 'prediction_generee')
  final bool predictionGeneree;
  @override
  @JsonKey(name: 'prediction_risque')
  final String? predictionRisque;
  @override
  @JsonKey(name: 'date_prediction')
  final DateTime? datePrediction;
  @override
  @JsonKey(name: 'prediction_results')
  final PredictionResults? predictionResults;
// Timestamps
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Consultation(id: $id, numConsult: $numConsult, numDossier: $numDossier, idMed: $idMed, dateHeure: $dateHeure, addiction: $addiction, tabac: $tabac, alcool: $alcool, cannabis: $cannabis, medicaments: $medicaments, solvantsorg: $solvantsorg, atcdsPTs: $atcdsPTs, ideesSuiAnt: $ideesSuiAnt, hospitAnt: $hospitAnt, atcdsFamSui: $atcdsFamSui, suicideAccompli: $suicideAccompli, atcdsPSomatik: $atcdsPSomatik, condImpulsiv: $condImpulsiv, automil: $automil, atcdsPJudic: $atcdsPJudic, immolation: $immolation, moyenphlebotomie: $moyenphlebotomie, mpendaison: $mpendaison, mmedicaments: $mmedicaments, mstrangulation: $mstrangulation, mingestiontox: $mingestiontox, equiSui: $equiSui, sautaltitude: $sautaltitude, mautres: $mautres, nombresHospit: $nombresHospit, familleContenante: $familleContenante, typeAtcdsPsy: $typeAtcdsPsy, diagnosticRetenu: $diagnosticRetenu, typePersonn: $typePersonn, reactionStress: $reactionStress, injoncSuicidaires: $injoncSuicidaires, angoissePsychotique: $angoissePsychotique, etatdepressif: $etatdepressif, nbresDeTs: $nbresDeTs, ancienneteMaladie: $ancienneteMaladie, ageDebutAnne: $ageDebutAnne, motifTs: $motifTs, remarque: $remarque, nomPatient: $nomPatient, prenPatient: $prenPatient, cinCnam: $cinCnam, dateNaiss: $dateNaiss, ageInt: $ageInt, telephone: $telephone, sexe: $sexe, etatcivil: $etatcivil, origine: $origine, lieuderesidence: $lieuderesidence, villederesidence: $villederesidence, nvscolaire: $nvscolaire, typeProf: $typeProf, nvSocioeconomique: $nvSocioeconomique, idSec: $idSec, nomMed: $nomMed, prenMed: $prenMed, predictionGeneree: $predictionGeneree, predictionRisque: $predictionRisque, datePrediction: $datePrediction, predictionResults: $predictionResults, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numConsult, numConsult) ||
                other.numConsult == numConsult) &&
            (identical(other.numDossier, numDossier) ||
                other.numDossier == numDossier) &&
            (identical(other.idMed, idMed) || other.idMed == idMed) &&
            (identical(other.dateHeure, dateHeure) ||
                other.dateHeure == dateHeure) &&
            (identical(other.addiction, addiction) ||
                other.addiction == addiction) &&
            (identical(other.tabac, tabac) || other.tabac == tabac) &&
            (identical(other.alcool, alcool) || other.alcool == alcool) &&
            (identical(other.cannabis, cannabis) ||
                other.cannabis == cannabis) &&
            (identical(other.medicaments, medicaments) ||
                other.medicaments == medicaments) &&
            (identical(other.solvantsorg, solvantsorg) ||
                other.solvantsorg == solvantsorg) &&
            (identical(other.atcdsPTs, atcdsPTs) ||
                other.atcdsPTs == atcdsPTs) &&
            (identical(other.ideesSuiAnt, ideesSuiAnt) ||
                other.ideesSuiAnt == ideesSuiAnt) &&
            (identical(other.hospitAnt, hospitAnt) ||
                other.hospitAnt == hospitAnt) &&
            (identical(other.atcdsFamSui, atcdsFamSui) ||
                other.atcdsFamSui == atcdsFamSui) &&
            (identical(other.suicideAccompli, suicideAccompli) ||
                other.suicideAccompli == suicideAccompli) &&
            (identical(other.atcdsPSomatik, atcdsPSomatik) ||
                other.atcdsPSomatik == atcdsPSomatik) &&
            (identical(other.condImpulsiv, condImpulsiv) ||
                other.condImpulsiv == condImpulsiv) &&
            (identical(other.automil, automil) || other.automil == automil) &&
            (identical(other.atcdsPJudic, atcdsPJudic) ||
                other.atcdsPJudic == atcdsPJudic) &&
            (identical(other.immolation, immolation) ||
                other.immolation == immolation) &&
            (identical(other.moyenphlebotomie, moyenphlebotomie) ||
                other.moyenphlebotomie == moyenphlebotomie) &&
            (identical(other.mpendaison, mpendaison) ||
                other.mpendaison == mpendaison) &&
            (identical(other.mmedicaments, mmedicaments) ||
                other.mmedicaments == mmedicaments) &&
            (identical(other.mstrangulation, mstrangulation) ||
                other.mstrangulation == mstrangulation) &&
            (identical(other.mingestiontox, mingestiontox) ||
                other.mingestiontox == mingestiontox) &&
            (identical(other.equiSui, equiSui) || other.equiSui == equiSui) &&
            (identical(other.sautaltitude, sautaltitude) ||
                other.sautaltitude == sautaltitude) &&
            (identical(other.mautres, mautres) || other.mautres == mautres) &&
            (identical(other.nombresHospit, nombresHospit) ||
                other.nombresHospit == nombresHospit) &&
            (identical(other.familleContenante, familleContenante) ||
                other.familleContenante == familleContenante) &&
            (identical(other.typeAtcdsPsy, typeAtcdsPsy) ||
                other.typeAtcdsPsy == typeAtcdsPsy) &&
            (identical(other.diagnosticRetenu, diagnosticRetenu) ||
                other.diagnosticRetenu == diagnosticRetenu) &&
            (identical(other.typePersonn, typePersonn) ||
                other.typePersonn == typePersonn) &&
            (identical(other.reactionStress, reactionStress) ||
                other.reactionStress == reactionStress) &&
            (identical(other.injoncSuicidaires, injoncSuicidaires) ||
                other.injoncSuicidaires == injoncSuicidaires) &&
            (identical(other.angoissePsychotique, angoissePsychotique) ||
                other.angoissePsychotique == angoissePsychotique) &&
            (identical(other.etatdepressif, etatdepressif) ||
                other.etatdepressif == etatdepressif) &&
            (identical(other.nbresDeTs, nbresDeTs) ||
                other.nbresDeTs == nbresDeTs) &&
            (identical(other.ancienneteMaladie, ancienneteMaladie) ||
                other.ancienneteMaladie == ancienneteMaladie) &&
            (identical(other.ageDebutAnne, ageDebutAnne) ||
                other.ageDebutAnne == ageDebutAnne) &&
            (identical(other.motifTs, motifTs) || other.motifTs == motifTs) &&
            (identical(other.remarque, remarque) ||
                other.remarque == remarque) &&
            (identical(other.nomPatient, nomPatient) ||
                other.nomPatient == nomPatient) &&
            (identical(other.prenPatient, prenPatient) ||
                other.prenPatient == prenPatient) &&
            (identical(other.cinCnam, cinCnam) || other.cinCnam == cinCnam) &&
            (identical(other.dateNaiss, dateNaiss) ||
                other.dateNaiss == dateNaiss) &&
            (identical(other.ageInt, ageInt) || other.ageInt == ageInt) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.etatcivil, etatcivil) ||
                other.etatcivil == etatcivil) &&
            (identical(other.origine, origine) || other.origine == origine) &&
            (identical(other.lieuderesidence, lieuderesidence) ||
                other.lieuderesidence == lieuderesidence) &&
            (identical(other.villederesidence, villederesidence) ||
                other.villederesidence == villederesidence) &&
            (identical(other.nvscolaire, nvscolaire) ||
                other.nvscolaire == nvscolaire) &&
            (identical(other.typeProf, typeProf) || other.typeProf == typeProf) &&
            (identical(other.nvSocioeconomique, nvSocioeconomique) || other.nvSocioeconomique == nvSocioeconomique) &&
            (identical(other.idSec, idSec) || other.idSec == idSec) &&
            (identical(other.nomMed, nomMed) || other.nomMed == nomMed) &&
            (identical(other.prenMed, prenMed) || other.prenMed == prenMed) &&
            (identical(other.predictionGeneree, predictionGeneree) || other.predictionGeneree == predictionGeneree) &&
            (identical(other.predictionRisque, predictionRisque) || other.predictionRisque == predictionRisque) &&
            (identical(other.datePrediction, datePrediction) || other.datePrediction == datePrediction) &&
            (identical(other.predictionResults, predictionResults) || other.predictionResults == predictionResults) &&
            (identical(other.createdAt, createdAt) || other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        numConsult,
        numDossier,
        idMed,
        dateHeure,
        addiction,
        tabac,
        alcool,
        cannabis,
        medicaments,
        solvantsorg,
        atcdsPTs,
        ideesSuiAnt,
        hospitAnt,
        atcdsFamSui,
        suicideAccompli,
        atcdsPSomatik,
        condImpulsiv,
        automil,
        atcdsPJudic,
        immolation,
        moyenphlebotomie,
        mpendaison,
        mmedicaments,
        mstrangulation,
        mingestiontox,
        equiSui,
        sautaltitude,
        mautres,
        nombresHospit,
        familleContenante,
        typeAtcdsPsy,
        diagnosticRetenu,
        typePersonn,
        reactionStress,
        injoncSuicidaires,
        angoissePsychotique,
        etatdepressif,
        nbresDeTs,
        ancienneteMaladie,
        ageDebutAnne,
        motifTs,
        remarque,
        nomPatient,
        prenPatient,
        cinCnam,
        dateNaiss,
        ageInt,
        telephone,
        sexe,
        etatcivil,
        origine,
        lieuderesidence,
        villederesidence,
        nvscolaire,
        typeProf,
        nvSocioeconomique,
        idSec,
        nomMed,
        prenMed,
        predictionGeneree,
        predictionRisque,
        datePrediction,
        predictionResults,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      __$$ConsultationImplCopyWithImpl<_$ConsultationImpl>(this, _$identity);
}

abstract class _Consultation implements Consultation {
  const factory _Consultation(
      {@JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'num_consult') required final String numConsult,
      @JsonKey(name: 'num_dossier') final ConsultationPatientInfo? numDossier,
      @JsonKey(name: 'id_med') final String? idMed,
      @JsonKey(name: 'date_heure') final String? dateHeure,
      final bool addiction,
      @JsonKey(name: 'TABAC') final bool tabac,
      final bool alcool,
      final bool cannabis,
      final bool medicaments,
      final bool solvantsorg,
      @JsonKey(name: 'AtcdsP_TS') final bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') final bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') final bool hospitAnt,
      @JsonKey(name: 'atcdsFam_SUI') final bool atcdsFamSui,
      @JsonKey(name: 'suicide_accompli') final bool suicideAccompli,
      @JsonKey(name: 'AtcdsP_somatik') final bool atcdsPSomatik,
      @JsonKey(name: 'cond_impulsiv') final bool condImpulsiv,
      final bool automil,
      @JsonKey(name: 'atcds_p_judic') final bool atcdsPJudic,
      final bool immolation,
      final bool moyenphlebotomie,
      @JsonKey(name: 'Mpendaison') final bool mpendaison,
      @JsonKey(name: 'Mmedicaments') final bool mmedicaments,
      @JsonKey(name: 'Mstrangulation') final bool? mstrangulation,
      @JsonKey(name: 'Mingestiontox') final bool mingestiontox,
      @JsonKey(name: 'EQUIsui') final bool equiSui,
      final bool sautaltitude,
      @JsonKey(name: 'Mautres') final bool mautres,
      @JsonKey(name: 'nombres_hospit') final String? nombresHospit,
      @JsonKey(name: 'famille_contenante') final bool familleContenante,
      @JsonKey(name: 'type_atcdspsy') final TypeAtcdsPsy? typeAtcdsPsy,
      @JsonKey(name: 'diagnostic_retenu')
      final DiagnosticRetenu? diagnosticRetenu,
      @JsonKey(name: 'type_personn') final TypePersonnalite? typePersonn,
      @JsonKey(name: 'reaction_stress') final bool reactionStress,
      @JsonKey(name: 'injonc_suicidaires') final bool injoncSuicidaires,
      @JsonKey(name: 'angoisse_psychotique') final bool angoissePsychotique,
      final bool etatdepressif,
      @JsonKey(name: 'nbres_de_ts') final String? nbresDeTs,
      @JsonKey(name: 'anciennetemaladie') final String? ancienneteMaladie,
      @JsonKey(name: 'agedebutannee') final String? ageDebutAnne,
      @JsonKey(name: 'motifTS') final bool motifTs,
      final String? remarque,
      @JsonKey(name: 'nom_patient') final String? nomPatient,
      @JsonKey(name: 'pren_patient') final String? prenPatient,
      @JsonKey(name: 'cin_cnam') final int? cinCnam,
      @JsonKey(name: 'date_naiss') final String? dateNaiss,
      @JsonKey(name: 'age_int') final String? ageInt,
      final int? telephone,
      final String? sexe,
      final String? etatcivil,
      final String? origine,
      final String? lieuderesidence,
      final String? villederesidence,
      final String? nvscolaire,
      @JsonKey(name: 'type_prof') final String? typeProf,
      @JsonKey(name: 'nv_socioeconomique') final String? nvSocioeconomique,
      @JsonKey(name: 'id_sec') final String? idSec,
      @JsonKey(name: 'nom_med') final String? nomMed,
      @JsonKey(name: 'pren_med') final String? prenMed,
      @JsonKey(name: 'prediction_generee') final bool predictionGeneree,
      @JsonKey(name: 'prediction_risque') final String? predictionRisque,
      @JsonKey(name: 'date_prediction') final DateTime? datePrediction,
      @JsonKey(name: 'prediction_results')
      final PredictionResults? predictionResults,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ConsultationImpl;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'num_consult')
  String get numConsult;
  @override
  @JsonKey(name: 'num_dossier')
  ConsultationPatientInfo? get numDossier;
  @override
  @JsonKey(name: 'id_med')
  String? get idMed;
  @override
  @JsonKey(name: 'date_heure')
  String? get dateHeure; // Addiction and substance abuse
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
  bool get solvantsorg; // Psychiatric history
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
  @JsonKey(name: 'atcdsFam_SUI')
  bool get atcdsFamSui;
  @override
  @JsonKey(name: 'suicide_accompli')
  bool get suicideAccompli;
  @override
  @JsonKey(name: 'AtcdsP_somatik')
  bool get atcdsPSomatik;
  @override
  @JsonKey(name: 'cond_impulsiv')
  bool get condImpulsiv;
  @override
  bool get automil;
  @override
  @JsonKey(name: 'atcds_p_judic')
  bool get atcdsPJudic; // Suicide methods
  @override
  bool get immolation;
  @override
  bool get moyenphlebotomie;
  @override
  @JsonKey(name: 'Mpendaison')
  bool get mpendaison;
  @override
  @JsonKey(name: 'Mmedicaments')
  bool get mmedicaments;
  @override
  @JsonKey(name: 'Mstrangulation')
  bool? get mstrangulation;
  @override
  @JsonKey(name: 'Mingestiontox')
  bool get mingestiontox;
  @override
  @JsonKey(name: 'EQUIsui')
  bool get equiSui;
  @override
  bool get sautaltitude;
  @override
  @JsonKey(name: 'Mautres')
  bool get mautres; // Clinical assessment
  @override
  @JsonKey(name: 'nombres_hospit')
  String? get nombresHospit;
  @override
  @JsonKey(name: 'famille_contenante')
  bool get familleContenante;
  @override
  @JsonKey(name: 'type_atcdspsy')
  TypeAtcdsPsy? get typeAtcdsPsy;
  @override
  @JsonKey(name: 'diagnostic_retenu')
  DiagnosticRetenu? get diagnosticRetenu;
  @override
  @JsonKey(name: 'type_personn')
  TypePersonnalite? get typePersonn;
  @override
  @JsonKey(name: 'reaction_stress')
  bool get reactionStress;
  @override
  @JsonKey(name: 'injonc_suicidaires')
  bool get injoncSuicidaires;
  @override
  @JsonKey(name: 'angoisse_psychotique')
  bool get angoissePsychotique;
  @override
  bool get etatdepressif; // Statistics
  @override
  @JsonKey(name: 'nbres_de_ts')
  String? get nbresDeTs;
  @override
  @JsonKey(name: 'anciennetemaladie')
  String? get ancienneteMaladie;
  @override
  @JsonKey(name: 'agedebutannee')
  String? get ageDebutAnne;
  @override
  @JsonKey(name: 'motifTS')
  bool get motifTs;
  @override
  String? get remarque; // Patient details (duplicated in consultation)
  @override
  @JsonKey(name: 'nom_patient')
  String? get nomPatient;
  @override
  @JsonKey(name: 'pren_patient')
  String? get prenPatient;
  @override
  @JsonKey(name: 'cin_cnam')
  int? get cinCnam;
  @override
  @JsonKey(name: 'date_naiss')
  String? get dateNaiss;
  @override
  @JsonKey(name: 'age_int')
  String? get ageInt;
  @override
  int? get telephone;
  @override
  String? get sexe;
  @override
  String? get etatcivil;
  @override
  String? get origine;
  @override
  String? get lieuderesidence;
  @override
  String? get villederesidence;
  @override
  String? get nvscolaire;
  @override
  @JsonKey(name: 'type_prof')
  String? get typeProf;
  @override
  @JsonKey(name: 'nv_socioeconomique')
  String? get nvSocioeconomique; // Medical staff info
  @override
  @JsonKey(name: 'id_sec')
  String? get idSec;
  @override
  @JsonKey(name: 'nom_med')
  String? get nomMed;
  @override
  @JsonKey(name: 'pren_med')
  String? get prenMed; // Prediction
  @override
  @JsonKey(name: 'prediction_generee')
  bool get predictionGeneree;
  @override
  @JsonKey(name: 'prediction_risque')
  String? get predictionRisque;
  @override
  @JsonKey(name: 'date_prediction')
  DateTime? get datePrediction;
  @override
  @JsonKey(name: 'prediction_results')
  PredictionResults? get predictionResults; // Timestamps
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Consultation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationImplCopyWith<_$ConsultationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateConsultationDto _$CreateConsultationDtoFromJson(
    Map<String, dynamic> json) {
  return _CreateConsultationDto.fromJson(json);
}

/// @nodoc
mixin _$CreateConsultationDto {
  @JsonKey(name: 'num_dossier')
  String get numDossier => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_med')
  String? get idMed => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool get addiction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TABAC')
  bool get tabac => throw _privateConstructorUsedError;
  bool get alcool => throw _privateConstructorUsedError;
  bool get cannabis => throw _privateConstructorUsedError;
  bool get medicaments => throw _privateConstructorUsedError;
  bool get solvantsorg => throw _privateConstructorUsedError;
  @JsonKey(name: 'AtcdsP_TS')
  bool get atcdsPTs => throw _privateConstructorUsedError;
  @JsonKey(name: 'idees_sui_ant')
  bool get ideesSuiAnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'hospit_ant')
  bool get hospitAnt => throw _privateConstructorUsedError;
  @JsonKey(name: 'atcdsFam_SUI')
  bool get atcdsFamSui => throw _privateConstructorUsedError;
  @JsonKey(name: 'suicide_accompli')
  bool get suicideAccompli => throw _privateConstructorUsedError;
  @JsonKey(name: 'AtcdsP_somatik')
  bool get atcdsPSomatik => throw _privateConstructorUsedError;
  @JsonKey(name: 'cond_impulsiv')
  bool get condImpulsiv => throw _privateConstructorUsedError;
  bool get automit => throw _privateConstructorUsedError;
  @JsonKey(name: 'atcds_p_judic')
  bool get atcdsPJudic => throw _privateConstructorUsedError;
  bool get immolation => throw _privateConstructorUsedError;
  bool get moyenphlebotomie => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mpendaison')
  bool get mpendaison => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mmedicaments')
  bool get mmedicaments => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mstrangulation')
  bool get mstrangulation => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mingestiontox')
  bool get mingestiontox => throw _privateConstructorUsedError;
  @JsonKey(name: 'EQUIsui')
  bool get equiSui => throw _privateConstructorUsedError;
  bool get sautaltitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Mautres')
  bool get mautres => throw _privateConstructorUsedError;
  @JsonKey(name: 'nombres_hospit')
  String get nombresHospit => throw _privateConstructorUsedError;
  @JsonKey(name: 'famille_contenante')
  bool get familleContenante => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_atcdspsy')
  String get typeAtcdspsy => throw _privateConstructorUsedError;
  @JsonKey(name: 'diagnostic_retenu')
  String get diagnosticRetenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_personn')
  String get typePersonn => throw _privateConstructorUsedError;
  @JsonKey(name: 'reaction_stress')
  bool get reactionStress => throw _privateConstructorUsedError;
  @JsonKey(name: 'injonc_suicidaires')
  bool get injoncSuicidaires => throw _privateConstructorUsedError;
  @JsonKey(name: 'angoisse_psychotique')
  bool get angoissePsychotique => throw _privateConstructorUsedError;
  bool get etatdepressif => throw _privateConstructorUsedError;
  @JsonKey(name: 'nbres_de_ts')
  String get nbresDeTs => throw _privateConstructorUsedError;
  String get anciennetemaladie => throw _privateConstructorUsedError;
  String get agedebutannee => throw _privateConstructorUsedError;
  @JsonKey(name: 'motifTS')
  bool get motifTs => throw _privateConstructorUsedError;
  String? get remarque => throw _privateConstructorUsedError;

  /// Serializes this CreateConsultationDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateConsultationDtoCopyWith<CreateConsultationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateConsultationDtoCopyWith<$Res> {
  factory $CreateConsultationDtoCopyWith(CreateConsultationDto value,
          $Res Function(CreateConsultationDto) then) =
      _$CreateConsultationDtoCopyWithImpl<$Res, CreateConsultationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'num_dossier') String numDossier,
      @JsonKey(name: 'id_med') String? idMed,
      String? date,
      bool addiction,
      @JsonKey(name: 'TABAC') bool tabac,
      bool alcool,
      bool cannabis,
      bool medicaments,
      bool solvantsorg,
      @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') bool hospitAnt,
      @JsonKey(name: 'atcdsFam_SUI') bool atcdsFamSui,
      @JsonKey(name: 'suicide_accompli') bool suicideAccompli,
      @JsonKey(name: 'AtcdsP_somatik') bool atcdsPSomatik,
      @JsonKey(name: 'cond_impulsiv') bool condImpulsiv,
      bool automit,
      @JsonKey(name: 'atcds_p_judic') bool atcdsPJudic,
      bool immolation,
      bool moyenphlebotomie,
      @JsonKey(name: 'Mpendaison') bool mpendaison,
      @JsonKey(name: 'Mmedicaments') bool mmedicaments,
      @JsonKey(name: 'Mstrangulation') bool mstrangulation,
      @JsonKey(name: 'Mingestiontox') bool mingestiontox,
      @JsonKey(name: 'EQUIsui') bool equiSui,
      bool sautaltitude,
      @JsonKey(name: 'Mautres') bool mautres,
      @JsonKey(name: 'nombres_hospit') String nombresHospit,
      @JsonKey(name: 'famille_contenante') bool familleContenante,
      @JsonKey(name: 'type_atcdspsy') String typeAtcdspsy,
      @JsonKey(name: 'diagnostic_retenu') String diagnosticRetenu,
      @JsonKey(name: 'type_personn') String typePersonn,
      @JsonKey(name: 'reaction_stress') bool reactionStress,
      @JsonKey(name: 'injonc_suicidaires') bool injoncSuicidaires,
      @JsonKey(name: 'angoisse_psychotique') bool angoissePsychotique,
      bool etatdepressif,
      @JsonKey(name: 'nbres_de_ts') String nbresDeTs,
      String anciennetemaladie,
      String agedebutannee,
      @JsonKey(name: 'motifTS') bool motifTs,
      String? remarque});
}

/// @nodoc
class _$CreateConsultationDtoCopyWithImpl<$Res,
        $Val extends CreateConsultationDto>
    implements $CreateConsultationDtoCopyWith<$Res> {
  _$CreateConsultationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numDossier = null,
    Object? idMed = freezed,
    Object? date = freezed,
    Object? addiction = null,
    Object? tabac = null,
    Object? alcool = null,
    Object? cannabis = null,
    Object? medicaments = null,
    Object? solvantsorg = null,
    Object? atcdsPTs = null,
    Object? ideesSuiAnt = null,
    Object? hospitAnt = null,
    Object? atcdsFamSui = null,
    Object? suicideAccompli = null,
    Object? atcdsPSomatik = null,
    Object? condImpulsiv = null,
    Object? automit = null,
    Object? atcdsPJudic = null,
    Object? immolation = null,
    Object? moyenphlebotomie = null,
    Object? mpendaison = null,
    Object? mmedicaments = null,
    Object? mstrangulation = null,
    Object? mingestiontox = null,
    Object? equiSui = null,
    Object? sautaltitude = null,
    Object? mautres = null,
    Object? nombresHospit = null,
    Object? familleContenante = null,
    Object? typeAtcdspsy = null,
    Object? diagnosticRetenu = null,
    Object? typePersonn = null,
    Object? reactionStress = null,
    Object? injoncSuicidaires = null,
    Object? angoissePsychotique = null,
    Object? etatdepressif = null,
    Object? nbresDeTs = null,
    Object? anciennetemaladie = null,
    Object? agedebutannee = null,
    Object? motifTs = null,
    Object? remarque = freezed,
  }) {
    return _then(_value.copyWith(
      numDossier: null == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String,
      idMed: freezed == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      solvantsorg: null == solvantsorg
          ? _value.solvantsorg
          : solvantsorg // ignore: cast_nullable_to_non_nullable
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
      atcdsFamSui: null == atcdsFamSui
          ? _value.atcdsFamSui
          : atcdsFamSui // ignore: cast_nullable_to_non_nullable
              as bool,
      suicideAccompli: null == suicideAccompli
          ? _value.suicideAccompli
          : suicideAccompli // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPSomatik: null == atcdsPSomatik
          ? _value.atcdsPSomatik
          : atcdsPSomatik // ignore: cast_nullable_to_non_nullable
              as bool,
      condImpulsiv: null == condImpulsiv
          ? _value.condImpulsiv
          : condImpulsiv // ignore: cast_nullable_to_non_nullable
              as bool,
      automit: null == automit
          ? _value.automit
          : automit // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPJudic: null == atcdsPJudic
          ? _value.atcdsPJudic
          : atcdsPJudic // ignore: cast_nullable_to_non_nullable
              as bool,
      immolation: null == immolation
          ? _value.immolation
          : immolation // ignore: cast_nullable_to_non_nullable
              as bool,
      moyenphlebotomie: null == moyenphlebotomie
          ? _value.moyenphlebotomie
          : moyenphlebotomie // ignore: cast_nullable_to_non_nullable
              as bool,
      mpendaison: null == mpendaison
          ? _value.mpendaison
          : mpendaison // ignore: cast_nullable_to_non_nullable
              as bool,
      mmedicaments: null == mmedicaments
          ? _value.mmedicaments
          : mmedicaments // ignore: cast_nullable_to_non_nullable
              as bool,
      mstrangulation: null == mstrangulation
          ? _value.mstrangulation
          : mstrangulation // ignore: cast_nullable_to_non_nullable
              as bool,
      mingestiontox: null == mingestiontox
          ? _value.mingestiontox
          : mingestiontox // ignore: cast_nullable_to_non_nullable
              as bool,
      equiSui: null == equiSui
          ? _value.equiSui
          : equiSui // ignore: cast_nullable_to_non_nullable
              as bool,
      sautaltitude: null == sautaltitude
          ? _value.sautaltitude
          : sautaltitude // ignore: cast_nullable_to_non_nullable
              as bool,
      mautres: null == mautres
          ? _value.mautres
          : mautres // ignore: cast_nullable_to_non_nullable
              as bool,
      nombresHospit: null == nombresHospit
          ? _value.nombresHospit
          : nombresHospit // ignore: cast_nullable_to_non_nullable
              as String,
      familleContenante: null == familleContenante
          ? _value.familleContenante
          : familleContenante // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAtcdspsy: null == typeAtcdspsy
          ? _value.typeAtcdspsy
          : typeAtcdspsy // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticRetenu: null == diagnosticRetenu
          ? _value.diagnosticRetenu
          : diagnosticRetenu // ignore: cast_nullable_to_non_nullable
              as String,
      typePersonn: null == typePersonn
          ? _value.typePersonn
          : typePersonn // ignore: cast_nullable_to_non_nullable
              as String,
      reactionStress: null == reactionStress
          ? _value.reactionStress
          : reactionStress // ignore: cast_nullable_to_non_nullable
              as bool,
      injoncSuicidaires: null == injoncSuicidaires
          ? _value.injoncSuicidaires
          : injoncSuicidaires // ignore: cast_nullable_to_non_nullable
              as bool,
      angoissePsychotique: null == angoissePsychotique
          ? _value.angoissePsychotique
          : angoissePsychotique // ignore: cast_nullable_to_non_nullable
              as bool,
      etatdepressif: null == etatdepressif
          ? _value.etatdepressif
          : etatdepressif // ignore: cast_nullable_to_non_nullable
              as bool,
      nbresDeTs: null == nbresDeTs
          ? _value.nbresDeTs
          : nbresDeTs // ignore: cast_nullable_to_non_nullable
              as String,
      anciennetemaladie: null == anciennetemaladie
          ? _value.anciennetemaladie
          : anciennetemaladie // ignore: cast_nullable_to_non_nullable
              as String,
      agedebutannee: null == agedebutannee
          ? _value.agedebutannee
          : agedebutannee // ignore: cast_nullable_to_non_nullable
              as String,
      motifTs: null == motifTs
          ? _value.motifTs
          : motifTs // ignore: cast_nullable_to_non_nullable
              as bool,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateConsultationDtoImplCopyWith<$Res>
    implements $CreateConsultationDtoCopyWith<$Res> {
  factory _$$CreateConsultationDtoImplCopyWith(
          _$CreateConsultationDtoImpl value,
          $Res Function(_$CreateConsultationDtoImpl) then) =
      __$$CreateConsultationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'num_dossier') String numDossier,
      @JsonKey(name: 'id_med') String? idMed,
      String? date,
      bool addiction,
      @JsonKey(name: 'TABAC') bool tabac,
      bool alcool,
      bool cannabis,
      bool medicaments,
      bool solvantsorg,
      @JsonKey(name: 'AtcdsP_TS') bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') bool hospitAnt,
      @JsonKey(name: 'atcdsFam_SUI') bool atcdsFamSui,
      @JsonKey(name: 'suicide_accompli') bool suicideAccompli,
      @JsonKey(name: 'AtcdsP_somatik') bool atcdsPSomatik,
      @JsonKey(name: 'cond_impulsiv') bool condImpulsiv,
      bool automit,
      @JsonKey(name: 'atcds_p_judic') bool atcdsPJudic,
      bool immolation,
      bool moyenphlebotomie,
      @JsonKey(name: 'Mpendaison') bool mpendaison,
      @JsonKey(name: 'Mmedicaments') bool mmedicaments,
      @JsonKey(name: 'Mstrangulation') bool mstrangulation,
      @JsonKey(name: 'Mingestiontox') bool mingestiontox,
      @JsonKey(name: 'EQUIsui') bool equiSui,
      bool sautaltitude,
      @JsonKey(name: 'Mautres') bool mautres,
      @JsonKey(name: 'nombres_hospit') String nombresHospit,
      @JsonKey(name: 'famille_contenante') bool familleContenante,
      @JsonKey(name: 'type_atcdspsy') String typeAtcdspsy,
      @JsonKey(name: 'diagnostic_retenu') String diagnosticRetenu,
      @JsonKey(name: 'type_personn') String typePersonn,
      @JsonKey(name: 'reaction_stress') bool reactionStress,
      @JsonKey(name: 'injonc_suicidaires') bool injoncSuicidaires,
      @JsonKey(name: 'angoisse_psychotique') bool angoissePsychotique,
      bool etatdepressif,
      @JsonKey(name: 'nbres_de_ts') String nbresDeTs,
      String anciennetemaladie,
      String agedebutannee,
      @JsonKey(name: 'motifTS') bool motifTs,
      String? remarque});
}

/// @nodoc
class __$$CreateConsultationDtoImplCopyWithImpl<$Res>
    extends _$CreateConsultationDtoCopyWithImpl<$Res,
        _$CreateConsultationDtoImpl>
    implements _$$CreateConsultationDtoImplCopyWith<$Res> {
  __$$CreateConsultationDtoImplCopyWithImpl(_$CreateConsultationDtoImpl _value,
      $Res Function(_$CreateConsultationDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numDossier = null,
    Object? idMed = freezed,
    Object? date = freezed,
    Object? addiction = null,
    Object? tabac = null,
    Object? alcool = null,
    Object? cannabis = null,
    Object? medicaments = null,
    Object? solvantsorg = null,
    Object? atcdsPTs = null,
    Object? ideesSuiAnt = null,
    Object? hospitAnt = null,
    Object? atcdsFamSui = null,
    Object? suicideAccompli = null,
    Object? atcdsPSomatik = null,
    Object? condImpulsiv = null,
    Object? automit = null,
    Object? atcdsPJudic = null,
    Object? immolation = null,
    Object? moyenphlebotomie = null,
    Object? mpendaison = null,
    Object? mmedicaments = null,
    Object? mstrangulation = null,
    Object? mingestiontox = null,
    Object? equiSui = null,
    Object? sautaltitude = null,
    Object? mautres = null,
    Object? nombresHospit = null,
    Object? familleContenante = null,
    Object? typeAtcdspsy = null,
    Object? diagnosticRetenu = null,
    Object? typePersonn = null,
    Object? reactionStress = null,
    Object? injoncSuicidaires = null,
    Object? angoissePsychotique = null,
    Object? etatdepressif = null,
    Object? nbresDeTs = null,
    Object? anciennetemaladie = null,
    Object? agedebutannee = null,
    Object? motifTs = null,
    Object? remarque = freezed,
  }) {
    return _then(_$CreateConsultationDtoImpl(
      numDossier: null == numDossier
          ? _value.numDossier
          : numDossier // ignore: cast_nullable_to_non_nullable
              as String,
      idMed: freezed == idMed
          ? _value.idMed
          : idMed // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      solvantsorg: null == solvantsorg
          ? _value.solvantsorg
          : solvantsorg // ignore: cast_nullable_to_non_nullable
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
      atcdsFamSui: null == atcdsFamSui
          ? _value.atcdsFamSui
          : atcdsFamSui // ignore: cast_nullable_to_non_nullable
              as bool,
      suicideAccompli: null == suicideAccompli
          ? _value.suicideAccompli
          : suicideAccompli // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPSomatik: null == atcdsPSomatik
          ? _value.atcdsPSomatik
          : atcdsPSomatik // ignore: cast_nullable_to_non_nullable
              as bool,
      condImpulsiv: null == condImpulsiv
          ? _value.condImpulsiv
          : condImpulsiv // ignore: cast_nullable_to_non_nullable
              as bool,
      automit: null == automit
          ? _value.automit
          : automit // ignore: cast_nullable_to_non_nullable
              as bool,
      atcdsPJudic: null == atcdsPJudic
          ? _value.atcdsPJudic
          : atcdsPJudic // ignore: cast_nullable_to_non_nullable
              as bool,
      immolation: null == immolation
          ? _value.immolation
          : immolation // ignore: cast_nullable_to_non_nullable
              as bool,
      moyenphlebotomie: null == moyenphlebotomie
          ? _value.moyenphlebotomie
          : moyenphlebotomie // ignore: cast_nullable_to_non_nullable
              as bool,
      mpendaison: null == mpendaison
          ? _value.mpendaison
          : mpendaison // ignore: cast_nullable_to_non_nullable
              as bool,
      mmedicaments: null == mmedicaments
          ? _value.mmedicaments
          : mmedicaments // ignore: cast_nullable_to_non_nullable
              as bool,
      mstrangulation: null == mstrangulation
          ? _value.mstrangulation
          : mstrangulation // ignore: cast_nullable_to_non_nullable
              as bool,
      mingestiontox: null == mingestiontox
          ? _value.mingestiontox
          : mingestiontox // ignore: cast_nullable_to_non_nullable
              as bool,
      equiSui: null == equiSui
          ? _value.equiSui
          : equiSui // ignore: cast_nullable_to_non_nullable
              as bool,
      sautaltitude: null == sautaltitude
          ? _value.sautaltitude
          : sautaltitude // ignore: cast_nullable_to_non_nullable
              as bool,
      mautres: null == mautres
          ? _value.mautres
          : mautres // ignore: cast_nullable_to_non_nullable
              as bool,
      nombresHospit: null == nombresHospit
          ? _value.nombresHospit
          : nombresHospit // ignore: cast_nullable_to_non_nullable
              as String,
      familleContenante: null == familleContenante
          ? _value.familleContenante
          : familleContenante // ignore: cast_nullable_to_non_nullable
              as bool,
      typeAtcdspsy: null == typeAtcdspsy
          ? _value.typeAtcdspsy
          : typeAtcdspsy // ignore: cast_nullable_to_non_nullable
              as String,
      diagnosticRetenu: null == diagnosticRetenu
          ? _value.diagnosticRetenu
          : diagnosticRetenu // ignore: cast_nullable_to_non_nullable
              as String,
      typePersonn: null == typePersonn
          ? _value.typePersonn
          : typePersonn // ignore: cast_nullable_to_non_nullable
              as String,
      reactionStress: null == reactionStress
          ? _value.reactionStress
          : reactionStress // ignore: cast_nullable_to_non_nullable
              as bool,
      injoncSuicidaires: null == injoncSuicidaires
          ? _value.injoncSuicidaires
          : injoncSuicidaires // ignore: cast_nullable_to_non_nullable
              as bool,
      angoissePsychotique: null == angoissePsychotique
          ? _value.angoissePsychotique
          : angoissePsychotique // ignore: cast_nullable_to_non_nullable
              as bool,
      etatdepressif: null == etatdepressif
          ? _value.etatdepressif
          : etatdepressif // ignore: cast_nullable_to_non_nullable
              as bool,
      nbresDeTs: null == nbresDeTs
          ? _value.nbresDeTs
          : nbresDeTs // ignore: cast_nullable_to_non_nullable
              as String,
      anciennetemaladie: null == anciennetemaladie
          ? _value.anciennetemaladie
          : anciennetemaladie // ignore: cast_nullable_to_non_nullable
              as String,
      agedebutannee: null == agedebutannee
          ? _value.agedebutannee
          : agedebutannee // ignore: cast_nullable_to_non_nullable
              as String,
      motifTs: null == motifTs
          ? _value.motifTs
          : motifTs // ignore: cast_nullable_to_non_nullable
              as bool,
      remarque: freezed == remarque
          ? _value.remarque
          : remarque // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateConsultationDtoImpl implements _CreateConsultationDto {
  const _$CreateConsultationDtoImpl(
      {@JsonKey(name: 'num_dossier') required this.numDossier,
      @JsonKey(name: 'id_med') this.idMed,
      this.date,
      required this.addiction,
      @JsonKey(name: 'TABAC') required this.tabac,
      required this.alcool,
      required this.cannabis,
      required this.medicaments,
      required this.solvantsorg,
      @JsonKey(name: 'AtcdsP_TS') required this.atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') required this.ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') required this.hospitAnt,
      @JsonKey(name: 'atcdsFam_SUI') required this.atcdsFamSui,
      @JsonKey(name: 'suicide_accompli') required this.suicideAccompli,
      @JsonKey(name: 'AtcdsP_somatik') required this.atcdsPSomatik,
      @JsonKey(name: 'cond_impulsiv') required this.condImpulsiv,
      required this.automit,
      @JsonKey(name: 'atcds_p_judic') required this.atcdsPJudic,
      required this.immolation,
      required this.moyenphlebotomie,
      @JsonKey(name: 'Mpendaison') required this.mpendaison,
      @JsonKey(name: 'Mmedicaments') required this.mmedicaments,
      @JsonKey(name: 'Mstrangulation') required this.mstrangulation,
      @JsonKey(name: 'Mingestiontox') required this.mingestiontox,
      @JsonKey(name: 'EQUIsui') required this.equiSui,
      required this.sautaltitude,
      @JsonKey(name: 'Mautres') required this.mautres,
      @JsonKey(name: 'nombres_hospit') required this.nombresHospit,
      @JsonKey(name: 'famille_contenante') required this.familleContenante,
      @JsonKey(name: 'type_atcdspsy') required this.typeAtcdspsy,
      @JsonKey(name: 'diagnostic_retenu') required this.diagnosticRetenu,
      @JsonKey(name: 'type_personn') required this.typePersonn,
      @JsonKey(name: 'reaction_stress') required this.reactionStress,
      @JsonKey(name: 'injonc_suicidaires') required this.injoncSuicidaires,
      @JsonKey(name: 'angoisse_psychotique') required this.angoissePsychotique,
      required this.etatdepressif,
      @JsonKey(name: 'nbres_de_ts') required this.nbresDeTs,
      required this.anciennetemaladie,
      required this.agedebutannee,
      @JsonKey(name: 'motifTS') required this.motifTs,
      this.remarque});

  factory _$CreateConsultationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateConsultationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'num_dossier')
  final String numDossier;
  @override
  @JsonKey(name: 'id_med')
  final String? idMed;
  @override
  final String? date;
  @override
  final bool addiction;
  @override
  @JsonKey(name: 'TABAC')
  final bool tabac;
  @override
  final bool alcool;
  @override
  final bool cannabis;
  @override
  final bool medicaments;
  @override
  final bool solvantsorg;
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
  @JsonKey(name: 'atcdsFam_SUI')
  final bool atcdsFamSui;
  @override
  @JsonKey(name: 'suicide_accompli')
  final bool suicideAccompli;
  @override
  @JsonKey(name: 'AtcdsP_somatik')
  final bool atcdsPSomatik;
  @override
  @JsonKey(name: 'cond_impulsiv')
  final bool condImpulsiv;
  @override
  final bool automit;
  @override
  @JsonKey(name: 'atcds_p_judic')
  final bool atcdsPJudic;
  @override
  final bool immolation;
  @override
  final bool moyenphlebotomie;
  @override
  @JsonKey(name: 'Mpendaison')
  final bool mpendaison;
  @override
  @JsonKey(name: 'Mmedicaments')
  final bool mmedicaments;
  @override
  @JsonKey(name: 'Mstrangulation')
  final bool mstrangulation;
  @override
  @JsonKey(name: 'Mingestiontox')
  final bool mingestiontox;
  @override
  @JsonKey(name: 'EQUIsui')
  final bool equiSui;
  @override
  final bool sautaltitude;
  @override
  @JsonKey(name: 'Mautres')
  final bool mautres;
  @override
  @JsonKey(name: 'nombres_hospit')
  final String nombresHospit;
  @override
  @JsonKey(name: 'famille_contenante')
  final bool familleContenante;
  @override
  @JsonKey(name: 'type_atcdspsy')
  final String typeAtcdspsy;
  @override
  @JsonKey(name: 'diagnostic_retenu')
  final String diagnosticRetenu;
  @override
  @JsonKey(name: 'type_personn')
  final String typePersonn;
  @override
  @JsonKey(name: 'reaction_stress')
  final bool reactionStress;
  @override
  @JsonKey(name: 'injonc_suicidaires')
  final bool injoncSuicidaires;
  @override
  @JsonKey(name: 'angoisse_psychotique')
  final bool angoissePsychotique;
  @override
  final bool etatdepressif;
  @override
  @JsonKey(name: 'nbres_de_ts')
  final String nbresDeTs;
  @override
  final String anciennetemaladie;
  @override
  final String agedebutannee;
  @override
  @JsonKey(name: 'motifTS')
  final bool motifTs;
  @override
  final String? remarque;

  @override
  String toString() {
    return 'CreateConsultationDto(numDossier: $numDossier, idMed: $idMed, date: $date, addiction: $addiction, tabac: $tabac, alcool: $alcool, cannabis: $cannabis, medicaments: $medicaments, solvantsorg: $solvantsorg, atcdsPTs: $atcdsPTs, ideesSuiAnt: $ideesSuiAnt, hospitAnt: $hospitAnt, atcdsFamSui: $atcdsFamSui, suicideAccompli: $suicideAccompli, atcdsPSomatik: $atcdsPSomatik, condImpulsiv: $condImpulsiv, automit: $automit, atcdsPJudic: $atcdsPJudic, immolation: $immolation, moyenphlebotomie: $moyenphlebotomie, mpendaison: $mpendaison, mmedicaments: $mmedicaments, mstrangulation: $mstrangulation, mingestiontox: $mingestiontox, equiSui: $equiSui, sautaltitude: $sautaltitude, mautres: $mautres, nombresHospit: $nombresHospit, familleContenante: $familleContenante, typeAtcdspsy: $typeAtcdspsy, diagnosticRetenu: $diagnosticRetenu, typePersonn: $typePersonn, reactionStress: $reactionStress, injoncSuicidaires: $injoncSuicidaires, angoissePsychotique: $angoissePsychotique, etatdepressif: $etatdepressif, nbresDeTs: $nbresDeTs, anciennetemaladie: $anciennetemaladie, agedebutannee: $agedebutannee, motifTs: $motifTs, remarque: $remarque)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateConsultationDtoImpl &&
            (identical(other.numDossier, numDossier) ||
                other.numDossier == numDossier) &&
            (identical(other.idMed, idMed) || other.idMed == idMed) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.addiction, addiction) ||
                other.addiction == addiction) &&
            (identical(other.tabac, tabac) || other.tabac == tabac) &&
            (identical(other.alcool, alcool) || other.alcool == alcool) &&
            (identical(other.cannabis, cannabis) ||
                other.cannabis == cannabis) &&
            (identical(other.medicaments, medicaments) ||
                other.medicaments == medicaments) &&
            (identical(other.solvantsorg, solvantsorg) ||
                other.solvantsorg == solvantsorg) &&
            (identical(other.atcdsPTs, atcdsPTs) ||
                other.atcdsPTs == atcdsPTs) &&
            (identical(other.ideesSuiAnt, ideesSuiAnt) ||
                other.ideesSuiAnt == ideesSuiAnt) &&
            (identical(other.hospitAnt, hospitAnt) ||
                other.hospitAnt == hospitAnt) &&
            (identical(other.atcdsFamSui, atcdsFamSui) ||
                other.atcdsFamSui == atcdsFamSui) &&
            (identical(other.suicideAccompli, suicideAccompli) ||
                other.suicideAccompli == suicideAccompli) &&
            (identical(other.atcdsPSomatik, atcdsPSomatik) ||
                other.atcdsPSomatik == atcdsPSomatik) &&
            (identical(other.condImpulsiv, condImpulsiv) ||
                other.condImpulsiv == condImpulsiv) &&
            (identical(other.automit, automit) || other.automit == automit) &&
            (identical(other.atcdsPJudic, atcdsPJudic) ||
                other.atcdsPJudic == atcdsPJudic) &&
            (identical(other.immolation, immolation) ||
                other.immolation == immolation) &&
            (identical(other.moyenphlebotomie, moyenphlebotomie) ||
                other.moyenphlebotomie == moyenphlebotomie) &&
            (identical(other.mpendaison, mpendaison) ||
                other.mpendaison == mpendaison) &&
            (identical(other.mmedicaments, mmedicaments) ||
                other.mmedicaments == mmedicaments) &&
            (identical(other.mstrangulation, mstrangulation) ||
                other.mstrangulation == mstrangulation) &&
            (identical(other.mingestiontox, mingestiontox) ||
                other.mingestiontox == mingestiontox) &&
            (identical(other.equiSui, equiSui) || other.equiSui == equiSui) &&
            (identical(other.sautaltitude, sautaltitude) ||
                other.sautaltitude == sautaltitude) &&
            (identical(other.mautres, mautres) || other.mautres == mautres) &&
            (identical(other.nombresHospit, nombresHospit) ||
                other.nombresHospit == nombresHospit) &&
            (identical(other.familleContenante, familleContenante) ||
                other.familleContenante == familleContenante) &&
            (identical(other.typeAtcdspsy, typeAtcdspsy) ||
                other.typeAtcdspsy == typeAtcdspsy) &&
            (identical(other.diagnosticRetenu, diagnosticRetenu) ||
                other.diagnosticRetenu == diagnosticRetenu) &&
            (identical(other.typePersonn, typePersonn) ||
                other.typePersonn == typePersonn) &&
            (identical(other.reactionStress, reactionStress) ||
                other.reactionStress == reactionStress) &&
            (identical(other.injoncSuicidaires, injoncSuicidaires) ||
                other.injoncSuicidaires == injoncSuicidaires) &&
            (identical(other.angoissePsychotique, angoissePsychotique) ||
                other.angoissePsychotique == angoissePsychotique) &&
            (identical(other.etatdepressif, etatdepressif) ||
                other.etatdepressif == etatdepressif) &&
            (identical(other.nbresDeTs, nbresDeTs) ||
                other.nbresDeTs == nbresDeTs) &&
            (identical(other.anciennetemaladie, anciennetemaladie) ||
                other.anciennetemaladie == anciennetemaladie) &&
            (identical(other.agedebutannee, agedebutannee) ||
                other.agedebutannee == agedebutannee) &&
            (identical(other.motifTs, motifTs) || other.motifTs == motifTs) &&
            (identical(other.remarque, remarque) ||
                other.remarque == remarque));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        numDossier,
        idMed,
        date,
        addiction,
        tabac,
        alcool,
        cannabis,
        medicaments,
        solvantsorg,
        atcdsPTs,
        ideesSuiAnt,
        hospitAnt,
        atcdsFamSui,
        suicideAccompli,
        atcdsPSomatik,
        condImpulsiv,
        automit,
        atcdsPJudic,
        immolation,
        moyenphlebotomie,
        mpendaison,
        mmedicaments,
        mstrangulation,
        mingestiontox,
        equiSui,
        sautaltitude,
        mautres,
        nombresHospit,
        familleContenante,
        typeAtcdspsy,
        diagnosticRetenu,
        typePersonn,
        reactionStress,
        injoncSuicidaires,
        angoissePsychotique,
        etatdepressif,
        nbresDeTs,
        anciennetemaladie,
        agedebutannee,
        motifTs,
        remarque
      ]);

  /// Create a copy of CreateConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateConsultationDtoImplCopyWith<_$CreateConsultationDtoImpl>
      get copyWith => __$$CreateConsultationDtoImplCopyWithImpl<
          _$CreateConsultationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateConsultationDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateConsultationDto implements CreateConsultationDto {
  const factory _CreateConsultationDto(
      {@JsonKey(name: 'num_dossier') required final String numDossier,
      @JsonKey(name: 'id_med') final String? idMed,
      final String? date,
      required final bool addiction,
      @JsonKey(name: 'TABAC') required final bool tabac,
      required final bool alcool,
      required final bool cannabis,
      required final bool medicaments,
      required final bool solvantsorg,
      @JsonKey(name: 'AtcdsP_TS') required final bool atcdsPTs,
      @JsonKey(name: 'idees_sui_ant') required final bool ideesSuiAnt,
      @JsonKey(name: 'hospit_ant') required final bool hospitAnt,
      @JsonKey(name: 'atcdsFam_SUI') required final bool atcdsFamSui,
      @JsonKey(name: 'suicide_accompli') required final bool suicideAccompli,
      @JsonKey(name: 'AtcdsP_somatik') required final bool atcdsPSomatik,
      @JsonKey(name: 'cond_impulsiv') required final bool condImpulsiv,
      required final bool automit,
      @JsonKey(name: 'atcds_p_judic') required final bool atcdsPJudic,
      required final bool immolation,
      required final bool moyenphlebotomie,
      @JsonKey(name: 'Mpendaison') required final bool mpendaison,
      @JsonKey(name: 'Mmedicaments') required final bool mmedicaments,
      @JsonKey(name: 'Mstrangulation') required final bool mstrangulation,
      @JsonKey(name: 'Mingestiontox') required final bool mingestiontox,
      @JsonKey(name: 'EQUIsui') required final bool equiSui,
      required final bool sautaltitude,
      @JsonKey(name: 'Mautres') required final bool mautres,
      @JsonKey(name: 'nombres_hospit') required final String nombresHospit,
      @JsonKey(name: 'famille_contenante')
      required final bool familleContenante,
      @JsonKey(name: 'type_atcdspsy') required final String typeAtcdspsy,
      @JsonKey(name: 'diagnostic_retenu')
      required final String diagnosticRetenu,
      @JsonKey(name: 'type_personn') required final String typePersonn,
      @JsonKey(name: 'reaction_stress') required final bool reactionStress,
      @JsonKey(name: 'injonc_suicidaires')
      required final bool injoncSuicidaires,
      @JsonKey(name: 'angoisse_psychotique')
      required final bool angoissePsychotique,
      required final bool etatdepressif,
      @JsonKey(name: 'nbres_de_ts') required final String nbresDeTs,
      required final String anciennetemaladie,
      required final String agedebutannee,
      @JsonKey(name: 'motifTS') required final bool motifTs,
      final String? remarque}) = _$CreateConsultationDtoImpl;

  factory _CreateConsultationDto.fromJson(Map<String, dynamic> json) =
      _$CreateConsultationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'num_dossier')
  String get numDossier;
  @override
  @JsonKey(name: 'id_med')
  String? get idMed;
  @override
  String? get date;
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
  bool get solvantsorg;
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
  @JsonKey(name: 'atcdsFam_SUI')
  bool get atcdsFamSui;
  @override
  @JsonKey(name: 'suicide_accompli')
  bool get suicideAccompli;
  @override
  @JsonKey(name: 'AtcdsP_somatik')
  bool get atcdsPSomatik;
  @override
  @JsonKey(name: 'cond_impulsiv')
  bool get condImpulsiv;
  @override
  bool get automit;
  @override
  @JsonKey(name: 'atcds_p_judic')
  bool get atcdsPJudic;
  @override
  bool get immolation;
  @override
  bool get moyenphlebotomie;
  @override
  @JsonKey(name: 'Mpendaison')
  bool get mpendaison;
  @override
  @JsonKey(name: 'Mmedicaments')
  bool get mmedicaments;
  @override
  @JsonKey(name: 'Mstrangulation')
  bool get mstrangulation;
  @override
  @JsonKey(name: 'Mingestiontox')
  bool get mingestiontox;
  @override
  @JsonKey(name: 'EQUIsui')
  bool get equiSui;
  @override
  bool get sautaltitude;
  @override
  @JsonKey(name: 'Mautres')
  bool get mautres;
  @override
  @JsonKey(name: 'nombres_hospit')
  String get nombresHospit;
  @override
  @JsonKey(name: 'famille_contenante')
  bool get familleContenante;
  @override
  @JsonKey(name: 'type_atcdspsy')
  String get typeAtcdspsy;
  @override
  @JsonKey(name: 'diagnostic_retenu')
  String get diagnosticRetenu;
  @override
  @JsonKey(name: 'type_personn')
  String get typePersonn;
  @override
  @JsonKey(name: 'reaction_stress')
  bool get reactionStress;
  @override
  @JsonKey(name: 'injonc_suicidaires')
  bool get injoncSuicidaires;
  @override
  @JsonKey(name: 'angoisse_psychotique')
  bool get angoissePsychotique;
  @override
  bool get etatdepressif;
  @override
  @JsonKey(name: 'nbres_de_ts')
  String get nbresDeTs;
  @override
  String get anciennetemaladie;
  @override
  String get agedebutannee;
  @override
  @JsonKey(name: 'motifTS')
  bool get motifTs;
  @override
  String? get remarque;

  /// Create a copy of CreateConsultationDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateConsultationDtoImplCopyWith<_$CreateConsultationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateConsultationFromAppointmentDto
    _$CreateConsultationFromAppointmentDtoFromJson(Map<String, dynamic> json) {
  return _CreateConsultationFromAppointmentDto.fromJson(json);
}

/// @nodoc
mixin _$CreateConsultationFromAppointmentDto {
  String get appointmentId => throw _privateConstructorUsedError;
  CreateConsultationDto get consultationData =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateConsultationFromAppointmentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateConsultationFromAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateConsultationFromAppointmentDtoCopyWith<
          CreateConsultationFromAppointmentDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateConsultationFromAppointmentDtoCopyWith<$Res> {
  factory $CreateConsultationFromAppointmentDtoCopyWith(
          CreateConsultationFromAppointmentDto value,
          $Res Function(CreateConsultationFromAppointmentDto) then) =
      _$CreateConsultationFromAppointmentDtoCopyWithImpl<$Res,
          CreateConsultationFromAppointmentDto>;
  @useResult
  $Res call({String appointmentId, CreateConsultationDto consultationData});

  $CreateConsultationDtoCopyWith<$Res> get consultationData;
}

/// @nodoc
class _$CreateConsultationFromAppointmentDtoCopyWithImpl<$Res,
        $Val extends CreateConsultationFromAppointmentDto>
    implements $CreateConsultationFromAppointmentDtoCopyWith<$Res> {
  _$CreateConsultationFromAppointmentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateConsultationFromAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? consultationData = null,
  }) {
    return _then(_value.copyWith(
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      consultationData: null == consultationData
          ? _value.consultationData
          : consultationData // ignore: cast_nullable_to_non_nullable
              as CreateConsultationDto,
    ) as $Val);
  }

  /// Create a copy of CreateConsultationFromAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateConsultationDtoCopyWith<$Res> get consultationData {
    return $CreateConsultationDtoCopyWith<$Res>(_value.consultationData,
        (value) {
      return _then(_value.copyWith(consultationData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateConsultationFromAppointmentDtoImplCopyWith<$Res>
    implements $CreateConsultationFromAppointmentDtoCopyWith<$Res> {
  factory _$$CreateConsultationFromAppointmentDtoImplCopyWith(
          _$CreateConsultationFromAppointmentDtoImpl value,
          $Res Function(_$CreateConsultationFromAppointmentDtoImpl) then) =
      __$$CreateConsultationFromAppointmentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appointmentId, CreateConsultationDto consultationData});

  @override
  $CreateConsultationDtoCopyWith<$Res> get consultationData;
}

/// @nodoc
class __$$CreateConsultationFromAppointmentDtoImplCopyWithImpl<$Res>
    extends _$CreateConsultationFromAppointmentDtoCopyWithImpl<$Res,
        _$CreateConsultationFromAppointmentDtoImpl>
    implements _$$CreateConsultationFromAppointmentDtoImplCopyWith<$Res> {
  __$$CreateConsultationFromAppointmentDtoImplCopyWithImpl(
      _$CreateConsultationFromAppointmentDtoImpl _value,
      $Res Function(_$CreateConsultationFromAppointmentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateConsultationFromAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? consultationData = null,
  }) {
    return _then(_$CreateConsultationFromAppointmentDtoImpl(
      appointmentId: null == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String,
      consultationData: null == consultationData
          ? _value.consultationData
          : consultationData // ignore: cast_nullable_to_non_nullable
              as CreateConsultationDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateConsultationFromAppointmentDtoImpl
    implements _CreateConsultationFromAppointmentDto {
  const _$CreateConsultationFromAppointmentDtoImpl(
      {required this.appointmentId, required this.consultationData});

  factory _$CreateConsultationFromAppointmentDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateConsultationFromAppointmentDtoImplFromJson(json);

  @override
  final String appointmentId;
  @override
  final CreateConsultationDto consultationData;

  @override
  String toString() {
    return 'CreateConsultationFromAppointmentDto(appointmentId: $appointmentId, consultationData: $consultationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateConsultationFromAppointmentDtoImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.consultationData, consultationData) ||
                other.consultationData == consultationData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appointmentId, consultationData);

  /// Create a copy of CreateConsultationFromAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateConsultationFromAppointmentDtoImplCopyWith<
          _$CreateConsultationFromAppointmentDtoImpl>
      get copyWith => __$$CreateConsultationFromAppointmentDtoImplCopyWithImpl<
          _$CreateConsultationFromAppointmentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateConsultationFromAppointmentDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateConsultationFromAppointmentDto
    implements CreateConsultationFromAppointmentDto {
  const factory _CreateConsultationFromAppointmentDto(
          {required final String appointmentId,
          required final CreateConsultationDto consultationData}) =
      _$CreateConsultationFromAppointmentDtoImpl;

  factory _CreateConsultationFromAppointmentDto.fromJson(
          Map<String, dynamic> json) =
      _$CreateConsultationFromAppointmentDtoImpl.fromJson;

  @override
  String get appointmentId;
  @override
  CreateConsultationDto get consultationData;

  /// Create a copy of CreateConsultationFromAppointmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateConsultationFromAppointmentDtoImplCopyWith<
          _$CreateConsultationFromAppointmentDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateConsultationResponse _$CreateConsultationResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateConsultationResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateConsultationResponse {
  String? get message => throw _privateConstructorUsedError;
  String? get consultationId => throw _privateConstructorUsedError;
  String? get appointmentId => throw _privateConstructorUsedError;

  /// Serializes this CreateConsultationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateConsultationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateConsultationResponseCopyWith<CreateConsultationResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateConsultationResponseCopyWith<$Res> {
  factory $CreateConsultationResponseCopyWith(CreateConsultationResponse value,
          $Res Function(CreateConsultationResponse) then) =
      _$CreateConsultationResponseCopyWithImpl<$Res,
          CreateConsultationResponse>;
  @useResult
  $Res call({String? message, String? consultationId, String? appointmentId});
}

/// @nodoc
class _$CreateConsultationResponseCopyWithImpl<$Res,
        $Val extends CreateConsultationResponse>
    implements $CreateConsultationResponseCopyWith<$Res> {
  _$CreateConsultationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateConsultationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? consultationId = freezed,
    Object? appointmentId = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      consultationId: freezed == consultationId
          ? _value.consultationId
          : consultationId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateConsultationResponseImplCopyWith<$Res>
    implements $CreateConsultationResponseCopyWith<$Res> {
  factory _$$CreateConsultationResponseImplCopyWith(
          _$CreateConsultationResponseImpl value,
          $Res Function(_$CreateConsultationResponseImpl) then) =
      __$$CreateConsultationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, String? consultationId, String? appointmentId});
}

/// @nodoc
class __$$CreateConsultationResponseImplCopyWithImpl<$Res>
    extends _$CreateConsultationResponseCopyWithImpl<$Res,
        _$CreateConsultationResponseImpl>
    implements _$$CreateConsultationResponseImplCopyWith<$Res> {
  __$$CreateConsultationResponseImplCopyWithImpl(
      _$CreateConsultationResponseImpl _value,
      $Res Function(_$CreateConsultationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateConsultationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? consultationId = freezed,
    Object? appointmentId = freezed,
  }) {
    return _then(_$CreateConsultationResponseImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      consultationId: freezed == consultationId
          ? _value.consultationId
          : consultationId // ignore: cast_nullable_to_non_nullable
              as String?,
      appointmentId: freezed == appointmentId
          ? _value.appointmentId
          : appointmentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateConsultationResponseImpl implements _CreateConsultationResponse {
  const _$CreateConsultationResponseImpl(
      {this.message, this.consultationId, this.appointmentId});

  factory _$CreateConsultationResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateConsultationResponseImplFromJson(json);

  @override
  final String? message;
  @override
  final String? consultationId;
  @override
  final String? appointmentId;

  @override
  String toString() {
    return 'CreateConsultationResponse(message: $message, consultationId: $consultationId, appointmentId: $appointmentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateConsultationResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, consultationId, appointmentId);

  /// Create a copy of CreateConsultationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateConsultationResponseImplCopyWith<_$CreateConsultationResponseImpl>
      get copyWith => __$$CreateConsultationResponseImplCopyWithImpl<
          _$CreateConsultationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateConsultationResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateConsultationResponse
    implements CreateConsultationResponse {
  const factory _CreateConsultationResponse(
      {final String? message,
      final String? consultationId,
      final String? appointmentId}) = _$CreateConsultationResponseImpl;

  factory _CreateConsultationResponse.fromJson(Map<String, dynamic> json) =
      _$CreateConsultationResponseImpl.fromJson;

  @override
  String? get message;
  @override
  String? get consultationId;
  @override
  String? get appointmentId;

  /// Create a copy of CreateConsultationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateConsultationResponseImplCopyWith<_$CreateConsultationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
