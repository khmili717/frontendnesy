// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  int get cin => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  Gender get sexe => throw _privateConstructorUsedError;
  String? get numeroTelephone => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? id,
      String nom,
      String prenom,
      int cin,
      UserRole role,
      Gender sexe,
      String? numeroTelephone,
      bool archived,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
    Object? sexe = null,
    Object? numeroTelephone = freezed,
    Object? archived = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
              as UserRole,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Gender,
      numeroTelephone: freezed == numeroTelephone
          ? _value.numeroTelephone
          : numeroTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String nom,
      String prenom,
      int cin,
      UserRole role,
      Gender sexe,
      String? numeroTelephone,
      bool archived,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nom = null,
    Object? prenom = null,
    Object? cin = null,
    Object? role = null,
    Object? sexe = null,
    Object? numeroTelephone = freezed,
    Object? archived = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$UserImpl(
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
              as UserRole,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Gender,
      numeroTelephone: freezed == numeroTelephone
          ? _value.numeroTelephone
          : numeroTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {this.id,
      required this.nom,
      required this.prenom,
      required this.cin,
      required this.role,
      required this.sexe,
      this.numeroTelephone,
      this.archived = false,
      this.createdAt,
      this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String? id;
  @override
  final String nom;
  @override
  final String prenom;
  @override
  final int cin;
  @override
  final UserRole role;
  @override
  final Gender sexe;
  @override
  final String? numeroTelephone;
  @override
  @JsonKey()
  final bool archived;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'User(id: $id, nom: $nom, prenom: $prenom, cin: $cin, role: $role, sexe: $sexe, numeroTelephone: $numeroTelephone, archived: $archived, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.numeroTelephone, numeroTelephone) ||
                other.numeroTelephone == numeroTelephone) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, prenom, cin, role, sexe,
      numeroTelephone, archived, createdAt, updatedAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? id,
      required final String nom,
      required final String prenom,
      required final int cin,
      required final UserRole role,
      required final Gender sexe,
      final String? numeroTelephone,
      final bool archived,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String? get id;
  @override
  String get nom;
  @override
  String get prenom;
  @override
  int get cin;
  @override
  UserRole get role;
  @override
  Gender get sexe;
  @override
  String? get numeroTelephone;
  @override
  bool get archived;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) {
  return _CreateUserRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateUserRequest {
  String get nom => throw _privateConstructorUsedError;
  String get prenom => throw _privateConstructorUsedError;
  String get mdp => throw _privateConstructorUsedError;
  int get cin => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  Gender get sexe => throw _privateConstructorUsedError;
  String? get numeroTelephone => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;

  /// Serializes this CreateUserRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserRequestCopyWith<CreateUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserRequestCopyWith<$Res> {
  factory $CreateUserRequestCopyWith(
          CreateUserRequest value, $Res Function(CreateUserRequest) then) =
      _$CreateUserRequestCopyWithImpl<$Res, CreateUserRequest>;
  @useResult
  $Res call(
      {String nom,
      String prenom,
      String mdp,
      int cin,
      UserRole role,
      Gender sexe,
      String? numeroTelephone,
      bool archived});
}

/// @nodoc
class _$CreateUserRequestCopyWithImpl<$Res, $Val extends CreateUserRequest>
    implements $CreateUserRequestCopyWith<$Res> {
  _$CreateUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? prenom = null,
    Object? mdp = null,
    Object? cin = null,
    Object? role = null,
    Object? sexe = null,
    Object? numeroTelephone = freezed,
    Object? archived = null,
  }) {
    return _then(_value.copyWith(
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      mdp: null == mdp
          ? _value.mdp
          : mdp // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Gender,
      numeroTelephone: freezed == numeroTelephone
          ? _value.numeroTelephone
          : numeroTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateUserRequestImplCopyWith<$Res>
    implements $CreateUserRequestCopyWith<$Res> {
  factory _$$CreateUserRequestImplCopyWith(_$CreateUserRequestImpl value,
          $Res Function(_$CreateUserRequestImpl) then) =
      __$$CreateUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nom,
      String prenom,
      String mdp,
      int cin,
      UserRole role,
      Gender sexe,
      String? numeroTelephone,
      bool archived});
}

/// @nodoc
class __$$CreateUserRequestImplCopyWithImpl<$Res>
    extends _$CreateUserRequestCopyWithImpl<$Res, _$CreateUserRequestImpl>
    implements _$$CreateUserRequestImplCopyWith<$Res> {
  __$$CreateUserRequestImplCopyWithImpl(_$CreateUserRequestImpl _value,
      $Res Function(_$CreateUserRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = null,
    Object? prenom = null,
    Object? mdp = null,
    Object? cin = null,
    Object? role = null,
    Object? sexe = null,
    Object? numeroTelephone = freezed,
    Object? archived = null,
  }) {
    return _then(_$CreateUserRequestImpl(
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      prenom: null == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String,
      mdp: null == mdp
          ? _value.mdp
          : mdp // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      sexe: null == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Gender,
      numeroTelephone: freezed == numeroTelephone
          ? _value.numeroTelephone
          : numeroTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserRequestImpl implements _CreateUserRequest {
  const _$CreateUserRequestImpl(
      {required this.nom,
      required this.prenom,
      required this.mdp,
      required this.cin,
      required this.role,
      required this.sexe,
      this.numeroTelephone,
      this.archived = false});

  factory _$CreateUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserRequestImplFromJson(json);

  @override
  final String nom;
  @override
  final String prenom;
  @override
  final String mdp;
  @override
  final int cin;
  @override
  final UserRole role;
  @override
  final Gender sexe;
  @override
  final String? numeroTelephone;
  @override
  @JsonKey()
  final bool archived;

  @override
  String toString() {
    return 'CreateUserRequest(nom: $nom, prenom: $prenom, mdp: $mdp, cin: $cin, role: $role, sexe: $sexe, numeroTelephone: $numeroTelephone, archived: $archived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserRequestImpl &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.mdp, mdp) || other.mdp == mdp) &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.numeroTelephone, numeroTelephone) ||
                other.numeroTelephone == numeroTelephone) &&
            (identical(other.archived, archived) ||
                other.archived == archived));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nom, prenom, mdp, cin, role,
      sexe, numeroTelephone, archived);

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserRequestImplCopyWith<_$CreateUserRequestImpl> get copyWith =>
      __$$CreateUserRequestImplCopyWithImpl<_$CreateUserRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateUserRequest implements CreateUserRequest {
  const factory _CreateUserRequest(
      {required final String nom,
      required final String prenom,
      required final String mdp,
      required final int cin,
      required final UserRole role,
      required final Gender sexe,
      final String? numeroTelephone,
      final bool archived}) = _$CreateUserRequestImpl;

  factory _CreateUserRequest.fromJson(Map<String, dynamic> json) =
      _$CreateUserRequestImpl.fromJson;

  @override
  String get nom;
  @override
  String get prenom;
  @override
  String get mdp;
  @override
  int get cin;
  @override
  UserRole get role;
  @override
  Gender get sexe;
  @override
  String? get numeroTelephone;
  @override
  bool get archived;

  /// Create a copy of CreateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserRequestImplCopyWith<_$CreateUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) {
  return _UpdateUserRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateUserRequest {
  String? get nom => throw _privateConstructorUsedError;
  String? get prenom => throw _privateConstructorUsedError;
  String? get mdp => throw _privateConstructorUsedError;
  int? get cin => throw _privateConstructorUsedError;
  UserRole? get role => throw _privateConstructorUsedError;
  Gender? get sexe => throw _privateConstructorUsedError;
  String? get numeroTelephone => throw _privateConstructorUsedError;
  bool? get archived => throw _privateConstructorUsedError;

  /// Serializes this UpdateUserRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateUserRequestCopyWith<UpdateUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserRequestCopyWith<$Res> {
  factory $UpdateUserRequestCopyWith(
          UpdateUserRequest value, $Res Function(UpdateUserRequest) then) =
      _$UpdateUserRequestCopyWithImpl<$Res, UpdateUserRequest>;
  @useResult
  $Res call(
      {String? nom,
      String? prenom,
      String? mdp,
      int? cin,
      UserRole? role,
      Gender? sexe,
      String? numeroTelephone,
      bool? archived});
}

/// @nodoc
class _$UpdateUserRequestCopyWithImpl<$Res, $Val extends UpdateUserRequest>
    implements $UpdateUserRequestCopyWith<$Res> {
  _$UpdateUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? mdp = freezed,
    Object? cin = freezed,
    Object? role = freezed,
    Object? sexe = freezed,
    Object? numeroTelephone = freezed,
    Object? archived = freezed,
  }) {
    return _then(_value.copyWith(
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      mdp: freezed == mdp
          ? _value.mdp
          : mdp // ignore: cast_nullable_to_non_nullable
              as String?,
      cin: freezed == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Gender?,
      numeroTelephone: freezed == numeroTelephone
          ? _value.numeroTelephone
          : numeroTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserRequestImplCopyWith<$Res>
    implements $UpdateUserRequestCopyWith<$Res> {
  factory _$$UpdateUserRequestImplCopyWith(_$UpdateUserRequestImpl value,
          $Res Function(_$UpdateUserRequestImpl) then) =
      __$$UpdateUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? nom,
      String? prenom,
      String? mdp,
      int? cin,
      UserRole? role,
      Gender? sexe,
      String? numeroTelephone,
      bool? archived});
}

/// @nodoc
class __$$UpdateUserRequestImplCopyWithImpl<$Res>
    extends _$UpdateUserRequestCopyWithImpl<$Res, _$UpdateUserRequestImpl>
    implements _$$UpdateUserRequestImplCopyWith<$Res> {
  __$$UpdateUserRequestImplCopyWithImpl(_$UpdateUserRequestImpl _value,
      $Res Function(_$UpdateUserRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nom = freezed,
    Object? prenom = freezed,
    Object? mdp = freezed,
    Object? cin = freezed,
    Object? role = freezed,
    Object? sexe = freezed,
    Object? numeroTelephone = freezed,
    Object? archived = freezed,
  }) {
    return _then(_$UpdateUserRequestImpl(
      nom: freezed == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String?,
      prenom: freezed == prenom
          ? _value.prenom
          : prenom // ignore: cast_nullable_to_non_nullable
              as String?,
      mdp: freezed == mdp
          ? _value.mdp
          : mdp // ignore: cast_nullable_to_non_nullable
              as String?,
      cin: freezed == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole?,
      sexe: freezed == sexe
          ? _value.sexe
          : sexe // ignore: cast_nullable_to_non_nullable
              as Gender?,
      numeroTelephone: freezed == numeroTelephone
          ? _value.numeroTelephone
          : numeroTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      archived: freezed == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateUserRequestImpl implements _UpdateUserRequest {
  const _$UpdateUserRequestImpl(
      {this.nom,
      this.prenom,
      this.mdp,
      this.cin,
      this.role,
      this.sexe,
      this.numeroTelephone,
      this.archived});

  factory _$UpdateUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateUserRequestImplFromJson(json);

  @override
  final String? nom;
  @override
  final String? prenom;
  @override
  final String? mdp;
  @override
  final int? cin;
  @override
  final UserRole? role;
  @override
  final Gender? sexe;
  @override
  final String? numeroTelephone;
  @override
  final bool? archived;

  @override
  String toString() {
    return 'UpdateUserRequest(nom: $nom, prenom: $prenom, mdp: $mdp, cin: $cin, role: $role, sexe: $sexe, numeroTelephone: $numeroTelephone, archived: $archived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserRequestImpl &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.prenom, prenom) || other.prenom == prenom) &&
            (identical(other.mdp, mdp) || other.mdp == mdp) &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sexe, sexe) || other.sexe == sexe) &&
            (identical(other.numeroTelephone, numeroTelephone) ||
                other.numeroTelephone == numeroTelephone) &&
            (identical(other.archived, archived) ||
                other.archived == archived));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nom, prenom, mdp, cin, role,
      sexe, numeroTelephone, archived);

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      __$$UpdateUserRequestImplCopyWithImpl<_$UpdateUserRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateUserRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateUserRequest implements UpdateUserRequest {
  const factory _UpdateUserRequest(
      {final String? nom,
      final String? prenom,
      final String? mdp,
      final int? cin,
      final UserRole? role,
      final Gender? sexe,
      final String? numeroTelephone,
      final bool? archived}) = _$UpdateUserRequestImpl;

  factory _UpdateUserRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateUserRequestImpl.fromJson;

  @override
  String? get nom;
  @override
  String? get prenom;
  @override
  String? get mdp;
  @override
  int? get cin;
  @override
  UserRole? get role;
  @override
  Gender? get sexe;
  @override
  String? get numeroTelephone;
  @override
  bool? get archived;

  /// Create a copy of UpdateUserRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserRequestImplCopyWith<_$UpdateUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  int get cin => throw _privateConstructorUsedError;
  String get mdp => throw _privateConstructorUsedError;

  /// Serializes this LoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({int cin, String mdp});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cin = null,
    Object? mdp = null,
  }) {
    return _then(_value.copyWith(
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      mdp: null == mdp
          ? _value.mdp
          : mdp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
          _$LoginRequestImpl value, $Res Function(_$LoginRequestImpl) then) =
      __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cin, String mdp});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
      _$LoginRequestImpl _value, $Res Function(_$LoginRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cin = null,
    Object? mdp = null,
  }) {
    return _then(_$LoginRequestImpl(
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as int,
      mdp: null == mdp
          ? _value.mdp
          : mdp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl({required this.cin, required this.mdp});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final int cin;
  @override
  final String mdp;

  @override
  String toString() {
    return 'LoginRequest(cin: $cin, mdp: $mdp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.mdp, mdp) || other.mdp == mdp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cin, mdp);

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
      {required final int cin, required final String mdp}) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  int get cin;
  @override
  String get mdp;

  /// Create a copy of LoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  String get token => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({String token, User user, String? refreshToken});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, User user, String? refreshToken});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
    Object? refreshToken = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {required this.token, required this.user, this.refreshToken});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final String token;
  @override
  final User user;
  @override
  final String? refreshToken;

  @override
  String toString() {
    return 'LoginResponse(token: $token, user: $user, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, user, refreshToken);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {required final String token,
      required final User user,
      final String? refreshToken}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  String get token;
  @override
  User get user;
  @override
  String? get refreshToken;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenValidationRequest _$TokenValidationRequestFromJson(
    Map<String, dynamic> json) {
  return _TokenValidationRequest.fromJson(json);
}

/// @nodoc
mixin _$TokenValidationRequest {
  String get token => throw _privateConstructorUsedError;

  /// Serializes this TokenValidationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenValidationRequestCopyWith<TokenValidationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenValidationRequestCopyWith<$Res> {
  factory $TokenValidationRequestCopyWith(TokenValidationRequest value,
          $Res Function(TokenValidationRequest) then) =
      _$TokenValidationRequestCopyWithImpl<$Res, TokenValidationRequest>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$TokenValidationRequestCopyWithImpl<$Res,
        $Val extends TokenValidationRequest>
    implements $TokenValidationRequestCopyWith<$Res> {
  _$TokenValidationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenValidationRequestImplCopyWith<$Res>
    implements $TokenValidationRequestCopyWith<$Res> {
  factory _$$TokenValidationRequestImplCopyWith(
          _$TokenValidationRequestImpl value,
          $Res Function(_$TokenValidationRequestImpl) then) =
      __$$TokenValidationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$TokenValidationRequestImplCopyWithImpl<$Res>
    extends _$TokenValidationRequestCopyWithImpl<$Res,
        _$TokenValidationRequestImpl>
    implements _$$TokenValidationRequestImplCopyWith<$Res> {
  __$$TokenValidationRequestImplCopyWithImpl(
      _$TokenValidationRequestImpl _value,
      $Res Function(_$TokenValidationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$TokenValidationRequestImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenValidationRequestImpl implements _TokenValidationRequest {
  const _$TokenValidationRequestImpl({required this.token});

  factory _$TokenValidationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenValidationRequestImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'TokenValidationRequest(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenValidationRequestImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of TokenValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenValidationRequestImplCopyWith<_$TokenValidationRequestImpl>
      get copyWith => __$$TokenValidationRequestImplCopyWithImpl<
          _$TokenValidationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenValidationRequestImplToJson(
      this,
    );
  }
}

abstract class _TokenValidationRequest implements TokenValidationRequest {
  const factory _TokenValidationRequest({required final String token}) =
      _$TokenValidationRequestImpl;

  factory _TokenValidationRequest.fromJson(Map<String, dynamic> json) =
      _$TokenValidationRequestImpl.fromJson;

  @override
  String get token;

  /// Create a copy of TokenValidationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenValidationRequestImplCopyWith<_$TokenValidationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TokenValidationResponse _$TokenValidationResponseFromJson(
    Map<String, dynamic> json) {
  return _TokenValidationResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenValidationResponse {
  String get status => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  /// Serializes this TokenValidationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenValidationResponseCopyWith<TokenValidationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenValidationResponseCopyWith<$Res> {
  factory $TokenValidationResponseCopyWith(TokenValidationResponse value,
          $Res Function(TokenValidationResponse) then) =
      _$TokenValidationResponseCopyWithImpl<$Res, TokenValidationResponse>;
  @useResult
  $Res call({String status, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$TokenValidationResponseCopyWithImpl<$Res,
        $Val extends TokenValidationResponse>
    implements $TokenValidationResponseCopyWith<$Res> {
  _$TokenValidationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of TokenValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TokenValidationResponseImplCopyWith<$Res>
    implements $TokenValidationResponseCopyWith<$Res> {
  factory _$$TokenValidationResponseImplCopyWith(
          _$TokenValidationResponseImpl value,
          $Res Function(_$TokenValidationResponseImpl) then) =
      __$$TokenValidationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$TokenValidationResponseImplCopyWithImpl<$Res>
    extends _$TokenValidationResponseCopyWithImpl<$Res,
        _$TokenValidationResponseImpl>
    implements _$$TokenValidationResponseImplCopyWith<$Res> {
  __$$TokenValidationResponseImplCopyWithImpl(
      _$TokenValidationResponseImpl _value,
      $Res Function(_$TokenValidationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
  }) {
    return _then(_$TokenValidationResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenValidationResponseImpl implements _TokenValidationResponse {
  const _$TokenValidationResponseImpl(
      {required this.status, required this.user});

  factory _$TokenValidationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenValidationResponseImplFromJson(json);

  @override
  final String status;
  @override
  final User user;

  @override
  String toString() {
    return 'TokenValidationResponse(status: $status, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenValidationResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, user);

  /// Create a copy of TokenValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenValidationResponseImplCopyWith<_$TokenValidationResponseImpl>
      get copyWith => __$$TokenValidationResponseImplCopyWithImpl<
          _$TokenValidationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenValidationResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenValidationResponse implements TokenValidationResponse {
  const factory _TokenValidationResponse(
      {required final String status,
      required final User user}) = _$TokenValidationResponseImpl;

  factory _TokenValidationResponse.fromJson(Map<String, dynamic> json) =
      _$TokenValidationResponseImpl.fromJson;

  @override
  String get status;
  @override
  User get user;

  /// Create a copy of TokenValidationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenValidationResponseImplCopyWith<_$TokenValidationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
