import 'package:foresight_care/domain/entities/user.dart';

abstract class UserProfileRepository {
  Future<User> getCurrentUser(String userId);
  Future<User> updateUserProfile(String userId, UpdateUserRequest request);
} 