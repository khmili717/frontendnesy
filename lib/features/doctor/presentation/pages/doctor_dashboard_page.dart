import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';
import 'package:foresight_care/features/doctor/presentation/widgets/doctor_patients_section.dart';
import 'package:foresight_care/features/doctor/presentation/widgets/doctor_appointments_section.dart';
import 'package:foresight_care/features/doctor/presentation/widgets/doctor_consultations_section.dart';
import 'package:foresight_care/features/doctor/presentation/widgets/doctor_header.dart';
import 'package:foresight_care/features/doctor/presentation/widgets/doctor_section_toggle.dart';
import 'package:foresight_care/core/theme/app_theme.dart';

class DoctorDashboardPage extends ConsumerStatefulWidget {
  const DoctorDashboardPage({super.key});

  @override
  ConsumerState<DoctorDashboardPage> createState() => _DoctorDashboardPageState();
}

class _DoctorDashboardPageState extends ConsumerState<DoctorDashboardPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

    // Add global error handler
    FlutterError.onError = (FlutterErrorDetails details) {
      debugPrint('[DOCTOR_DASHBOARD] Flutter Error: ${details.exception}');
      debugPrint('[DOCTOR_DASHBOARD] Stack trace: ${details.stack}');
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
            DoctorHeader(
              onLogout: () => _performLogout(context),
            ),

            // Tab toggle section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: DoctorSectionToggle(
                tabController: _tabController,
                semanticsLabel: 'Navigation entre les sections Patients, Rendez-vous et Consultations',
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
                      child: const DoctorPatientsSection(),
                      semanticsLabel: 'Section des patients',
                    ),

                    // Appointments section
                    _buildSectionWrapper(
                      child: const DoctorAppointmentsSection(),
                      semanticsLabel: 'Section des rendez-vous',
                    ),

                    // Consultations section
                    _buildSectionWrapper(
                      child: const DoctorConsultationsSection(),
                      semanticsLabel: 'Section des consultations',
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

  void _performLogout(BuildContext context) async {
    try {
      // Store the scaffold messenger reference before logout to avoid context issues
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      
      await ref.read(authProvider.notifier).logout();
      debugPrint('[DOCTOR_DASHBOARD] User logged out');

      // Check if context is still mounted before using it
      if (context.mounted) {
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

        // Navigation is handled by the global auth listener in main.dart
      }
    } catch (e) {
      debugPrint('[DOCTOR_DASHBOARD] Error during logout: $e');
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
          child: Padding(
            padding: const EdgeInsets.all(20), 
            child: child
          ),
        ),
      ),
    );
  }
}

// Error boundary widget for crash prevention
class DoctorErrorBoundary extends StatelessWidget {
  final Widget child;
  final String errorMessage;
  final VoidCallback? onRetry;

  const DoctorErrorBoundary({
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
          debugPrint('[DOCTOR_ERROR_BOUNDARY] Error: $error');
          debugPrint('[DOCTOR_ERROR_BOUNDARY] Stack trace: $stackTrace');

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