import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;

/// State class for Add User functionality
class AddUserState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const AddUserState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  AddUserState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return AddUserState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

/// Notifier for Add User functionality
class AddUserNotifier extends StateNotifier<AddUserState> {
  final api.ApiClient _apiClient;

  AddUserNotifier(this._apiClient) : super(const AddUserState());

  /// Creates a new user via API
  Future<bool> createUser(Map<String, dynamic> userData) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);

    try {
      // Create the user request
      final request = api.CreateUserRequest(
        nom: userData['nom'] as String,
        prenom: userData['prenom'] as String,
        mdp: userData['mdp'] as String,
        cin: userData['cin'] as int,
        role: userData['role'] as String,
        sexe: userData['sexe'] as String,
        numeroTelephone: userData['numero_telephone'] as String?,
        archived: userData['archived'] as bool? ?? false,
      );

      // Make API call
      await _apiClient.createUser(request);

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
      );

      return true;
    } catch (e) {
      String errorMessage = 'Erreur lors de la création de l\'utilisateur';
      
      if (e.toString().contains('400')) {
        errorMessage = 'Données invalides. Veuillez vérifier les informations saisies.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Accès refusé. Vous n\'avez pas les permissions nécessaires.';
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

      print('[ADD_USER] Error creating user: $e');
      return false;
    }
  }

  /// Clears the error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Resets the state
  void reset() {
    state = const AddUserState();
  }
}

/// Provider for Add User functionality
final addUserProvider = StateNotifierProvider<AddUserNotifier, AddUserState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return AddUserNotifier(apiClient);
}); 