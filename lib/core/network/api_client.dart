import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:foresight_care/domain/entities/user.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/domain/entities/appointment.dart';
import 'dart:convert';

part 'api_client.g.dart';

// Request/Response classes
class LoginRequest {
  final int cin;
  final String mdp;

  LoginRequest({required this.cin, required this.mdp});

  Map<String, dynamic> toJson() => {
    'cin': cin,
    'mdp': mdp,
  };
}

class LoginResponse {
  final String accessToken;
  final User user;

  LoginResponse({required this.accessToken, required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    print('[LOGIN_RESPONSE] Parsing backend response...');
    print('[LOGIN_RESPONSE] Raw response: $json');
    
    // Handle the actual backend response format
    final token = json['token'] as String? ?? '';
    print('[LOGIN_RESPONSE] Extracted token: ${token.isNotEmpty ? '${token.substring(0, 20)}...' : 'EMPTY'}');
    
    // Decode user info from JWT token
    Map<String, dynamic> userInfo = {};
    try {
      if (token.isNotEmpty) {
        final parts = token.split('.');
        if (parts.length == 3) {
          final payload = parts[1];
          // Add padding if needed
          final normalizedPayload = payload.padRight((payload.length + 3) ~/ 4 * 4, '=');
          final decoded = utf8.decode(base64Url.decode(normalizedPayload));
          userInfo = jsonDecode(decoded);
          print('[LOGIN_RESPONSE] JWT payload decoded: $userInfo');
        }
      }
    } catch (e) {
      print('[JWT] Error decoding token: $e');
    }
    
    // Create user from JWT payload and response data
    final user = User(
      id: userInfo['id'] as String?,
      nom: userInfo['nom'] as String? ?? '',
      prenom: userInfo['prenom'] as String? ?? '',
      cin: userInfo['cin'] as int? ?? 88888888,
      role: _parseUserRole(json['role'] as String? ?? userInfo['role'] as String?),
      sexe: _parseGender(userInfo['sexe'] as String?),
      numeroTelephone: userInfo['numeroTelephone'] as String?,
      archived: json['archived'] as bool? ?? false,
    );

    print('[LOGIN_RESPONSE] Created user: ${user.nom} ${user.prenom} (${user.role})');

    return LoginResponse(
      accessToken: token,
      user: user,
    );
  }

  static UserRole _parseUserRole(String? role) {
    switch (role?.toLowerCase()) {
      case 'admin':
        return UserRole.admin;
      case 'medecin':
        return UserRole.medecin;
      case 'secretaire':
        return UserRole.secretaire;
      default:
        return UserRole.admin;
    }
  }

  static Gender _parseGender(String? sexe) {
    switch (sexe?.toLowerCase()) {
      case 'masculin':
        return Gender.homme;
      case 'feminin':
        return Gender.femme;
      default:
        return Gender.homme;
    }
  }
}

class TokenValidationRequest {
  final String token;

  TokenValidationRequest({required this.token});

  Map<String, dynamic> toJson() => {'token': token};
}

class TokenValidationResponse {
  final String status;
  final User? user;

  TokenValidationResponse({required this.status, this.user});

  factory TokenValidationResponse.fromJson(Map<String, dynamic> json) => TokenValidationResponse(
    status: json['status'] ?? '',
    user: json['user'] != null ? User.fromJson(json['user']) : null,
  );
}

class CreateUserRequest {
  final String nom;
  final String prenom;
  final String mdp;
  final int cin;
  final String role;
  final String sexe;
  final String? numeroTelephone;
  final bool archived;

  CreateUserRequest({
    required this.nom,
    required this.prenom,
    required this.mdp,
    required this.cin,
    required this.role,
    required this.sexe,
    this.numeroTelephone,
    this.archived = false,
  });

  Map<String, dynamic> toJson() => {
    'nom': nom,
    'prenom': prenom,
    'mdp': mdp,
    'cin': cin,
    'role': role,
    'sexe': sexe,
    if (numeroTelephone != null) 'numero_telephone': numeroTelephone,
    'archived': archived,
  };
}

class UpdateUserRequest {
  final String? nom;
  final String? prenom;
  final String? mdp;
  final int? cin;
  final String? role;
  final String? sexe;
  final String? numeroTelephone;
  final bool? archived;

  UpdateUserRequest({
    this.nom,
    this.prenom,
    this.mdp,
    this.cin,
    this.role,
    this.sexe,
    this.numeroTelephone,
    this.archived,
  });

  Map<String, dynamic> toJson() => {
    if (nom != null) 'nom': nom,
    if (prenom != null) 'prenom': prenom,
    if (mdp != null) 'mdp': mdp,
    if (cin != null) 'cin': cin,
    if (role != null) 'role': role,
    if (sexe != null) 'sexe': sexe,
    if (numeroTelephone != null) 'numero_telephone': numeroTelephone,
    if (archived != null) 'archived': archived,
  };
}

class CreatePatientRequest {
  final Map<String, dynamic> data;

  CreatePatientRequest(this.data);

  Map<String, dynamic> toJson() => data;
}

class UpdatePatientRequest {
  final Map<String, dynamic> data;

  UpdatePatientRequest(this.data);

  Map<String, dynamic> toJson() => data;
}

class RequestPatientDeletionRequest {
  final String reason;

  RequestPatientDeletionRequest({required this.reason});

  Map<String, dynamic> toJson() => {'reason': reason};
}

class CreateAppointmentApiRequest {
  final String idMed;
  final String idNumDossier;
  final String date;
  final String heure;
  final String? status;

  CreateAppointmentApiRequest({
    required this.idMed,
    required this.idNumDossier,
    required this.date,
    required this.heure,
    this.status,
  });

  Map<String, dynamic> toJson() => {
    'id_med': idMed,
    'id_num_dossier': idNumDossier,
    'date': date,
    'heure': heure,
    if (status != null) 'status': status,
  };
}

class UpdateAppointmentApiRequest {
  final String? idMed;
  final String? idNumDossier;
  final String? date;
  final String? heure;
  final String? status;

  UpdateAppointmentApiRequest({
    this.idMed,
    this.idNumDossier,
    this.date,
    this.heure,
    this.status,
  });

  Map<String, dynamic> toJson() => {
    if (idMed != null) 'id_med': idMed,
    if (idNumDossier != null) 'id_num_dossier': idNumDossier,
    if (date != null) 'date': date,
    if (heure != null) 'heure': heure,
    if (status != null) 'status': status,
  };
}

class CreateConsultationFromAppointmentApiRequest {
  final String appointmentId;
  final Map<String, dynamic> consultationData;

  CreateConsultationFromAppointmentApiRequest({
    required this.appointmentId,
    required this.consultationData,
  });

  Map<String, dynamic> toJson() => {
    'appointmentId': appointmentId,
    'consultationData': consultationData,
  };
}

// 🛸 ALIEN UPDATE CONSULTATION REQUEST
class UpdateConsultationApiRequest {
  final Map<String, dynamic> consultationData;

  UpdateConsultationApiRequest({
    required this.consultationData,
  });

  Map<String, dynamic> toJson() => consultationData;
}

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Auth Endpoints
  @POST('/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST('/auth/logout')
  Future<void> logout();

  // User Endpoints
  @GET('/users')
  Future<List<User>> getUsers();

  @POST('/users')
  Future<User> createUser(@Body() CreateUserRequest request);

  @GET('/users/{id}')
  Future<User> getUserById(@Path('id') String id);

  @PUT('/users/{id}')
  Future<User> updateUser(@Path('id') String id, @Body() UpdateUserRequest request);

  @DELETE('/users/{id}')
  Future<void> deleteUser(@Path('id') String id);

  @PUT('/users/{id}/archive')
  Future<void> archiveUser(@Path('id') String id);

  @PUT('/users/{id}/unarchive')
  Future<void> unarchiveUser(@Path('id') String id);

  @GET('/users/medecins')
  Future<List<User>> getDoctors();

  @GET('/users/secretaires')
  Future<List<User>> getSecretaries();

  // Patient Endpoints
  @GET('/patients')
  Future<List<Patient>> getPatients();

  @POST('/patients')
  Future<Patient> createPatient(@Body() CreatePatientRequest request);

  @GET('/patients/byid/{id}')
  Future<Patient> getPatientById(@Path('id') String id);

  @PUT('/patients/{id}')
  Future<Patient> updatePatient(@Path('id') String id, @Body() UpdatePatientRequest request);

  @DELETE('/patients/{id}')
  Future<void> deletePatient(@Path('id') String id);

  @POST('/patients/{id}/request-deletion')
  Future<void> requestPatientDeletion(@Path('id') String id, @Body() RequestPatientDeletionRequest request);

  // Pending deletions endpoints
  @GET('/patients/pending-deletions')
  Future<List<Patient>> getPendingDeletions();

  @PATCH('/patients/{id}/cancel-deletion')
  Future<void> cancelPatientDeletion(@Path('id') String id);

  // Appointment Endpoints
  @GET('/rendez-vous')
  Future<List<Appointment>> getAppointments();

  @POST('/rendez-vous')
  Future<CreateAppointmentResponse> createAppointment(@Body() CreateAppointmentApiRequest request);

  @GET('/rendez-vous/{id}')
  Future<Appointment> getAppointmentById(@Path('id') String id);

  @PUT('/rendez-vous/{id}')
  Future<Appointment> updateAppointment(@Path('id') String id, @Body() UpdateAppointmentApiRequest request);

  @DELETE('/rendez-vous/{id}')
  Future<void> deleteAppointment(@Path('id') String id);

  @PUT('/rendez-vous/{id}/status')
  Future<Appointment> updateAppointmentStatus(@Path('id') String id, @Body() Map<String, dynamic> statusUpdate);

  // Patient Appointments Endpoint - KNOWN ISSUE: Backend API Inconsistency
  // This endpoint returns id_num_dossier as STRING instead of PatientInfo OBJECT
  // Unlike /rendez-vous which returns full PatientInfo object
  // Use with caution - prefer filtering /rendez-vous for consistent data structure
  @GET('/rendez-vous/patient/{id}')
  Future<List<Appointment>> getPatientAppointments(@Path('id') String patientId);

  // Doctor-specific Endpoints
  @GET('/rendez-vous/my-appointments')
  Future<List<DoctorAppointment>> getMyAppointments();

  @GET('/consultations/my-consultations')
  Future<HttpResponse<dynamic>> getMyConsultations();

  @POST('/consultations/from-appointment')
  Future<HttpResponse<dynamic>> createConsultationFromAppointment(@Body() CreateConsultationFromAppointmentApiRequest request);

  // 🛸 ALIEN UPDATE CONSULTATION ENDPOINT
  @PUT('/consultations/{id}')
  Future<HttpResponse<dynamic>> updateConsultation(
    @Path('id') String consultationId,
    @Body() UpdateConsultationApiRequest request,
  );

  // Patient Details Endpoints
  @GET('/patients/byid/{id}')
  Future<HttpResponse<dynamic>> getPatientDetails(@Path('id') String id);

  @GET('/consultations/patient/{patientId}')
  Future<HttpResponse<dynamic>> getPatientConsultations(@Path('patientId') String patientId);

  @GET('/rendez-vous/patient/{id}')
  Future<HttpResponse<dynamic>> getPatientAppointmentsList(@Path('id') String id);

  // Notification endpoints
} 