import 'package:project_hub/domain/entities/user.dart';
import 'package:project_hub/domain/repositories/user_repository.dart';
import 'package:project_hub/infrastructure/data_sources/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<User> login(String email, String password) async {
    return await userDataSource.login(email, password);
  }

  @override
  Future<void> logout() async {
    return await userDataSource.logout();
  }

  @override
  Future<User> fetchProfile() async {
    return await userDataSource.fetchProfile();
  }

  @override
  Future<void> updateProfile(User user) async {
    return await userDataSource.updateProfile(user);
  }
}
