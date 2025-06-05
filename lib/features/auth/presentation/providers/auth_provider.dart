import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/domain/entities/user.dart';
import 'dart:convert';

// Auth State
class AuthState {
  final User? user;
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;

  const AuthState({
    this.user,
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    User? user,
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

// Auth Provider
class AuthNotifier extends StateNotifier<AuthState> {
  final api.ApiClient _apiClient;
  final FlutterSecureStorage _secureStorage;

  AuthNotifier(this._apiClient, this._secureStorage) : super(const AuthState()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    try {
      final token = await _secureStorage.read(key: AppConstants.accessTokenKey);
      final userJson = await _secureStorage.read(key: AppConstants.userDataKey);
      
      if (token != null && userJson != null) {
        final user = User.fromJson(json.decode(userJson));
        state = state.copyWith(
          user: user,
          isAuthenticated: true,
        );
      }
    } catch (e) {
      print('[AUTH] Error checking auth status: $e');
      await logout();
    }
  }

  Future<bool> login(int cin, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final request = api.LoginRequest(cin: cin, mdp: password);
      final response = await _apiClient.login(request);

      print('[AUTH] Login response received');
      print('[AUTH] Access token: ${response.accessToken.isNotEmpty ? '${response.accessToken.substring(0, 20)}...' : 'EMPTY'}');
      print('[AUTH] User role: ${response.user.role}');

      // Store tokens and user data
      await _secureStorage.write(
        key: AppConstants.accessTokenKey,
        value: response.accessToken,
      );
      
      print('[AUTH] Token stored with key: ${AppConstants.accessTokenKey}');
      
      // Verify token was stored
      final storedToken = await _secureStorage.read(key: AppConstants.accessTokenKey);
      print('[AUTH] Token verification: ${storedToken != null ? '${storedToken.substring(0, 20)}...' : 'NULL'}');
      
      // Safely encode user data
      try {
        await _secureStorage.write(
          key: AppConstants.userDataKey,
          value: json.encode(response.user.toJson()),
        );
        print('[AUTH] User data stored successfully');
      } catch (e) {
        print('[AUTH] Error storing user data: $e');
        // Continue without storing user data if there's an issue
      }

      state = state.copyWith(
        user: response.user,
        isAuthenticated: true,
        isLoading: false,
      );

      return true;
    } catch (e) {
      String errorMessage = 'Login failed';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Invalid credentials. Please check your CIN and password.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Network error. Please check your internet connection.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Connection timeout. Please try again.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );

      print('[AUTH] Login error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    try {
      // Call logout API if user is authenticated
      if (state.isAuthenticated) {
        await _apiClient.logout();
      }
    } catch (e) {
      print('[AUTH] Logout API error: $e');
      // Continue with local logout even if API call fails
    }

    // Clear local storage
    await _secureStorage.delete(key: AppConstants.accessTokenKey);
    await _secureStorage.delete(key: AppConstants.userDataKey);

    state = const AuthState();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Providers
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  final secureStorage = getIt<FlutterSecureStorage>();
  return AuthNotifier(apiClient, secureStorage);
});

// Helper providers
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authProvider).user;
});

final authLoadingProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isLoading;
});

final authErrorProvider = Provider<String?>((ref) {
  return ref.watch(authProvider).error;
}); 