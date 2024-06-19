// test/features/project/presentation/bloc/project_cubit_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:merge/features/project/domain/project/repository/pro_repo.dart';
import 'package:merge/features/project/presentation/bloc/project_cubit.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/core/failures/failures.dart';

import 'project_cubit_test.mocks.dart';

@GenerateMocks([IProjectRepository])
void main() {
  late MockIProjectRepository mockProjectRepository;

  setUp(() {
    mockProjectRepository = MockIProjectRepository();
  });

  group('ProjectCubit', () {
    blocTest<ProjectCubit, ProjectState>(
      'emits [ProjectState.success] when getProjects is successful',
      build: () {
        when(mockProjectRepository.getProjects())
            .thenAnswer((_) async => Right([
                  Project(
                    id: '1',
                    projectName: 'Test Project',
                    projectDescription: 'Description',
                    specialization: Specialization.frontEnd,
                    techStacks: const [TechStack.react],
                    applicationDeadline: DateTime.now(),
                    intakeNumber: 5,
                    projectDurationInDays: 30,
                    createdBy: 'user',
                  )
                ]));
        return ProjectCubit(mockProjectRepository);
      },
      act: (cubit) => cubit.getProjects(),
      expect: () => [
        isA<ProjectState>().having((s) => s.projects, 'projects', isNotEmpty),
      ],
    );

    blocTest<ProjectCubit, ProjectState>(
      'emits [ProjectState.error] when getProjects fails',
      build: () {
        when(mockProjectRepository.getProjects())
            .thenAnswer((_) async => const Left(ServerFailure('Get projects failed')));
        return ProjectCubit(mockProjectRepository);
      },
      act: (cubit) => cubit.getProjects(),
      expect: () => [
        ProjectState.error('Get projects failed'),
      ],
    );
  });
}
