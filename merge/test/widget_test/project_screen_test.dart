// test/widget_test/project_screen_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:merge/features/project/presentation/bloc/project_cubit.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/pages/screens/projects.dart';

import '../mocks.mocks.dart';

void main() {
  late MockProjectCubit mockProjectCubit;

  setUp(() {
    mockProjectCubit = MockProjectCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ProjectCubit>(
        create: (context) => mockProjectCubit,
        child: const ProjectScreen2(),
      ),
    );
  }

  group('ProjectScreen2', () {
    testWidgets('renders list of projects', (WidgetTester tester) async {
      final projects = [
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
      ];

      when(mockProjectCubit.state).thenReturn(ProjectState.success(projects));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Test Project'), findsOneWidget);
    });

    testWidgets('renders error message when there is an error', (WidgetTester tester) async {
      when(mockProjectCubit.state).thenReturn(ProjectState.error('Error occurred'));

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Error: Error occurred'), findsOneWidget);
    });

    testWidgets('renders no projects available message when there are no projects', (WidgetTester tester) async {
      when(mockProjectCubit.state).thenReturn(ProjectState.initial());

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('No projects available.'), findsOneWidget);
    });
  });
}
