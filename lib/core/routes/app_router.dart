import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foresight_care/features/auth/presentation/pages/login_page.dart';
import 'package:foresight_care/features/admin/presentation/pages/admin_dashboard_page.dart';
import 'package:foresight_care/features/secretary/presentation/pages/secretary_landing_page.dart';
import 'package:foresight_care/features/doctor/presentation/pages/doctor_dashboard_page.dart';
import 'package:foresight_care/features/doctor/presentation/pages/ml_analytics_dashboard.dart';

// Route names
class AppRoutes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String adminDashboard = '/admin';
  static const String doctorDashboard = '/doctor';
  static const String secretaryDashboard = '/secretary';
  static const String users = '/users';
  static const String patients = '/patients';
  static const String consultations = '/consultations';
  static const String appointments = '/appointments';
  static const String mlAnalytics = '/ml-analytics';
}

// Router provider
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.login,
    debugLogDiagnostics: true,
    routes: [
      // Auth Routes
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      
      // Dashboard Routes
      GoRoute(
        path: AppRoutes.dashboard,
        name: 'dashboard',
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Dashboard - Role-based routing will be implemented'),
          ),
        ),
      ),
      
      // Admin Routes
      GoRoute(
        path: AppRoutes.adminDashboard,
        name: 'adminDashboard',
        builder: (context, state) => const AdminDashboardPage(),
        routes: [
          GoRoute(
            path: 'users',
            name: 'adminUsers',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('User Management'),
              ),
            ),
          ),
        ],
      ),
      
      // Doctor Routes
      GoRoute(
        path: AppRoutes.doctorDashboard,
        name: 'doctorDashboard',
        builder: (context, state) => const DoctorDashboardPage(),
        routes: [
          GoRoute(
            path: 'consultations',
            name: 'doctorConsultations',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Consultations'),
              ),
            ),
          ),
          GoRoute(
            path: 'appointments',
            name: 'doctorAppointments',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Appointments'),
              ),
            ),
          ),
          GoRoute(
            path: 'ml-analytics',
            name: 'mlAnalytics',
            builder: (context, state) => const MLAnalyticsDashboard(),
          ),
        ],
      ),
      
      // Secretary Routes
      GoRoute(
        path: AppRoutes.secretaryDashboard,
        name: 'secretaryDashboard',
        builder: (context, state) => const SecretaryLandingPage(),
        routes: [
          GoRoute(
            path: 'patients',
            name: 'secretaryPatients',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Patient Management'),
              ),
            ),
          ),
          GoRoute(
            path: 'appointments',
            name: 'secretaryAppointments',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Appointment Management'),
              ),
            ),
          ),
        ],
      ),
    ],
    
    // Error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.uri}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.login),
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    ),
  );
});

// Navigation helper extension
extension AppRouterExtension on GoRouter {
  void goToLogin() => go(AppRoutes.login);
  void goToDashboard() => go(AppRoutes.dashboard);
  void goToAdminDashboard() => go(AppRoutes.adminDashboard);
  void goToDoctorDashboard() => go(AppRoutes.doctorDashboard);
  void goToSecretaryDashboard() => go(AppRoutes.secretaryDashboard);
  void goToMLAnalytics() => go('/doctor/ml-analytics');
} 