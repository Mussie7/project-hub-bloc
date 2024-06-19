// domain/user/usecases/user_signup.dart

import 'package:dartz/dartz.dart';
import 'package:merge/core/failures/failures.dart';

import 'package:merge/features/project/domain/user/entity/user.dart';
import 'package:merge/features/project/domain/user/repository/user_repository.dart';

class UserSignup {
  final IUserRepository userRepository;

  UserSignup(this.userRepository);

  Future<Either<Failure, void>> call(User user) async {
    return await userRepository.signUpUser(user);
  }
}
