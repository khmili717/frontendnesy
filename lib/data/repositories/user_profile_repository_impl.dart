import 'package:flutter/foundation.dart';
import 'package:foresight_care/domain/entities/user.dart' as domain;
import 'package:foresight_care/domain/repositories/user_profile_repository.dart';
import 'package:foresight_care/core/network/api_client.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final ApiClient _apiClient;

  UserProfileRepositoryImpl(this._apiClient);

  @override
  Future<domain.User> getCurrentUser(String userId) async {
    try {
      debugPrint('🚀 [USER_PROFILE_REPO] Fetching current user profile for ID: $userId');
      
      final user = await _apiClient.getUserById(userId);
      debugPrint('✅ [USER_PROFILE_REPO] Successfully fetched user profile: ${user.nom} ${user.prenom}');
      
      return user;
    } catch (e, stackTrace) {
      debugPrint('❌ [USER_PROFILE_REPO] Error fetching user profile: $e');
      debugPrint('📍 [USER_PROFILE_REPO] Stack trace: $stackTrace');
      
      // Provide user-friendly error messages
      String errorMessage = 'Failed to fetch user profile';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expired. Please log in again.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Access denied. You do not have permission to view this profile.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'User not found.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Network error. Please check your internet connection.';
      }
      
      throw Exception(errorMessage);
    }
  }

  @override
  Future<domain.User> updateUserProfile(String userId, domain.UpdateUserRequest request) async {
    try {
      debugPrint('🚀 [USER_PROFILE_REPO] Updating user profile for ID: $userId');
      debugPrint('📝 [USER_PROFILE_REPO] Update data: ${request.toString()}');
      
      // Convert domain UpdateUserRequest to API UpdateUserRequest
      final apiRequest = UpdateUserRequest(
        nom: request.nom,
        prenom: request.prenom,
        mdp: request.mdp,
        cin: request.cin,
        role: request.role?.name,
        sexe: request.sexe?.name,
        numeroTelephone: request.numeroTelephone,
        archived: request.archived,
      );
      
      final updatedUser = await _apiClient.updateUser(userId, apiRequest);
      debugPrint('✅ [USER_PROFILE_REPO] Successfully updated user profile: ${updatedUser.nom} ${updatedUser.prenom}');
      
      return updatedUser;
    } catch (e, stackTrace) {
      debugPrint('❌ [USER_PROFILE_REPO] Error updating user profile: $e');
      debugPrint('📍 [USER_PROFILE_REPO] Stack trace: $stackTrace');
      
      // Provide user-friendly error messages
      String errorMessage = 'Failed to update user profile';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Session expired. Please log in again.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Access denied. You can only update your own profile.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'User not found.';
      } else if (e.toString().contains('409')) {
        errorMessage = 'CIN already exists. Please use a different CIN.';
      } else if (e.toString().contains('400')) {
        errorMessage = 'Invalid data provided. Please check your inputs.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Network error. Please check your internet connection.';
      }
      
      throw Exception(errorMessage);
    }
  }
} 