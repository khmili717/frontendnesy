import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foresight_care/features/secretary/presentation/pages/secretary_landing_page.dart';
import 'package:foresight_care/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependency injection
  await configureDependencies();
  
  runApp(const DemoSecretaryApp());
}

class DemoSecretaryApp extends StatelessWidget {
  const DemoSecretaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Secretary Landing Page Demo',
        theme: ThemeData(
          fontFamily: 'League Spartan',
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const SecretaryLandingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
} 