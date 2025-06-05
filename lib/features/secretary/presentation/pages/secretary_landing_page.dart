import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart'
    show authProvider;
import 'package:foresight_care/features/secretary/presentation/widgets/patients_section.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/appointments_section.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/secretary_header.dart';
import 'package:foresight_care/features/secretary/presentation/widgets/section_toggle.dart';
import 'package:foresight_care/core/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:foresight_care/features/doctor/presentation/pages/user_profile_screen.dart';

class SecretaryLandingPage extends ConsumerStatefulWidget {
  const SecretaryLandingPage({super.key});

  @override
  ConsumerState<SecretaryLandingPage> createState() =>
      _SecretaryLandingPageState();
}

class _SecretaryLandingPageState extends ConsumerState<SecretaryLandingPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);

    // Add global error handler
    FlutterError.onError = (FlutterErrorDetails details) {
      debugPrint('[SECRETARY_PAGE] Flutter Error: ${details.exception}');
      debugPrint('[SECRETARY_PAGE] Stack trace: ${details.stack}');
    };
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentIndex = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            _buildHeader(),

            // Tab toggle section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SectionToggle(
                tabController: _tabController,
                semanticsLabel:
                    'Navigation entre les sections Patients et Rendez-vous',
              ),
            ),

            // Content section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Patients section
                    _buildSectionWrapper(
                      child: const PatientsSection(),
                      semanticsLabel: 'Section des patients',
                    ),

                    // Appointments section
                    _buildSectionWrapper(
                      child: const AppointmentsSection(),
                      semanticsLabel: 'Section des rendez-vous',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  'Tableau de bord',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    height: 1.2,
                    color: Color(0xFF103459),
                  ),
                  semanticsLabel: 'Tableau de bord secrétaire',
                ),
                const SizedBox(height: 8),
                Text(
                  'Gérez vos patients et rendez-vous',
                  style: const TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.4,
                    color: Color(0xFF717171),
                  ),
                  semanticsLabel:
                      'Description: Gérez vos patients et rendez-vous',
                ),
              ],
            ),
          ),

          // Right side - Profile and Logout button
          Row(
            children: [
              // Profile button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF13A4AB).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF13A4AB).withOpacity(0.3)),
                    ),
                    child: IconButton(
                      onPressed: () => _navigateToProfile(context),
                      icon: const Icon(
                        Icons.person_outline,
                        color: Color(0xFF13A4AB),
                        size: 24,
                      ),
                      tooltip: 'Mon profil',
                      padding: const EdgeInsets.all(12),
                      constraints: const BoxConstraints(
                        minWidth: 48,
                        minHeight: 48,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Profil',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF13A4AB),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(width: 12),

              // Logout button
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: IconButton(
                      onPressed: () => _showLogoutDialog(context),
                      icon: const Icon(Icons.logout, color: Colors.red, size: 24),
                      tooltip: 'Se déconnecter',
                      padding: const EdgeInsets.all(12),
                      constraints: const BoxConstraints(
                        minWidth: 48,
                        minHeight: 48,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Déconnexion',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.red[700],
                    ),
                  ),
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
                _performLogout(context);
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

  void _performLogout(BuildContext context) async {
    try {
      // Store the scaffold messenger reference before logout to avoid context issues
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      
      await ref.read(authProvider.notifier).logout();
      debugPrint('[SECRETARY_PAGE] User logged out');

      // Check if context is still mounted before using it
      debugPrint('[SECRETARY_PAGE] Context mounted: ${context.mounted}');
      if (context.mounted) {
        debugPrint('[SECRETARY_PAGE] About to show snackbar');
        
        // Show logout success message
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: const Text(
              'Déconnexion réussie',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.green[600],
            duration: const Duration(seconds: 2),
          ),
        );

        debugPrint('[SECRETARY_PAGE] Snackbar shown, global listener will handle navigation');
        // Navigation is now handled by the global auth listener in main.dart
      } else {
        debugPrint('[SECRETARY_PAGE] Context not mounted, skipping snackbar');
      }
    } catch (e) {
      debugPrint('[SECRETARY_PAGE] Error during logout: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Erreur lors de la déconnexion',
              style: TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: Colors.red[600],
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Widget _buildSectionWrapper({
    required Widget child,
    required String semanticsLabel,
  }) {
    return Semantics(
      label: semanticsLabel,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 8,
              color: const Color(0xFFD6D6D6).withOpacity(0.15),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Padding(padding: const EdgeInsets.all(20), child: child),
        ),
      ),
    );
  }
}

// Error boundary widget for crash prevention
class ErrorBoundary extends StatelessWidget {
  final Widget child;
  final String errorMessage;
  final VoidCallback? onRetry;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.errorMessage = 'Une erreur est survenue',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        try {
          return child;
        } catch (error, stackTrace) {
          debugPrint('[ERROR_BOUNDARY] Error: $error');
          debugPrint('[ERROR_BOUNDARY] Stack trace: $stackTrace');

          return _buildErrorWidget(context);
        }
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[300],
              semanticLabel: 'Icône d\'erreur',
            ),
            const SizedBox(height: 16),
            Text(
              'Oops! Une erreur est survenue',
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF393C3C),
              ),
              textAlign: TextAlign.center,
              semanticsLabel: 'Message d\'erreur',
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              style: const TextStyle(
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFF717171),
              ),
              textAlign: TextAlign.center,
              semanticsLabel: 'Détails de l\'erreur: $errorMessage',
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF13A4AB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Réessayer',
                  style: TextStyle(
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
