import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

void main() {
  group('Network Connection Tests', () {
    late Dio dio;

    setUp(() {
      dio = Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      ));
    });

    test('should print current network configuration', () {
      AppConstants.printNetworkConfig();
      print('Testing connection to: ${AppConstants.baseUrl}');
      
      expect(AppConstants.baseUrl, isNotNull);
      expect(AppConstants.baseUrl, contains('3000'));
    });

    test('should test backend connectivity', () async {
      try {
        // Test the root endpoint
        final response = await dio.get('/');
        print('✅ Backend is reachable - Status: ${response.statusCode}');
        expect(response.statusCode, isNotNull);
      } on DioException catch (e) {
        if (e.type == DioExceptionType.connectionError) {
          print('❌ Connection failed to ${AppConstants.baseUrl}');
          print('Error: ${e.message}');
          print('');
          print('🔧 Troubleshooting steps:');
          print('1. Make sure your NestJS backend is running');
          print('2. For Android emulator, backend should be on 127.0.0.1:3000 or 0.0.0.0:3000');
          print('3. Check if backend is listening on IPv4, not just IPv6 [::1]');
          print('4. Try: npm run start:dev -- --host 0.0.0.0');
        } else if (e.response?.statusCode != null) {
          print('✅ Backend is reachable - Status: ${e.response!.statusCode}');
          print('Response indicates server is running (even if endpoint not found)');
        } else {
          print('❌ Network error: ${e.message}');
        }
      } catch (e) {
        print('❌ Unexpected error: $e');
      }
    });

    test('should test auth endpoint specifically', () async {
      try {
        // Test the auth/login endpoint with invalid data to see if it responds
        final response = await dio.post('/auth/login', data: {
          'cin': 'test',
          'mdp': 'test'
        });
        print('✅ Auth endpoint responded - Status: ${response.statusCode}');
      } on DioException catch (e) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
          print('✅ Auth endpoint is working - Status: ${e.response!.statusCode}');
          print('(400/401 expected for invalid credentials)');
        } else if (e.type == DioExceptionType.connectionError) {
          print('❌ Cannot reach auth endpoint');
          print('Backend may not be running or not accessible');
        } else {
          print('Auth endpoint error: ${e.message}');
        }
      }
    });
  });
} 