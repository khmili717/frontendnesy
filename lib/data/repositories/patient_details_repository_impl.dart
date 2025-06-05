import 'package:flutter/foundation.dart';
import 'package:foresight_care/domain/entities/patient_details.dart';
import 'package:foresight_care/domain/repositories/patient_details_repository.dart';
import 'package:foresight_care/core/network/api_client.dart';
import 'package:foresight_care/data/models/patient_details_dto.dart';
import 'package:foresight_care/data/mappers/patient_details_mapper.dart';

class PatientDetailsRepositoryImpl implements PatientDetailsRepository {
  final ApiClient _apiClient;

  PatientDetailsRepositoryImpl(this._apiClient);

  @override
  Future<PatientDetails> getPatientDetails(String patientId) async {
    try {
      debugPrint('🚀 [REPO] Fetching patient details for ID: $patientId');
      
      final response = await _apiClient.getPatientDetails(patientId);
      debugPrint('✅ [REPO] Raw response received: ${response.data}');
      
      if (response.data == null) {
        throw Exception('No data received from server');
      }

      final rawData = response.data as Map<String, dynamic>;
      debugPrint('📋 [REPO] Parsed raw data keys: ${rawData.keys.toList()}');
      
      final dto = PatientDetailsDto.fromJson(rawData);
      debugPrint('🔄 [REPO] DTO created successfully: ${dto.nomPatient} ${dto.prenPatient}');
      
      final entity = PatientDetailsMapper.fromDto(dto);
      debugPrint('✨ [REPO] Entity mapped successfully: ${entity.fullName}');
      
      return entity;
    } catch (e, stackTrace) {
      debugPrint('❌ [REPO] Error fetching patient details: $e');
      debugPrint('📍 [REPO] Stack trace: $stackTrace');
      
      // Provide a more user-friendly error message
      if (e.toString().contains('type') && e.toString().contains('cast')) {
        throw Exception('Data format error: The server returned data in an unexpected format. Please contact support.');
      }
      
      throw Exception('Failed to fetch patient details: $e');
    }
  }

  @override
  Future<List<PatientAppointment>> getPatientAppointments(String patientId) async {
    try {
      debugPrint('🚀 [REPO] Fetching patient appointments for ID: $patientId');
      
      final response = await _apiClient.getPatientAppointmentsList(patientId);
      debugPrint('✅ [REPO] Appointments response received');
      
      if (response.data == null) {
        debugPrint('⚠️ [REPO] No appointment data received, returning empty list');
        return [];
      }

      final List<dynamic> data = response.data as List<dynamic>;
      debugPrint('📋 [REPO] Processing ${data.length} appointments');
      
      final appointments = <PatientAppointment>[];
      
      for (int i = 0; i < data.length; i++) {
        try {
          final appointmentJson = data[i] as Map<String, dynamic>;
          debugPrint('🔄 [REPO] Processing appointment $i: ${appointmentJson['rdv_id']}');
          
          final dto = PatientAppointmentDto.fromJson(appointmentJson);
          final appointment = PatientAppointmentMapper.fromDto(dto);
          appointments.add(appointment);
          
          debugPrint('✨ [REPO] Appointment $i processed successfully');
        } catch (e) {
          debugPrint('⚠️ [REPO] Failed to process appointment $i: $e');
          // Continue with other appointments instead of failing completely
          continue;
        }
      }
      
      debugPrint('🎉 [REPO] Successfully processed ${appointments.length} appointments');
      return appointments;
    } catch (e, stackTrace) {
      debugPrint('❌ [REPO] Error fetching patient appointments: $e');
      debugPrint('📍 [REPO] Stack trace: $stackTrace');
      throw Exception('Failed to fetch patient appointments: $e');
    }
  }

  @override
  Future<List<PatientConsultation>> getPatientConsultations(String patientId) async {
    try {
      debugPrint('🚀 [REPO] Fetching patient consultations for ID: $patientId');
      
      final response = await _apiClient.getPatientConsultations(patientId);
      debugPrint('✅ [REPO] Consultations response received');
      
      if (response.data == null) {
        debugPrint('⚠️ [REPO] No consultation data received, returning empty list');
        return [];
      }

      final List<dynamic> data = response.data as List<dynamic>;
      debugPrint('📋 [REPO] Processing ${data.length} consultations');
      
      final consultations = <PatientConsultation>[];
      
      for (int i = 0; i < data.length; i++) {
        try {
          final consultationJson = data[i] as Map<String, dynamic>;
          debugPrint('🔄 [REPO] Processing consultation $i: ${consultationJson['num_consult']}');
          
          final dto = PatientConsultationDto.fromJson(consultationJson);
          final consultation = PatientConsultationMapper.fromDto(dto);
          consultations.add(consultation);
          
          debugPrint('✨ [REPO] Consultation $i processed successfully');
        } catch (e) {
          debugPrint('⚠️ [REPO] Failed to process consultation $i: $e');
          // Continue with other consultations instead of failing completely
          continue;
        }
      }
      
      debugPrint('🎉 [REPO] Successfully processed ${consultations.length} consultations');
      return consultations;
    } catch (e, stackTrace) {
      debugPrint('❌ [REPO] Error fetching patient consultations: $e');
      debugPrint('📍 [REPO] Stack trace: $stackTrace');
      throw Exception('Failed to fetch patient consultations: $e');
    }
  }
} 