import 'dart:io';
import 'package:flutter/foundation.dart';

class AppConstants {
  // API Configuration
  // Android emulator uses 10.0.2.2 to access host machine's localhost
  static const String _androidEmulatorUrl = 'http://10.0.2.2:3000';
  static const String _deviceUrl = 'http://192.168.1.2:3000'; // For real devices
  static const String _localhostUrl = 'http://localhost:3000'; // For web/desktop
  static const String _productionUrl = 'http://192.168.1.2:3000'; // For production
  
  // Automatically select the correct URL based on platform
  static String get baseUrl {
    if (kIsWeb) {
      // Web uses localhost
      return _localhostUrl;
    } else if (Platform.isAndroid) {
      // Android emulator uses special IP to access host
      return _androidEmulatorUrl;
    } else if (Platform.isIOS) {
      // iOS simulator uses localhost, real device uses IP
      return kDebugMode ? _localhostUrl : _deviceUrl;
    } else {
      // Desktop uses localhost
      return _localhostUrl;
    }
  }
  
  static const String apiVersion = '/api/v1';
  
  // API Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String logoutEndpoint = '/auth/logout';
  static const String checkTokenEndpoint = '/auth/check-token';
  static const String usersEndpoint = '/users';
  static const String patientsEndpoint = '/patients';
  static const String consultationsEndpoint = '/consultations';
  static const String appointmentsEndpoint = '/rendez-vous';
  static const String predictionsEndpoint = '/predictions';
  
  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String tokenKey = 'access_token'; // Alias for compatibility
  static const String userKey = 'user_data'; // Alias for compatibility
  
  // Network Configuration
  static const int connectTimeout = 10000; // 10 seconds
  static const int requestTimeout = 15000; // 15 seconds
  static const int minPasswordLength = 6;
  
  // Debug method to check current configuration
  static void printNetworkConfig() {
    print('🌐 Network Configuration:');
    print('Platform: ${kIsWeb ? 'Web' : Platform.operatingSystem}');
    print('Base URL: $baseUrl');
    print('Is Web: $kIsWeb');
    if (!kIsWeb) {
      print('Is Android: ${Platform.isAndroid}');
      print('Is iOS: ${Platform.isIOS}');
    }
  }
  
  // App Colors (from Figma)
  static const int primaryBlue = 0xFF13A4AB;
  static const int primaryBlueLight = 0xFF15AEB4;
  static const int primaryBlueAccent = 0xFF1E96BE;
  static const int backgroundGray = 0xFFF8F8F9;
  static const int white = 0xFFFFFFFF;
  static const int textDark = 0xFF171D1B;
  static const int textSecondary = 0xFF393C3C;
  static const int textGray = 0xFF717171;
  static const int textPlaceholder = 0xFFA6A5A5;
  static const int borderGray = 0xFFA6A5A5;
  static const int successGreen = 0xFF11939A;
  static const int successGreenLight = 0xFFE8FAFA;
  static const int errorRed = 0xFFAC0000;
  static const int errorRedLight = 0xFFF9C4C4;
  static const int errorRedDark = 0xFF6D0A0A;
  static const int darkBlue = 0xFF103459;
  static const int iconGray = 0xFF5F5F5F;
  
  // App Sizes
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  static const double borderRadiusSmall = 5.0;
  static const double borderRadiusMedium = 10.0;
  static const double borderRadiusLarge = 23.0;
  
  static const double buttonHeight = 50.0;
  static const double inputHeight = 48.0;
  
  // Font Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXLarge = 20.0;
  static const double fontSizeXXLarge = 25.0;
  
  // Font Weights
  static const int fontWeightRegular = 400;
  static const int fontWeightMedium = 500;
  static const int fontWeightSemiBold = 600;
  static const int fontWeightBold = 700;
}

class AppStrings {
  // Login Page
  static const String loginTitle = 'Connectez-vous à votre compte';
  static const String loginSubtitle = 'Veuillez fournir les cordonnées fourni par l\'administrateur pour continuer.';
  static const String emailLabel = 'Adresse E-mail';
  static const String email = 'Adresse E-mail'; // Alias
  static const String emailPlaceholder = 'Veuillez entrer votre adresse e-mail';
  static const String passwordLabel = 'Mot de passe';
  static const String password = 'Mot de passe'; // Alias
  static const String passwordPlaceholder = 'Veuillez entrer votre mot de passe';
  static const String forgotPassword = 'Mot de passe oublié?';
  static const String loginButton = 'Se connecter';
  static const String login = 'Se connecter'; // Alias
  
  // Admin Dashboard
  static const String addUser = 'Ajouter un utilisateur';
  static const String doctor = 'Docteur';
  static const String secretary = 'Secretaire';
  static const String nameLabel = 'Nom prénom';
  static const String prenomLabel = 'Prénom:';
  static const String nomLabel = 'Nom:';
  static const String cinLabel = 'CIN:';
  static const String passwordLabelShort = 'Mot de passe:';
  static const String genderLabel = 'Sexe:';
  static const String roleLabel = 'Role:';
  static const String modify = 'Modifier';
  static const String archive = 'Archiver';
  
  // Common
  static const String loading = 'Chargement...';
  static const String error = 'Erreur';
  static const String success = 'Succès';
  static const String cancel = 'Annuler';
  static const String confirm = 'Confirmer';
  static const String save = 'Enregistrer';
  static const String delete = 'Supprimer';
  
  // Error Messages
  static const String invalidCredentials = 'Identifiants invalides';
  static const String networkError = 'Erreur de connexion réseau';
  static const String serverError = 'Erreur du serveur';
  static const String unknownError = 'Erreur inconnue';
  static const String fieldRequired = 'Ce champ est obligatoire';
  static const String invalidEmail = 'Adresse e-mail invalide';
  static const String passwordTooShort = 'Le mot de passe doit contenir au moins 6 caractères';
}

class ApiEndpoints {
  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String checkToken = '/auth/check-token';
  
  // Users
  static const String users = '/users';
  static const String userAuth = '/users/auth';
  static const String userLogout = '/users/logout';
  static const String userCheckToken = '/users/check-token';
  static const String medecins = '/users/medecins';
  static const String secretaires = '/users/secretaires';
  
  // Patients
  static const String patients = '/patients';
  static const String patientsToday = '/patients/today';
  static const String patientsPendingDeletions = '/patients/pending-deletions';
  static const String patientsAllIncludingPending = '/patients/all-including-pending';
  
  // Consultations
  static const String consultations = '/consultations';
  static const String consultationsFromAppointment = '/consultations/from-appointment';
  static const String myConsultations = '/consultations/my-consultations';
  static const String consultationsToday = '/consultations/today';
  
  // Appointments (Rendez-vous)
  static const String appointments = '/rendez-vous';
  static const String myAppointments = '/rendez-vous/my-appointments';
  static const String appointmentsToday = '/rendez-vous/today';
  
  // Predictions
  static const String predictions = '/predictions';
  static const String globalFactors = '/predictions/global-factors';
  static const String globalAnalysis = '/predictions/global-analysis';
}

class AppColors {
  // Primary Colors
  static const int primaryBlue = 0xFF13A4AB;
  static const int primaryTeal = 0xFF15AEB4;
  static const int primaryDarkBlue = 0xFF1E96BE;
  static const int primaryNavy = 0xFF103459;
  
  // Secondary Colors
  static const int lightTeal = 0xFF11939A;
  static const int lightBlue = 0xFFE8FAFA;
  
  // Neutral Colors
  static const int white = 0xFFFFFFFF;
  static const int background = 0xFFF8F8F9;
  static const int darkText = 0xFF171D1B;
  static const int mediumText = 0xFF393C3C;
  static const int lightText = 0xFF717171;
  static const int placeholderText = 0xFFA6A5A5;
  static const int borderColor = 0xFFA6A5A5;
  
  // Status Colors
  static const int success = 0xFF13A4AB;
  static const int error = 0xFFAC0000;
  static const int errorBackground = 0xFFF9C4C4;
  static const int errorText = 0xFF6D0A0A;
  static const int warning = 0xFFFF9800;
  static const int info = 0xFF2196F3;
}

class AppSizes {
  // Padding & Margins
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  
  // Border Radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  
  // Button Heights
  static const double buttonHeightSm = 32.0;
  static const double buttonHeightMd = 40.0;
  static const double buttonHeightLg = 48.0;
  static const double buttonHeightXl = 56.0;
  
  // Input Heights
  static const double inputHeight = 48.0;
  static const double inputHeightSm = 40.0;
  
  // Icon Sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;
} 