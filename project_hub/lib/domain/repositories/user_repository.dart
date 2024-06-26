import '../entities/user.dart';

abstract class UserRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<User> fetchProfile();
  Future<void> updateProfile(User user);
}
