// domain/user/usecases/user_login.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';

import 'package:merge/features/project/domain/user/entity/user.dart';
import 'package:merge/features/project/domain/user/repository/user_repository.dart';

class UserLogin {
  final IUserRepository userRepository;

  UserLogin(this.userRepository);

  Future<Either<Failure, User>> call(String email, String password) async {
    return await userRepository.loginUser(email, password);
  }
}
