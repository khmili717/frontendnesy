import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;

/// State class for Archive User functionality
class ArchiveUserState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const ArchiveUserState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  ArchiveUserState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return ArchiveUserState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

/// Notifier for Archive User functionality
class ArchiveUserNotifier extends StateNotifier<ArchiveUserState> {
  final api.ApiClient _apiClient;

  ArchiveUserNotifier(this._apiClient) : super(const ArchiveUserState());

  /// Archives a user via API
  Future<bool> archiveUser(String userId) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);

    try {
      await _apiClient.archiveUser(userId);

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
      );

      return true;
    } catch (e) {
      String errorMessage = 'Erreur lors de l\'archivage de l\'utilisateur';
      
      if (e.toString().contains('403')) {
        errorMessage = 'Accès refusé. Vous n\'avez pas les permissions nécessaires.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Utilisateur non trouvé.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion réseau. Veuillez vérifier votre connexion internet.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Délai d\'attente dépassé. Veuillez réessayer.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );

      print('[ARCHIVE_USER] Error archiving user: $e');
      return false;
    }
  }

  /// Unarchives a user via API
  Future<bool> unarchiveUser(String userId) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: false);

    try {
      await _apiClient.unarchiveUser(userId);

      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
      );

      return true;
    } catch (e) {
      String errorMessage = 'Erreur lors de la restauration de l\'utilisateur';
      
      if (e.toString().contains('403')) {
        errorMessage = 'Accès refusé. Vous n\'avez pas les permissions nécessaires.';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Utilisateur non trouvé.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Erreur de connexion réseau. Veuillez vérifier votre connexion internet.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Délai d\'attente dépassé. Veuillez réessayer.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );

      print('[ARCHIVE_USER] Error unarchiving user: $e');
      return false;
    }
  }

  /// Clears the error state
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Resets the state
  void reset() {
    state = const ArchiveUserState();
  }
}

/// Provider for Archive User functionality
final archiveUserProvider = StateNotifierProvider<ArchiveUserNotifier, ArchiveUserState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return ArchiveUserNotifier(apiClient);
}); 