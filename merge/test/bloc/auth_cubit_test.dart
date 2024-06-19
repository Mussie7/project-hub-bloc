// test/features/project/presentation/bloc/auth_cubit_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:merge/features/project/domain/admin/repository/admin_repository.dart';
import 'package:merge/features/project/presentation/bloc/auth_cubit.dart';
import 'package:merge/core/failures/failures.dart';

import 'auth_cubit_test.mocks.dart';

@GenerateMocks([IAdminRepository])
void main() {
  late MockIAdminRepository mockAdminRepository;

  setUp(() {
    mockAdminRepository = MockIAdminRepository();
  });

  group('AuthCubit', () {
    blocTest<AuthCubit, AuthState>(
      'emits [AuthState.authenticated] when login is successful',
      build: () {
        when(mockAdminRepository.loginAdmin(any, any))
            .thenAnswer((_) async => const Right(null));
        return AuthCubit(mockAdminRepository);
      },
      act: (cubit) => cubit.login('admin@example.com', 'password'),
      expect: () => [
        AuthState.authenticated(),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'emits [AuthState.error] when login fails',
      build: () {
        when(mockAdminRepository.loginAdmin(any, any))
            .thenAnswer((_) async => const Left(ServerFailure('Login failed')));
        return AuthCubit(mockAdminRepository);
      },
      act: (cubit) => cubit.login('admin@example.com', 'wrong_password'),
      expect: () => [
        AuthState.error('Login failed'),
      ],
    );
  });
}
