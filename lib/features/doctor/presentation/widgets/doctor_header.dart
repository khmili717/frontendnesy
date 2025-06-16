import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';
import 'package:foresight_care/features/doctor/presentation/providers/pending_deletions_provider.dart';
import 'package:foresight_care/features/doctor/presentation/pages/pending_deletions_screen.dart';
import 'package:foresight_care/features/doctor/presentation/pages/user_profile_screen.dart';
import 'package:go_router/go_router.dart';

class DoctorHeader extends ConsumerWidget {
  final VoidCallback onLogout;

  const DoctorHeader({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final pendingDeletionsCount = ref.watch(pendingDeletionsCountProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 4,
            color: Color(0x1A000000),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left side - Welcome message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tableau de bord médecin',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    fontSize: 1,
                    height: 1.2,
                    color: Color(0xFF103459),
                  ),
                  // semanticsLabel: 'Tableau de bord médecin',
                ),
                const SizedBox(height: 8),
                if (currentUser != null) ...[
                  Text(
                    'Bienvenue, Dr. ${currentUser.prenom} ${currentUser.nom}',
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      height: 1.4,
                      color: Color(0xFF13A4AB),
                    ),
                    semanticsLabel: 'Bienvenue Dr. ${currentUser.prenom} ${currentUser.nom}',
                  ),
                  const SizedBox(height: 4),
                ],
                // Text(
                //   'Patients, rendez-vous et consultations',
                //   style: const TextStyle(
                //     fontFamily: 'League Spartan',
                //     fontWeight: FontWeight.w400,
                //     fontSize: 1,
                //     height: 1.4,
                //     color: Color(0xFF717171),
                //   ),
                //   semanticsLabel: 'Description: Patients, rendez-vous et consultations',
                // ),
              ],
            ),
          ),

          // Right side - Profile, Notification bell and Logout button
          Row(
            children: [
              // Profile button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration (
                      
                      color: const Color(0xFF13A4AB).withOpacity(0),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF13A4AB).withOpacity(0.3)),
                    ),
                    child: Center(
                      child: IconButton(
                        alignment: Alignment.center,
                        onPressed: () => _navigateToProfile(context),
                      icon: const Icon(
                        Icons.person_outline,
                        color: Color(0xFF13A4AB),
                        size:24,
                      ), 
                      tooltip: 'profil',
                    ),  
                      // padding: const EdgeInsets.all(8),
                      // constraints: const BoxConstraints(
                      //   minWidth: 32,
                      //   minHeight: 32,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 1),
                  // const Text(
                  //   'Profil',
                  //   style: TextStyle(
                  //     fontFamily: 'League Spartan',
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 12,
                  //     color: Color(0xFF13A4AB),
                  //   ),
                  // ),
                ],
              ),
              
              const SizedBox(width: 12),

              // Notification bell for pending deletions
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      
                      // color: pendingDeletionsCount > 0 ? Colors.orange[50] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: pendingDeletionsCount > 0 ? Colors.orange[200]! : Colors.grey[200]!,
                      ),
                    ),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () => _navigateToPendingDeletions(context),
                          icon: Icon(
                            Icons.notifications_outlined,
                            color: pendingDeletionsCount > 0 ? Colors.orange[700] : Colors.grey[600],
                            size: 24,
                          ),
                          tooltip: 'Demandes de suppression en attente',
                            // padding: const EdgeInsets.all(12),
                          // constraints: const BoxConstraints(
                          //   minWidth: 48,
                          //   minHeight: 48,
                          // ),
                        ),
                        if (pendingDeletionsCount > 0)
                          Positioned(
                            right: 0.3,
                            top: 1,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red[600],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              child: Text(
                                pendingDeletionsCount > 99 ? '99+' : pendingDeletionsCount.toString(),
                                style: const TextStyle(
                                  fontFamily: 'League Spartan',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Text(
                  //   'Notifications',
                  //   style: TextStyle(
                  //     fontFamily: 'League Spartan',
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 12,
                  //     color: pendingDeletionsCount > 0 ? Colors.orange[700] : Colors.grey[600],
                  //   ),
                  // ),
                ],
              ),
              
              const SizedBox(width: 12),

              // ML Analytics button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF0066CC).withOpacity(0.3)),
                    ),
                    child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () => _navigateToMLAnalytics(context),
                      icon: const Icon(
                        Icons.analytics,
                        color: Color(0xFF0066CC),
                        size: 24,
                      ),
                      tooltip: 'ML Analytics Dashboard',
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
              
              const SizedBox(width: 12),
              
              // Logout button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () => _showLogoutDialog(context),
                      icon: const Icon(Icons.logout, color: Colors.red, size: 24),
                      tooltip: 'Se déconnecter',
                      // padding: const EdgeInsets.all(12),
                      // constraints: const BoxConstraints(
                      //   minWidth: 48,
                      //   minHeight: 48,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Text(
                  //   'Déconnexion',
                  //   style: TextStyle(
                  //     fontFamily: 'League Spartan',
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 12,
                  //     color: Colors.red[700],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UserProfileScreen(),
      ),
    );
  }

  void _navigateToPendingDeletions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PendingDeletionsScreen(),
      ),
    );
  }

  void _navigateToMLAnalytics(BuildContext context) {
    context.go('/doctor/ml-analytics');
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(Icons.logout, color: Colors.red[600], size: 24),
              const SizedBox(width: 12),
              const Text(
                'Déconnexion',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFF103459),
                ),
              ),
            ],
          ),
          content: const Text(
            'Êtes-vous sûr de vouloir vous déconnecter ?',
            style: TextStyle(
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0xFF717171),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Annuler',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onLogout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Se déconnecter',
                style: TextStyle(
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
} 