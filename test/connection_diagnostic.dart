import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

void main() {
  group('🔍 Connection Diagnostic Tests', () {
    test('📋 System Information', () {
      print('=== SYSTEM DIAGNOSTIC ===');
      AppConstants.printNetworkConfig();
      print('Target URL: ${AppConstants.baseUrl}');
      print('Connect Timeout: ${AppConstants.connectTimeout}ms');
      print('Request Timeout: ${AppConstants.requestTimeout}ms');
      print('');
    });

    test('🌐 Test Multiple Endpoints', () async {
      final endpoints = [
        'http://localhost:3000',
        'http://127.0.0.1:3000',
        'http://10.0.2.2:3000',
        'http://192.168.1.2:3000',
      ];

      print('=== ENDPOINT CONNECTIVITY TEST ===');
      
      for (final endpoint in endpoints) {
        print('Testing: $endpoint');
        
        final dio = Dio(BaseOptions(
          baseUrl: endpoint,
          connectTimeout: const Duration(milliseconds: 3000),
          receiveTimeout: const Duration(milliseconds: 3000),
        ));

        try {
          final response = await dio.get('/');
          print('✅ $endpoint - Status: ${response.statusCode}');
        } on DioException catch (e) {
          if (e.type == DioExceptionType.connectionTimeout) {
            print('⏱️ $endpoint - Connection Timeout');
          } else if (e.type == DioExceptionType.connectionError) {
            print('❌ $endpoint - Connection Refused');
          } else if (e.response?.statusCode != null) {
            print('✅ $endpoint - Status: ${e.response!.statusCode} (Server reachable)');
          } else {
            print('❓ $endpoint - ${e.type}: ${e.message}');
          }
        } catch (e) {
          print('💥 $endpoint - Unexpected error: $e');
        }
      }
      print('');
    });

    test('🔐 Test Auth Endpoint', () async {
      print('=== AUTH ENDPOINT TEST ===');
      print('Testing: ${AppConstants.baseUrl}/auth/login');
      
      final dio = Dio(BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      ));

      try {
        final response = await dio.post('/auth/login', data: {
          'cin': 'test',
          'mdp': 'test'
        });
        print('✅ Auth endpoint responded - Status: ${response.statusCode}');
      } on DioException catch (e) {
        if (e.response?.statusCode == 400) {
          print('✅ Auth endpoint working - Status: 400 (Bad Request - Expected)');
        } else if (e.response?.statusCode == 401) {
          print('✅ Auth endpoint working - Status: 401 (Unauthorized - Expected)');
        } else if (e.type == DioExceptionType.connectionTimeout) {
          print('⏱️ Auth endpoint - Connection Timeout');
          print('❌ Backend is not accessible from Android emulator');
        } else if (e.type == DioExceptionType.connectionError) {
          print('❌ Auth endpoint - Connection Refused');
          print('❌ Backend is not running or not accessible');
        } else {
          print('❓ Auth endpoint - ${e.type}: ${e.message}');
        }
      }
      print('');
    });

    test('📊 Network Diagnostic Summary', () {
      print('=== DIAGNOSTIC SUMMARY ===');
      print('');
      print('🔧 TROUBLESHOOTING STEPS:');
      print('');
      print('1. Check Backend Status:');
      print('   - Ensure NestJS backend is running');
      print('   - Backend should show: "Application is running on: http://0.0.0.0:3000"');
      print('   - NOT: "Application running on: http://[::1]:3000"');
      print('');
      print('2. Test Backend Manually:');
      print('   - Open Command Prompt');
      print('   - Run: curl http://localhost:3000');
      print('   - Should return 404 error (this is good!)');
      print('');
      print('3. Restart Backend with Correct Host:');
      print('   - Stop current backend (Ctrl+C)');
      print('   - Run: npm run start:dev -- --host 0.0.0.0');
      print('   - Or update main.ts: await app.listen(3000, "0.0.0.0");');
      print('');
      print('4. Check Windows Firewall:');
      print('   - Allow Node.js through Windows Defender Firewall');
      print('   - For both Private and Public networks');
      print('');
      print('5. Alternative Solutions:');
      print('   - Try real device instead of emulator');
      print('   - Use your computer\'s IP: http://192.168.1.2:3000');
      print('   - Check if port 3000 is blocked');
      print('');
      print('📞 If still having issues, share:');
      print('   - Backend startup logs');
      print('   - Output of: netstat -an | findstr :3000');
      print('   - This diagnostic test output');
    });
  });
} 