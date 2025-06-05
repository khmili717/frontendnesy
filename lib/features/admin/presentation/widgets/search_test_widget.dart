import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/features/admin/presentation/widgets/user_filter_tabs.dart';
import 'package:foresight_care/features/admin/presentation/providers/users_provider.dart';

/// Test widget to verify search and filter functionality
class SearchTestWidget extends ConsumerStatefulWidget {
  const SearchTestWidget({super.key});

  @override
  ConsumerState<SearchTestWidget> createState() => _SearchTestWidgetState();
}

class _SearchTestWidgetState extends ConsumerState<SearchTestWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
    final usersState = ref.watch(usersProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search & Filter Test'),
        backgroundColor: const Color(AppConstants.primaryBlueAccent),
        foregroundColor: const Color(AppConstants.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Debug info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Debug Info:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Selected Filter: "${usersState.selectedFilter}"'),
                  Text('Search Query: "${usersState.searchQuery}"'),
                  Text('Total Users: ${usersState.users.length}'),
                  Text('Filtered Users: ${usersState.filteredUsers.length}'),
                  Text('Is Loading: ${usersState.isLoading}'),
                  if (usersState.error != null) Text('Error: ${usersState.error}'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Filter tabs
            UserFilterTabs(
              selectedFilter: usersState.selectedFilter,
              onFilterChanged: (filter) {
                print('[SEARCH_TEST] Filter changed to: $filter');
                ref.read(usersProvider.notifier).filterUsers(filter);
              },
            ),
            const SizedBox(height: 20),
            
            // Search bar
            Container(
              width: double.infinity,
              height: 40,
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
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          print('[SEARCH_TEST] Search query: "$value"');
                          ref.read(usersProvider.notifier).searchUsers(value);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Rechercher nom, prénom, CIN...',
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
                        _searchController.clear();
                        ref.read(usersProvider.notifier).searchUsers('');
                      },
                      child: Icon(
                        _searchController.text.isEmpty ? Icons.search : Icons.clear,
                        color: const Color(AppConstants.primaryBlueLight),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // User list
            Expanded(
              child: usersState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : usersState.error != null
                      ? Center(child: Text('Error: ${usersState.error}'))
                      : usersState.filteredUsers.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    usersState.searchQuery.isNotEmpty 
                                        ? Icons.search_off 
                                        : Icons.people_outline,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    usersState.searchQuery.isNotEmpty
                                        ? 'Aucun utilisateur trouvé pour "${usersState.searchQuery}"'
                                        : 'Aucun utilisateur trouvé',
                                    textAlign: TextAlign.center,
                                  ),
                                  if (usersState.searchQuery.isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        _searchController.clear();
                                        ref.read(usersProvider.notifier).searchUsers('');
                                      },
                                      child: const Text('Effacer la recherche'),
                                    ),
                                  ],
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: usersState.filteredUsers.length,
                              itemBuilder: (context, index) {
                                final user = usersState.filteredUsers[index];
                                return Card(
                                  child: ListTile(
                                    title: Text('${user.prenom} ${user.nom}'),
                                    subtitle: Text('Role: ${user.role.name} | CIN: ${user.cin}'),
                                    trailing: Text(user.archived ? 'Archivé' : 'Actif'),
                                  ),
                                );
                              },
                            ),
            ),
            
            // Quick test buttons
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _searchController.text = 'test';
                    ref.read(usersProvider.notifier).searchUsers('test');
                  },
                  child: const Text('Test "test"'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _searchController.text = '123';
                    ref.read(usersProvider.notifier).searchUsers('123');
                  },
                  child: const Text('Test "123"'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _searchController.clear();
                    ref.read(usersProvider.notifier).searchUsers('');
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 