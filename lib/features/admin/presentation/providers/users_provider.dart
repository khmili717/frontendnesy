import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/user.dart';

// Users State
class UsersState {
  final List<User> users;
  final List<User> filteredUsers;
  final bool isLoading;
  final String? error;
  final String selectedFilter;
  final String searchQuery;

  const UsersState({
    this.users = const [],
    this.filteredUsers = const [],
    this.isLoading = false,
    this.error,
    this.selectedFilter = 'Docteur',
    this.searchQuery = '',
  });

  UsersState copyWith({
    List<User>? users,
    List<User>? filteredUsers,
    bool? isLoading,
    String? error,
    String? selectedFilter,
    String? searchQuery,
  }) {
    return UsersState(
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// Users Provider
class UsersNotifier extends StateNotifier<UsersState> {
  final api.ApiClient _apiClient;

  UsersNotifier(this._apiClient) : super(const UsersState()) {
    loadUsers();
  }

  Future<void> loadUsers() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final users = await _apiClient.getUsers();
      state = state.copyWith(
        users: users,
        filteredUsers: users,
        isLoading: false,
      );
      
      // Apply default filter after loading
      filterUsers(state.selectedFilter);
    } catch (e) {
      String errorMessage = 'Failed to load users';
      
      if (e.toString().contains('401')) {
        errorMessage = 'Unauthorized. Please login again.';
      } else if (e.toString().contains('403')) {
        errorMessage = 'Access denied. Admin privileges required.';
      } else if (e.toString().contains('network') || e.toString().contains('connection')) {
        errorMessage = 'Network error. Please check your internet connection.';
      }

      state = state.copyWith(
        isLoading: false,
        error: errorMessage,
      );

      print('[USERS] Load users error: $e');
    }
  }

  void filterUsers(String filter) {
    print('[USERS_PROVIDER] Filtering users with filter: $filter');
    print('[USERS_PROVIDER] Total users before filtering: ${state.users.length}');
    
    List<User> filtered;
    
    switch (filter) {
      case 'Docteur': // From AppStrings.doctor
        filtered = state.users.where((user) => user.role == UserRole.medecin).toList();
        print('[USERS_PROVIDER] Found ${filtered.length} doctors');
        break;
      case 'Secretaire': // From AppStrings.secretary
        filtered = state.users.where((user) => user.role == UserRole.secretaire).toList();
        print('[USERS_PROVIDER] Found ${filtered.length} secretaries');
        break;
      case 'Médecins': // Legacy support
        filtered = state.users.where((user) => user.role == UserRole.medecin).toList();
        print('[USERS_PROVIDER] Found ${filtered.length} doctors (legacy)');
        break;
      case 'Secrétaires': // Legacy support
        filtered = state.users.where((user) => user.role == UserRole.secretaire).toList();
        print('[USERS_PROVIDER] Found ${filtered.length} secretaries (legacy)');
        break;
      case 'Admins':
        filtered = state.users.where((user) => user.role == UserRole.admin).toList();
        print('[USERS_PROVIDER] Found ${filtered.length} admins');
        break;
      case 'Tous':
      default:
        filtered = state.users;
        print('[USERS_PROVIDER] Showing all ${filtered.length} users');
        break;
    }

    state = state.copyWith(
      filteredUsers: filtered,
      selectedFilter: filter,
    );
    
    // Apply search if there's a search query
    if (state.searchQuery.isNotEmpty) {
      _applySearch();
    }
    
    print('[USERS_PROVIDER] Filter applied. Filtered users count: ${state.filteredUsers.length}');
  }

  void searchUsers(String query) {
    print('[USERS_PROVIDER] Searching users with query: "$query"');
    
    state = state.copyWith(searchQuery: query);
    
    if (query.isEmpty) {
      // If search is cleared, just apply the current filter
      filterUsers(state.selectedFilter);
    } else {
      _applySearch();
    }
  }

  void _applySearch() {
    final query = state.searchQuery.toLowerCase();
    
    // Start with currently filtered users (by role)
    List<User> roleFiltered;
    
    switch (state.selectedFilter) {
      case 'Docteur':
      case 'Médecins':
        roleFiltered = state.users.where((user) => user.role == UserRole.medecin).toList();
        break;
      case 'Secretaire':
      case 'Secrétaires':
        roleFiltered = state.users.where((user) => user.role == UserRole.secretaire).toList();
        break;
      case 'Admins':
        roleFiltered = state.users.where((user) => user.role == UserRole.admin).toList();
        break;
      case 'Tous':
      default:
        roleFiltered = state.users;
        break;
    }
    
    // Apply search to role-filtered results with null safety
    final searchFiltered = roleFiltered.where((user) {
      // Safe handling of potentially null values
      final prenom = user.prenom;
      final nom = user.nom;
      final fullName = '$prenom $nom'.toLowerCase().trim();
      final cin = user.cin.toString();
      final role = _getRoleDisplayName(user.role).toLowerCase();
      
      return fullName.contains(query) || 
             cin.contains(query) || 
             role.contains(query);
    }).toList();

    state = state.copyWith(filteredUsers: searchFiltered);
    
    print('[USERS_PROVIDER] Search applied. Found ${searchFiltered.length} users matching "$query"');
  }

  String _getRoleDisplayName(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.medecin:
        return 'Médecin';
      case UserRole.secretaire:
        return 'Secrétaire';
      default:
        return role.toString();
    }
  }

  Future<void> refreshUsers() async {
    await loadUsers();
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Providers
final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>((ref) {
  final apiClient = getIt<api.ApiClient>();
  return UsersNotifier(apiClient);
});

// Helper providers
final usersListProvider = Provider<List<User>>((ref) {
  return ref.watch(usersProvider).filteredUsers;
});

final usersLoadingProvider = Provider<bool>((ref) {
  return ref.watch(usersProvider).isLoading;
});

final usersErrorProvider = Provider<String?>((ref) {
  return ref.watch(usersProvider).error;
});

final selectedFilterProvider = Provider<String>((ref) {
  return ref.watch(usersProvider).selectedFilter;
});

final searchQueryProvider = Provider<String>((ref) {
  return ref.watch(usersProvider).searchQuery;
});

// Specific role providers
final doctorsProvider = FutureProvider<List<User>>((ref) async {
  final apiClient = getIt<api.ApiClient>();
  return await apiClient.getDoctors();
});

final secretariesProvider = FutureProvider<List<User>>((ref) async {
  final apiClient = getIt<api.ApiClient>();
  return await apiClient.getSecretaries();
}); 