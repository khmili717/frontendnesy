import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/domain/entities/user.dart';
import 'package:foresight_care/domain/usecases/user_profile_usecase.dart';
import 'package:foresight_care/data/repositories/user_profile_repository_impl.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;

// User Profile State
class UserProfileState {
  final User? user;
  final bool isLoading;
  final bool isUpdating;
  final String? error;
  final bool hasChanges;

  const UserProfileState({
    this.user,
    this.isLoading = false,
    this.isUpdating = false,
    this.error,
    this.hasChanges = false,
  });

  UserProfileState copyWith({
    User? user,
    bool? isLoading,
    bool? isUpdating,
    String? error,
    bool? hasChanges,
  }) {
    return UserProfileState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      error: error,
      hasChanges: hasChanges ?? this.hasChanges,
    );
  }
}

// User Profile Form Data
class UserProfileFormData {
  final String nom;
  final String prenom;
  final String? mdp;
  final int cin;
  final Gender sexe;
  final String? numeroTelephone;

  const UserProfileFormData({
    required this.nom,
    required this.prenom,
    this.mdp,
    required this.cin,
    required this.sexe,
    this.numeroTelephone,
  });

  UserProfileFormData copyWith({
    String? nom,
    String? prenom,
    String? mdp,
    int? cin,
    Gender? sexe,
    String? numeroTelephone,
  }) {
    return UserProfileFormData(
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      mdp: mdp ?? this.mdp,
      cin: cin ?? this.cin,
      sexe: sexe ?? this.sexe,
      numeroTelephone: numeroTelephone ?? this.numeroTelephone,
    );
  }

  UpdateUserRequest toUpdateRequest() {
    return UpdateUserRequest(
      nom: nom,
      prenom: prenom,
      mdp: mdp?.isNotEmpty == true ? mdp : null,
      cin: cin,
      sexe: sexe,
      numeroTelephone: numeroTelephone?.isNotEmpty == true ? numeroTelephone : null,
    );
  }
}

// User Profile Notifier
class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final UpdateUserProfileUseCase _updateUserProfileUseCase;
  UserProfileFormData? _originalData;
  UserProfileFormData? _formData;

  UserProfileNotifier(
    this._getCurrentUserUseCase,
    this._updateUserProfileUseCase,
  ) : super(const UserProfileState());

  UserProfileFormData? get formData => _formData;
  
  Future<void> loadUserProfile(String userId) async {
    debugPrint('[USER_PROFILE] 👤 Loading user profile for ID: $userId');
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _getCurrentUserUseCase(userId);
      debugPrint('[USER_PROFILE] ✅ Successfully loaded user profile: ${user.nom} ${user.prenom}');

      _originalData = UserProfileFormData(
        nom: user.nom,
        prenom: user.prenom,
        mdp: null, // Never load password
        cin: user.cin,
        sexe: user.sexe,
        numeroTelephone: user.numeroTelephone,
      );

      _formData = _originalData;

      state = state.copyWith(
        user: user,
        isLoading: false,
        hasChanges: false,
      );
    } catch (e) {
      debugPrint('[USER_PROFILE] ❌ Error loading user profile: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  void updateFormField({
    String? nom,
    String? prenom,
    String? mdp,
    int? cin,
    Gender? sexe,
    String? numeroTelephone,
  }) {
    if (_formData == null) return;

    _formData = _formData!.copyWith(
      nom: nom,
      prenom: prenom,
      mdp: mdp,
      cin: cin,
      sexe: sexe,
      numeroTelephone: numeroTelephone,
    );

    // Check if there are changes
    final hasChanges = _hasFormChanges();
    
    state = state.copyWith(
      hasChanges: hasChanges,
      error: null,
    );
  }

  bool _hasFormChanges() {
    if (_originalData == null || _formData == null) return false;

    return _originalData!.nom != _formData!.nom ||
           _originalData!.prenom != _formData!.prenom ||
           (_formData!.mdp?.isNotEmpty == true) || // Password is considered a change if provided
           _originalData!.cin != _formData!.cin ||
           _originalData!.sexe != _formData!.sexe ||
           _originalData!.numeroTelephone != _formData!.numeroTelephone;
  }

  String? validateField(String fieldName, String? value) {
    switch (fieldName) {
      case 'nom':
        if (value == null || value.trim().isEmpty) {
          return 'Le nom est requis';
        }
        if (value.trim().length < 2) {
          return 'Le nom doit contenir au moins 2 caractères';
        }
        break;
      case 'prenom':
        if (value == null || value.trim().isEmpty) {
          return 'Le prénom est requis';
        }
        if (value.trim().length < 2) {
          return 'Le prénom doit contenir au moins 2 caractères';
        }
        break;
      case 'mdp':
        if (value != null && value.isNotEmpty && value.length < 6) {
          return 'Le mot de passe doit contenir au moins 6 caractères';
        }
        break;
      case 'cin':
        if (value == null || value.trim().isEmpty) {
          return 'Le CIN est requis';
        }
        if (value.length != 8) {
          return 'Le CIN doit comporter exactement 8 chiffres';
        }
        final cinInt = int.tryParse(value);
        if (cinInt == null || cinInt <= 0) {
          return 'Le CIN doit contenir uniquement des chiffres';
        }
        break;
      case 'numeroTelephone':
        if (value != null && value.isNotEmpty) {
          final phoneRegex = RegExp(r'^[0-9]{8}$');
          if (!phoneRegex.hasMatch(value)) {
            return 'Le numéro de téléphone doit contenir exactement 8 chiffres';
          }
        }
        break;
    }
    return null;
  }

  bool isFormValid() {
    if (_formData == null) return false;

    return validateField('nom', _formData!.nom) == null &&
           validateField('prenom', _formData!.prenom) == null &&
           validateField('mdp', _formData!.mdp) == null &&
           validateField('cin', _formData!.cin.toString()) == null &&
           validateField('numeroTelephone', _formData!.numeroTelephone) == null;
  }

  Future<bool> updateProfile(String userId) async {
    if (_formData == null || !isFormValid() || !state.hasChanges) {
      return false;
    }

    debugPrint('[USER_PROFILE] 💾 Updating user profile for ID: $userId');
    state = state.copyWith(isUpdating: true, error: null);

    try {
      final updateRequest = _formData!.toUpdateRequest();
      final updatedUser = await _updateUserProfileUseCase(userId, updateRequest);
      
      debugPrint('[USER_PROFILE] ✅ Successfully updated user profile: ${updatedUser.nom} ${updatedUser.prenom}');

      // Update original data to reflect the new state
      _originalData = UserProfileFormData(
        nom: updatedUser.nom,
        prenom: updatedUser.prenom,
        mdp: null,
        cin: updatedUser.cin,
        sexe: updatedUser.sexe,
        numeroTelephone: updatedUser.numeroTelephone,
      );

      // Clear password field after successful update
      _formData = _formData!.copyWith(mdp: null);

      state = state.copyWith(
        user: updatedUser,
        isUpdating: false,
        hasChanges: false,
      );

      return true;
    } catch (e) {
      debugPrint('[USER_PROFILE] ❌ Error updating user profile: $e');
      state = state.copyWith(
        isUpdating: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void resetForm() {
    if (_originalData != null) {
      _formData = _originalData;
      state = state.copyWith(
        hasChanges: false,
        error: null,
      );
    }
  }
}

// Repository provider
final userProfileRepositoryProvider = Provider<UserProfileRepositoryImpl>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return UserProfileRepositoryImpl(apiClient);
});

// Use cases providers
final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  final repository = ref.watch(userProfileRepositoryProvider);
  return GetCurrentUserUseCase(repository);
});

final updateUserProfileUseCaseProvider = Provider<UpdateUserProfileUseCase>((ref) {
  final repository = ref.watch(userProfileRepositoryProvider);
  return UpdateUserProfileUseCase(repository);
});

// Main provider instance
final userProfileProvider = StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  final getCurrentUserUseCase = ref.watch(getCurrentUserUseCaseProvider);
  final updateUserProfileUseCase = ref.watch(updateUserProfileUseCaseProvider);
  return UserProfileNotifier(getCurrentUserUseCase, updateUserProfileUseCase);
});

// Helper providers
final userProfileLoadingProvider = Provider<bool>((ref) {
  return ref.watch(userProfileProvider).isLoading;
});

final userProfileUpdatingProvider = Provider<bool>((ref) {
  return ref.watch(userProfileProvider).isUpdating;
});

final hasProfileChangesProvider = Provider<bool>((ref) {
  return ref.watch(userProfileProvider).hasChanges;
}); 