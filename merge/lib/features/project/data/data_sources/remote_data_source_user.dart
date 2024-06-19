import 'package:merge/core/network/api_client.dart';
import 'package:merge/features/project/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> loginUser(String email, String password);
  Future<void> signUpUser(UserModel user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UserModel> loginUser(String email, String password) async {
    final response = await apiClient.post('/users/login', {
      'email': email,
      'password': password,
    });

    // Extract the token and user information from the response
    final responseBody = response;
    apiClient.setToken(responseBody['token']); // Set the token in the ApiClient
    return UserModel.fromJson(responseBody['user']);
  }

  @override
  Future<void> signUpUser(UserModel user) async {
    await apiClient.post('/users/signup', {
      'email': user.email,
      'password': user.password,
    });
  }
}
