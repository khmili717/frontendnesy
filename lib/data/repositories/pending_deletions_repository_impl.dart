import 'package:flutter/foundation.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/domain/repositories/pending_deletions_repository.dart';
import 'package:foresight_care/core/network/api_client.dart';

class PendingDeletionsRepositoryImpl implements PendingDeletionsRepository {
  final ApiClient _apiClient;

  PendingDeletionsRepositoryImpl(this._apiClient);

  @override
  Future<List<Patient>> getPendingDeletions() async {
    try {
      debugPrint('🚀 [PENDING_DELETIONS_REPO] Fetching pending deletions...');
      
      final patients = await _apiClient.getPendingDeletions();
      debugPrint('✅ [PENDING_DELETIONS_REPO] Received ${patients.length} pending deletions');
      
      return patients;
    } catch (e, stackTrace) {
      debugPrint('❌ [PENDING_DELETIONS_REPO] Error fetching pending deletions: $e');
      debugPrint('📍 [PENDING_DELETIONS_REPO] Stack trace: $stackTrace');
      
      // Provide user-friendly error messages
      String errorMessage = 'Failed to fetch pending deletions';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expired. Please log in again.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Access denied. You do not have permission to view pending deletions.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Network error. Please check your internet connection.';
      }
      
      throw Exception(errorMessage);
    }
  }

  @override
  Future<void> cancelPatientDeletion(String patientId) async {
    try {
      debugPrint('🚀 [PENDING_DELETIONS_REPO] Canceling deletion for patient ID: $patientId');
      
      await _apiClient.cancelPatientDeletion(patientId);
      debugPrint('✅ [PENDING_DELETIONS_REPO] Successfully canceled deletion for patient: $patientId');
    } catch (e, stackTrace) {
      debugPrint('❌ [PENDING_DELETIONS_REPO] Error canceling deletion: $e');
      debugPrint('📍 [PENDING_DELETIONS_REPO] Stack trace: $stackTrace');
      
      // Provide user-friendly error messages
      String errorMessage = 'Failed to cancel deletion request';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expired. Please log in again.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Access denied. You do not have permission to cancel deletions.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Patient not found or deletion request does not exist.';
      } else if (e.toString().contains('409')) {
        errorMessage = 'No pending deletion request found for this patient.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Network error. Please check your internet connection.';
      }
      
      throw Exception(errorMessage);
    }
  }

  @override
  Future<void> confirmPatientDeletion(String patientId) async {
    try {
      debugPrint('🚀 [PENDING_DELETIONS_REPO] Confirming deletion for patient ID: $patientId');
      
      await _apiClient.deletePatient(patientId);
      debugPrint('✅ [PENDING_DELETIONS_REPO] Successfully confirmed deletion for patient: $patientId');
    } catch (e, stackTrace) {
      debugPrint('❌ [PENDING_DELETIONS_REPO] Error confirming deletion: $e');
      debugPrint('📍 [PENDING_DELETIONS_REPO] Stack trace: $stackTrace');
      
      // Provide user-friendly error messages
      String errorMessage = 'Failed to confirm patient deletion';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expired. Please log in again.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Access denied. You do not have permission to delete patients.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Patient not found or deletion request does not exist.';
      } else if (e.toString().contains('409')) {
        errorMessage = 'Patient does not have a pending deletion request.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Network error. Please check your internet connection.';
      }
      
      throw Exception(errorMessage);
    }
  }
} 