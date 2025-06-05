import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/user.dart';

/// State class for Update User functionality
class UpdateUserState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final User? user;

  const UpdateUserState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.user,
  });

  UpdateUserState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    User? user,
  }) {
    return UpdateUserState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
    );
  }
}

/// Notifier for Update User functionality
class UpdateUserNotifier extends StateNotifier<UpdateUserState> {
  final api.ApiClient _apiClient;

  UpdateUserNotifier(this._apiClient) : super(const UpdateUserState());

  /// Fetches user data by ID
  Future<void> fetchUser(String userId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await _apiClient.getUserById(userId);
      state = state.copyWith(
        isLoading: false,
        user: user,
      );
    } catch (e) {
      String errorMessage = 'Erreur lors de la récupération des données utilisateur';
      
      if (e.toString().contains('404')) {
        errorMessage = 'Utilisateur non trouvé.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Accès refusé. Vous n\'avez pas les permissions nécessaires.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion réseau. Veuillez vérifier votre connexion internet.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Délai d\'attente dépassé. Veuillez réessayer.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );

      print('[UPDATE_USER] Error fetching user: $e');
    }
  }

  /// Updates a user via API
  Future<bool> updateUser(String userId, Map<String, dynamic> userData) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);

    try {
      // Create the update request with only non-null values
      final request = api.UpdateUserRequest(
        nom: userData['nom'] as String?,
        prenom: userData['prenom'] as String?,
        mdp: userData['mdp'] as String?,
        cin: userData['cin'] as int?,
        role: userData['role'] as String?,
        sexe: userData['sexe'] as String?,
        numeroTelephone: userData['numero_telephone'] as String?,
        archived: userData['archived'] as bool?,
      );

      // Make API call
      final updatedUser = await _apiClient.updateUser(userId, request);

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        user: updatedUser,
      );

      return true;
    } catch (e) {
      String errorMessage = 'Erreur lors de la mise à jour de l\'utilisateur';
      
      if (e.toString().contains('400')) {
        errorMessage = 'Données invalides. Veuillez vérifier les informations saisies.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Accès refusé. Vous n\'avez pas les permissions nécessaires.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Utilisateur non trouvé.';
      } else if (e.toString().contains('409')) {
        errorMessage = 'Un utilisateur avec ce CIN existe déjà.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion réseau. Veuillez vérifier votre connexion internet.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Délai d\'attente dépassé. Veuillez réessayer.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );

      print('[UPDATE_USER] Error updating user: $e');
      return false;
    }
  }

  /// Clears the error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Resets the state
  void reset() {
    state = const UpdateUserState();
  }
}

/// Provider for Update User functionality
final updateUserProvider = StateNotifierProvider<UpdateUserNotifier, UpdateUserState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return UpdateUserNotifier(apiClient);
}); 