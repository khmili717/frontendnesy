import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/core/di/injection.dart';
import 'package:foresight_care/core/routes/app_router.dart';
import 'package:foresight_care/core/theme/app_theme.dart';
import 'package:foresight_care/features/auth/presentation/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Add global error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    print('[FLUTTER_ERROR] ${details.exception}');
    print('[FLUTTER_ERROR] ${details.stack}');
  };
  
  // Initialize dependency injection
  await configureDependencies();
  
  runApp(
    const ProviderScope(
      child: ForesightCareApp(),
    ),
  );
}

class ForesightCareApp extends ConsumerStatefulWidget {
  const ForesightCareApp({super.key});

  @override
  ConsumerState<ForesightCareApp> createState() => _ForesightCareAppState();
}

class _ForesightCareAppState extends ConsumerState<ForesightCareApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    
    // Listen for auth state changes to handle automatic logout navigation
    ref.listen<AuthState>(authProvider, (previous, next) {
      // If user was authenticated but now is not (logout scenario)
      if (previous?.isAuthenticated == true && !next.isAuthenticated) {
        debugPrint('[MAIN_APP] User logged out, navigating to login');
        // Use router to navigate to login
        router.go('/login');
      }
    });
    
    return MaterialApp.router(
      title: 'Foresight Care',
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
