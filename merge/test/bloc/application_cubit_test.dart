// test/features/project/presentation/bloc/application_cubit_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:merge/features/project/domain/application/repository/app_repo.dart';
import 'package:merge/features/project/presentation/bloc/application_cubit.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';
import 'package:merge/core/failures/failures.dart';

import 'application_cubit_test.mocks.dart';

@GenerateMocks([IApplicationRepository])
void main() {
  late MockIApplicationRepository mockApplicationRepository;

  setUp(() {
    mockApplicationRepository = MockIApplicationRepository();
  });

  group('ApplicationCubit', () {
    blocTest<ApplicationCubit, ApplicationState>(
      'emits [ApplicationState.success] when getApplicationsByProjectId is successful',
      build: () {
        when(mockApplicationRepository.getApplicationsByProjectId(any))
            .thenAnswer((_) async => const Right([
                  Application(
                    projectId: '1',
                    resumeFileName: 'resume.pdf', firstName: '', lastName: '', email: '', experience: '', bio: '',

                  )
                ]));
        return ApplicationCubit(mockApplicationRepository);
      },
      act: (cubit) => cubit.getApplicationsByProjectId('1'),
      expect: () => [
        isA<ApplicationState>().having((s) => s.applications, 'applications', isNotEmpty),
      ],
    );

    blocTest<ApplicationCubit, ApplicationState>(
      'emits [ApplicationState.error] when getApplicationsByProjectId fails',
      build: () {
        when(mockApplicationRepository.getApplicationsByProjectId(any))
            .thenAnswer((_) async => const Left(ServerFailure('Get applications failed')));
        return ApplicationCubit(mockApplicationRepository);
      },
      act: (cubit) => cubit.getApplicationsByProjectId('1'),
      expect: () => [
        ApplicationState.error('Get applications failed'),
      ],
    );
  });
}
