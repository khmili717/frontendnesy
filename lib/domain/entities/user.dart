import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum UserRole {
  @JsonValue('admin')
  admin,
  @JsonValue('medecin')
  medecin,
  @JsonValue('secretaire')
  secretaire,
}

enum Gender {
  @JsonValue('homme')
  homme,
  @JsonValue('femme')
  femme,
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    required String nom,
    required String prenom,
    required int cin,
    required UserRole role,
    required Gender sexe,
    String? numeroTelephone,
    @Default(false) bool archived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class CreateUserRequest with _$CreateUserRequest {
  const factory CreateUserRequest({
    required String nom,
    required String prenom,
    required String mdp,
    required int cin,
    required UserRole role,
    required Gender sexe,
    String? numeroTelephone,
    @Default(false) bool archived,
  }) = _CreateUserRequest;

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) => 
      _$CreateUserRequestFromJson(json);
}

@freezed
class UpdateUserRequest with _$UpdateUserRequest {
  const factory UpdateUserRequest({
    String? nom,
    String? prenom,
    String? mdp,
    int? cin,
    UserRole? role,
    Gender? sexe,
    String? numeroTelephone,
    bool? archived,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) => 
      _$UpdateUserRequestFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required int cin,
    required String mdp,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => 
      _$LoginRequestFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String token,
    required User user,
    String? refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => 
      _$LoginResponseFromJson(json);
}

@freezed
class TokenValidationRequest with _$TokenValidationRequest {
  const factory TokenValidationRequest({
    required String token,
  }) = _TokenValidationRequest;

  factory TokenValidationRequest.fromJson(Map<String, dynamic> json) => 
      _$TokenValidationRequestFromJson(json);
}

@freezed
class TokenValidationResponse with _$TokenValidationResponse {
  const factory TokenValidationResponse({
    required String status,
    required User user,
  }) = _TokenValidationResponse;

  factory TokenValidationResponse.fromJson(Map<String, dynamic> json) => 
      _$TokenValidationResponseFromJson(json);
} 