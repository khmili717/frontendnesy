import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/constants/app_constants.dart';
import 'package:foresight_care/features/admin/presentation/widgets/user_filter_tabs.dart';
import 'package:foresight_care/features/admin/presentation/providers/users_provider.dart';

/// Test widget to verify filter functionality
class FilterTestWidget extends ConsumerWidget {
  const FilterTestWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Test'),
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
                  Text('Debug Info:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Selected Filter: "${usersState.selectedFilter}"'),
                  Text('AppStrings.doctor: "${AppStrings.doctor}"'),
                  Text('AppStrings.secretary: "${AppStrings.secretary}"'),
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
                print('[FILTER_TEST] Filter changed to: $filter');
                ref.read(usersProvider.notifier).filterUsers(filter);
              },
            ),
            const SizedBox(height: 20),
            
            // User list
            Expanded(
              child: usersState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : usersState.error != null
                      ? Center(child: Text('Error: ${usersState.error}'))
                      : ListView.builder(
                          itemCount: usersState.filteredUsers.length,
                          itemBuilder: (context, index) {
                            final user = usersState.filteredUsers[index];
                            return Card(
                              child: ListTile(
                                title: Text('${user.prenom} ${user.nom}'),
                                subtitle: Text('Role: ${user.role.name}'),
                                trailing: Text('CIN: ${user.cin}'),
                              ),
                            );
                          },
                        ),
            ),
            
            // Manual filter buttons for testing
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(usersProvider.notifier).filterUsers('Docteur');
                  },
                  child: Text('Docteur'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    ref.read(usersProvider.notifier).filterUsers('Secretaire');
                  },
                  child: Text('Secretaire'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    ref.read(usersProvider.notifier).filterUsers('Tous');
                  },
                  child: Text('Tous'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 