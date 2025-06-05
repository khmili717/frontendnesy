// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      cin: (json['cin'] as num).toInt(),
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      sexe: $enumDecode(_$GenderEnumMap, json['sexe']),
      numeroTelephone: json['numeroTelephone'] as String?,
      archived: json['archived'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'cin': instance.cin,
      'role': _$UserRoleEnumMap[instance.role]!,
      'sexe': _$GenderEnumMap[instance.sexe]!,
      'numeroTelephone': instance.numeroTelephone,
      'archived': instance.archived,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.medecin: 'medecin',
  UserRole.secretaire: 'secretaire',
};

const _$GenderEnumMap = {
  Gender.homme: 'homme',
  Gender.femme: 'femme',
};

_$CreateUserRequestImpl _$$CreateUserRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateUserRequestImpl(
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      mdp: json['mdp'] as String,
      cin: (json['cin'] as num).toInt(),
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      sexe: $enumDecode(_$GenderEnumMap, json['sexe']),
      numeroTelephone: json['numeroTelephone'] as String?,
      archived: json['archived'] as bool? ?? false,
    );

Map<String, dynamic> _$$CreateUserRequestImplToJson(
        _$CreateUserRequestImpl instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'prenom': instance.prenom,
      'mdp': instance.mdp,
      'cin': instance.cin,
      'role': _$UserRoleEnumMap[instance.role]!,
      'sexe': _$GenderEnumMap[instance.sexe]!,
      'numeroTelephone': instance.numeroTelephone,
      'archived': instance.archived,
    };

_$UpdateUserRequestImpl _$$UpdateUserRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateUserRequestImpl(
      nom: json['nom'] as String?,
      prenom: json['prenom'] as String?,
      mdp: json['mdp'] as String?,
      cin: (json['cin'] as num?)?.toInt(),
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
      sexe: $enumDecodeNullable(_$GenderEnumMap, json['sexe']),
      numeroTelephone: json['numeroTelephone'] as String?,
      archived: json['archived'] as bool?,
    );

Map<String, dynamic> _$$UpdateUserRequestImplToJson(
        _$UpdateUserRequestImpl instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'prenom': instance.prenom,
      'mdp': instance.mdp,
      'cin': instance.cin,
      'role': _$UserRoleEnumMap[instance.role],
      'sexe': _$GenderEnumMap[instance.sexe],
      'numeroTelephone': instance.numeroTelephone,
      'archived': instance.archived,
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      cin: (json['cin'] as num).toInt(),
      mdp: json['mdp'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'cin': instance.cin,
      'mdp': instance.mdp,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'refreshToken': instance.refreshToken,
    };

_$TokenValidationRequestImpl _$$TokenValidationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenValidationRequestImpl(
      token: json['token'] as String,
    );

Map<String, dynamic> _$$TokenValidationRequestImplToJson(
        _$TokenValidationRequestImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

_$TokenValidationResponseImpl _$$TokenValidationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenValidationResponseImpl(
      status: json['status'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TokenValidationResponseImplToJson(
        _$TokenValidationResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'user': instance.user,
    };
