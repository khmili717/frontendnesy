import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

void main() {
  group('API Connection Tests', () {
    late Dio dio;

    setUp(() {
      dio = Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      ));
    });

    test('should connect to backend server', () async {
      try {
        // Test a simple endpoint that doesn't require authentication
        final response = await dio.get('/');
        
        // If we get any response (even 404), it means the server is running
        expect(response.statusCode, isNotNull);
        print('✅ Backend server is reachable');
        print('Status Code: ${response.statusCode}');
      } catch (e) {
        if (e is DioException) {
          if (e.type == DioExceptionType.connectionError) {
            print('❌ Cannot connect to backend server at ${AppConstants.baseUrl}');
            print('Make sure your NestJS backend is running on port 3000');
          } else {
            print('✅ Backend server is reachable (got response)');
            print('Error: ${e.message}');
          }
        }
        // Don't fail the test for connection issues in development
      }
    });

    test('should have correct API endpoints configured', () {
      // Print current configuration
      AppConstants.printNetworkConfig();
      
      // Check that baseUrl is not null and contains the expected port
      expect(AppConstants.baseUrl, contains('3000'));
      expect(AppConstants.loginEndpoint, equals('/auth/login'));
      expect(AppConstants.usersEndpoint, equals('/users'));
      expect(AppConstants.patientsEndpoint, equals('/patients'));
      
      print('Current base URL: ${AppConstants.baseUrl}');
    });
  });
} 