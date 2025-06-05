import 'package:foresight_care/domain/entities/user.dart';
import 'package:foresight_care/domain/repositories/user_profile_repository.dart';

class GetCurrentUserUseCase {
  final UserProfileRepository _repository;

  GetCurrentUserUseCase(this._repository);

  Future<User> call(String userId) async {
    return await _repository.getCurrentUser(userId);
  }
}

class UpdateUserProfileUseCase {
  final UserProfileRepository _repository;

  UpdateUserProfileUseCase(this._repository);

  Future<User> call(String userId, UpdateUserRequest request) async {
    return await _repository.updateUserProfile(userId, request);
  }
} 