import 'package:project_hub/domain/entities/user.dart';

class UserDataSource {
  Future<User> login(String email, String password) async {
    // Implement your login logic here
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '1', name: 'Test User', email: email, password: '', profilePicture: '', bio: '');
  }

  Future<void> logout() async {
    // Implement your logout logic here
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<User> fetchProfile() async {
    // Implement your profile fetching logic here
    await Future.delayed(const Duration(seconds: 1));
    return User(id: '1', name: 'Test User', email: 'test@example.com', password: '', profilePicture: '', bio: '');
  }

  Future<void> updateProfile(User user) async {
    // Implement your profile update logic here
    await Future.delayed(const Duration(seconds: 1));
  }
}
