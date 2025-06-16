import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/domain/entities/patient.dart';
import 'package:foresight_care/domain/usecases/pending_deletions_usecase.dart';
import 'package:foresight_care/data/repositories/pending_deletions_repository_impl.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;

// Pending Deletions State
class PendingDeletionsState {
  final List<Patient> pendingDeletions;
  final bool isLoading;
  final String? error;
  final bool isRefreshing;

  const PendingDeletionsState({
    this.pendingDeletions = const [],
    this.isLoading = false,
    this.error,
    this.isRefreshing = false,
  });

  PendingDeletionsState copyWith({
    List<Patient>? pendingDeletions,
    bool? isLoading,
    String? error,
    bool? isRefreshing,
  }) {
    return PendingDeletionsState(
      pendingDeletions: pendingDeletions ?? this.pendingDeletions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

// Pending Deletions Provider
class PendingDeletionsNotifier extends StateNotifier<PendingDeletionsState> {
  final GetPendingDeletionsUseCase _getPendingDeletionsUseCase;
  final CancelDeletionUseCase _cancelDeletionUseCase;
  final ConfirmDeletionUseCase _confirmDeletionUseCase;

  PendingDeletionsNotifier(
    this._getPendingDeletionsUseCase,
    this._cancelDeletionUseCase,
    this._confirmDeletionUseCase,
  ) : super(const PendingDeletionsState()) {
    fetchPendingDeletions();
  }

  Future<void> fetchPendingDeletions() async {
    debugPrint('[PENDING_DELETIONS] 🔔 Fetching pending deletions...');
    state = state.copyWith(isLoading: true, error: null);

    try {
      final pendingDeletions = await _getPendingDeletionsUseCase();
      debugPrint('[PENDING_DELETIONS] ✅ Received ${pendingDeletions.length} pending deletions');

      state = state.copyWith(
        pendingDeletions: pendingDeletions,
        isLoading: false,
      );
    } catch (e) {
      debugPrint('[PENDING_DELETIONS] ❌ Error fetching pending deletions: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<bool> cancelDeletion(String patientId) async {
    debugPrint('[PENDING_DELETIONS] 🚫 Canceling deletion for patient: $patientId');
    
    try {
      await _cancelDeletionUseCase(patientId);
      debugPrint('[PENDING_DELETIONS] ✅ Successfully canceled deletion for patient: $patientId');
      
      // Remove the patient from the list
      final updatedList = state.pendingDeletions
          .where((patient) => patient.id != patientId)
          .toList();
      
      state = state.copyWith(
        pendingDeletions: updatedList,
        error: null,
      );
      
      return true;
    } catch (e) {
      debugPrint('[PENDING_DELETIONS] ❌ Error canceling deletion: $e');
      state = state.copyWith(
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  Future<void> refreshPendingDeletions() async {
    debugPrint('[PENDING_DELETIONS] 🔄 Refreshing pending deletions...');
    state = state.copyWith(isRefreshing: true, error: null);

    try {
      final pendingDeletions = await _getPendingDeletionsUseCase();
      debugPrint('[PENDING_DELETIONS] ✅ Refreshed ${pendingDeletions.length} pending deletions');

      state = state.copyWith(
        pendingDeletions: pendingDeletions,
        isRefreshing: false,
      );
    } catch (e) {
      debugPrint('[PENDING_DELETIONS] ❌ Error refreshing pending deletions: $e');
      state = state.copyWith(
        isRefreshing: false,
        error: e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  Future<bool> confirmDeletion(String patientId) async {
    debugPrint('[PENDING_DELETIONS] ✅ Confirming deletion for patient: $patientId');
    
    try {
      await _confirmDeletionUseCase(patientId);
      debugPrint('[PENDING_DELETIONS] ✅ Successfully confirmed deletion for patient: $patientId');
      
      // Remove the patient from the list
      final updatedList = state.pendingDeletions
          .where((patient) => patient.id != patientId)
          .toList();
      
      state = state.copyWith(
        pendingDeletions: updatedList,
        error: null,
      );
      
      return true;
    } catch (e) {
      debugPrint('[PENDING_DELETIONS] ❌ Error confirming deletion: $e');
      state = state.copyWith(
        error: e.toString().replaceFirst('Exception: ', ''),
      );
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Repository provider
final pendingDeletionsRepositoryProvider = Provider<PendingDeletionsRepositoryImpl>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return PendingDeletionsRepositoryImpl(apiClient);
});

// Use cases providers
final getPendingDeletionsUseCaseProvider = Provider<GetPendingDeletionsUseCase>((ref) {
  final repository = ref.watch(pendingDeletionsRepositoryProvider);
  return GetPendingDeletionsUseCase(repository);
});

final cancelDeletionUseCaseProvider = Provider<CancelDeletionUseCase>((ref) {
  final repository = ref.watch(pendingDeletionsRepositoryProvider);
  return CancelDeletionUseCase(repository);
});

final confirmDeletionUseCaseProvider = Provider<ConfirmDeletionUseCase>((ref) {
  final repository = ref.watch(pendingDeletionsRepositoryProvider);
  return ConfirmDeletionUseCase(repository);
});

// Main provider instance
final pendingDeletionsProvider = StateNotifierProvider<PendingDeletionsNotifier, PendingDeletionsState>((ref) {
  final getPendingDeletionsUseCase = ref.watch(getPendingDeletionsUseCaseProvider);
  final cancelDeletionUseCase = ref.watch(cancelDeletionUseCaseProvider);
  final confirmDeletionUseCase = ref.watch(confirmDeletionUseCaseProvider);
  return PendingDeletionsNotifier(getPendingDeletionsUseCase, cancelDeletionUseCase, confirmDeletionUseCase);
});

// Helper providers
final pendingDeletionsCountProvider = Provider<int>((ref) {
  return ref.watch(pendingDeletionsProvider).pendingDeletions.length;
});

final pendingDeletionsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(pendingDeletionsProvider).isLoading;
});

final hasPendingDeletionsProvider = Provider<bool>((ref) {
  return ref.watch(pendingDeletionsProvider).pendingDeletions.isNotEmpty;
}); 