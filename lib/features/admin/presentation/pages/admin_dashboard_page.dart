import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/domain/entities/user.dart';
import 'package:foresight_care/features/admin/presentation/widgets/user_card.dart';
import 'package:foresight_care/features/admin/presentation/widgets/user_filter_tabs.dart';
import 'package:foresight_care/features/admin/presentation/widgets/add_user_button.dart';
import 'package:foresight_care/features/admin/presentation/providers/users_provider.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';

class AdminDashboardPage extends ConsumerStatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  ConsumerState<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends ConsumerState<AdminDashboardPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to controller changes to update the search icon
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserProvider);
    final usersState = ref.watch(usersProvider);
    final selectedFilter = ref.watch(selectedFilterProvider);

    return Scaffold(
      backgroundColor: const Color(AppConstants.backgroundGray),
      appBar: AppBar(
        backgroundColor: const Color(AppConstants.backgroundGray),
        elevation: 0,
        title: Text(
          'Dashboard Admin',
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(AppConstants.primaryBlueAccent),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(authProvider.notifier).logout();
              // Navigation is now handled by the global auth listener in main.dart
            },
            icon: const Icon(
              Icons.logout,
              color: Color(AppConstants.primaryBlueAccent),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              // const SizedBox(height: 15),
              // _buildWelcomeMessage(currentUser),
              const SizedBox(height: 15),
              _buildHeader(),
              const SizedBox(height: 15),
              _buildFilterTabs(selectedFilter),
              const SizedBox(height: 15),
              _buildSearchBar(),
              const SizedBox(height: 15),
              Expanded(
                child: _buildUsersList(usersState),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage(User? user) {
    if (user == null) return const SizedBox.shrink();
      print('User prenom: ${user.prenom}, nom: ${user.nom}');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(AppConstants.white),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        border: Border.all(
          color: const Color(AppConstants.primaryBlueLight),
          width: 1,
        ),
      ),
      child: Text(
        'Bienvenue, ${user.prenom} ${user.nom}',
        style: const TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(AppConstants.primaryBlueAccent),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const AddUserButton();
  }

  Widget _buildFilterTabs(String selectedFilter) {
    return UserFilterTabs(
      selectedFilter: selectedFilter,
      onFilterChanged: (filter) {
        ref.read(usersProvider.notifier).filterUsers(filter);
      },
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 360,
      height: 33,
      decoration: BoxDecoration(
        color: const Color(AppConstants.white),
        border: Border.all(
          color: const Color(AppConstants.primaryBlueAccent),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppConstants.borderRadiusLarge),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  // Trigger search as user types
                  ref.read(usersProvider.notifier).searchUsers(value);
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Rechercher...',
                  hintStyle: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 14,
                    color: Color(AppConstants.textPlaceholder),
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 14,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Clear search when search icon is tapped
                _searchController.clear();
                ref.read(usersProvider.notifier).searchUsers('');
              },
              child: Icon(
                _searchController.text.isEmpty ? Icons.search : Icons.clear,
                color: const Color(AppConstants.primaryBlueLight),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsersList(UsersState usersState) {
    if (usersState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(AppConstants.primaryBlueAccent),
        ),
      );
    }

    if (usersState.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Color(AppConstants.errorRed),
            ),
            const SizedBox(height: 16),
            Text(
              usersState.error!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 16,
                color: Color(AppConstants.errorRed),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(usersProvider.notifier).refreshUsers();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(AppConstants.primaryBlueAccent),
                foregroundColor: const Color(AppConstants.white),
              ),
              child: const Text('Réessayer'),
            ),
          ],
        ),
      );
    }

    final users = usersState.filteredUsers;

    if (users.isEmpty) {
      final searchQuery = usersState.searchQuery;
      final emptyMessage = searchQuery.isNotEmpty 
          ? 'Aucun utilisateur trouvé pour "$searchQuery"'
          : 'Aucun utilisateur trouvé';
      
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              searchQuery.isNotEmpty ? Icons.search_off : Icons.people_outline,
              size: 64,
              color: const Color(AppConstants.textGray),
            ),
            const SizedBox(height: 16),
            Text(
              emptyMessage,
              style: const TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 16,
                color: Color(AppConstants.darkBlue),
              ),
            ),
            if (searchQuery.isNotEmpty) ...[
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  _searchController.clear();
                  ref.read(usersProvider.notifier).searchUsers('');
                },
                child: const Text(
                  'Effacer la recherche',
                  style: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 14,
                    color: Color(AppConstants.primaryBlueAccent),
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    }
    
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(usersProvider.notifier).refreshUsers();
      },
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: UserCard(
              prenom: user.prenom,
              nom: user.nom,
              cin: user.cin.toString(),
              password: '********', // Never show real passwords
              gender: user.sexe == Gender.homme ? 'Homme' : 'Femme',
              role: _getRoleDisplayName(user.role),
              user: user,
              onEdit: () {
                // TODO: Implement edit functionality
                _showEditUserDialog(user);
              },
              onArchive: () {
                // Refresh the users list to reflect archive status changes
                ref.read(usersProvider.notifier).refreshUsers();
              },
            ),
          );
        },
      ),
    );
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

  void _showEditUserDialog(User user) {
    // TODO: Implement edit user dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Modifier utilisateur'),
        content: Text('Modification de ${user.prenom} ${user.nom}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Implement actual edit logic
            },
            child: const Text('Modifier'),
          ),
        ],
      ),
    );
  }

  void _showArchiveUserDialog(User user) {
    // TODO: Implement archive user dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Archiver utilisateur'),
        content: Text('Êtes-vous sûr de vouloir archiver ${user.prenom} ${user.nom}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Implement actual archive logic
            },
            child: const Text('Archiver'),
          ),
        ],
      ),
    );
  }


} 