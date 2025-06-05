import 'package:flutter_test/flutter_test.dart';
import 'package:foresight_care/core/network/api_client.dart' as api;
import 'package:foresight_care/domain/entities/user.dart';

void main() {
  group('LoginResponse Tests', () {
    test('should parse backend response correctly', () {
      // This is the actual response format from your backend
      final backendResponse = {
        "status": "Authentification reussite",
        "role": "admin",
        "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4MmJjMDE4NzFkODM0MDc1NmY1MzQ4NCIsInJvbGUiOiJhZG1pbiIsImNpbiI6ODg4ODg4ODgsInNleGUiOiJmZW1tZSIsImlhdCI6MTc0ODIwOTE1NCwiZXhwIjoxNzQ4Mjk1NTU0fQ.s2Stmv7kqwce8OhHrfpF3L8b_vmB_1K6aIx16AJgf70",
        "archived": false
      };

      print('🧪 Testing LoginResponse.fromJson with backend response...');
      
      try {
        final loginResponse = api.LoginResponse.fromJson(backendResponse);
        
        print('✅ LoginResponse parsed successfully!');
        print('Token: ${loginResponse.accessToken.substring(0, 20)}...');
        print('User ID: ${loginResponse.user.id}');
        print('User Role: ${loginResponse.user.role}');
        print('User CIN: ${loginResponse.user.cin}');
        print('User Gender: ${loginResponse.user.sexe}');
        print('User Archived: ${loginResponse.user.archived}');
        
        // Verify the parsing worked
        expect(loginResponse.accessToken, isNotEmpty);
        expect(loginResponse.user.role, equals(UserRole.admin));
        expect(loginResponse.user.cin, equals(88888888));
        expect(loginResponse.user.sexe, equals(Gender.femme));
        expect(loginResponse.user.archived, equals(false));
        
        print('✅ All assertions passed!');
        
      } catch (e, stackTrace) {
        print('❌ Error parsing LoginResponse: $e');
        print('Stack trace: $stackTrace');
        fail('LoginResponse parsing failed: $e');
      }
    });

    test('should handle missing token gracefully', () {
      final responseWithoutToken = {
        "status": "Authentification reussite",
        "role": "admin",
        "archived": false
      };

      try {
                 final loginResponse = api.LoginResponse.fromJson(responseWithoutToken);
        
        expect(loginResponse.accessToken, equals(''));
        expect(loginResponse.user.role, equals(UserRole.admin));
        
        print('✅ Handled missing token gracefully');
        
      } catch (e) {
        fail('Should handle missing token gracefully: $e');
      }
    });

    test('should handle invalid role gracefully', () {
      final responseWithInvalidRole = {
        "status": "Authentification reussite",
        "role": "invalid_role",
        "token": "dummy_token",
        "archived": false
      };

      try {
                 final loginResponse = api.LoginResponse.fromJson(responseWithInvalidRole);
        
        expect(loginResponse.user.role, equals(UserRole.admin)); // Default fallback
        
        print('✅ Handled invalid role gracefully');
        
      } catch (e) {
        fail('Should handle invalid role gracefully: $e');
      }
    });
  });
} 