// test/features/project/presentation/bloc/user_auth_cubit_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:merge/features/project/domain/user/repository/user_repository.dart';
import 'package:merge/features/project/presentation/bloc/user_auth_cubit.dart';
import 'package:merge/features/project/domain/user/entity/user.dart';
import 'package:merge/core/failures/failures.dart';

import 'user_auth_cubit_test.mocks.dart';

@GenerateMocks([IUserRepository])
void main() {
  late MockIUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockIUserRepository();
  });

  group('UserAuthCubit', () {
    blocTest<UserAuthCubit, UserAuthState>(
      'emits [UserAuthState.authenticated] when login is successful',
      build: () {
        when(mockUserRepository.loginUser(any, any))
            .thenAnswer((_) async => Right(User(id: '1', firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com', password: '')));
        return UserAuthCubit(mockUserRepository);
      },
      act: (cubit) => cubit.login('john.doe@example.com', 'password'),
      expect: () => [
        UserAuthState.authenticated(User(id: '1', firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com', password: '')),
      ],
    );

    blocTest<UserAuthCubit, UserAuthState>(
      'emits [UserAuthState.error] when login fails',
      build: () {
        when(mockUserRepository.loginUser(any, any))
            .thenAnswer((_) async => const Left(ServerFailure('Login failed')));
        return UserAuthCubit(mockUserRepository);
      },
      act: (cubit) => cubit.login('john.doe@example.com', 'wrong_password'),
      expect: () => [
        UserAuthState.error('Login failed'),
      ],
    );
  });
}
