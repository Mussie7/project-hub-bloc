// test/widget_test/application_form_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/bloc/application_cubit.dart';
import 'package:merge/features/project/presentation/pages/screens/applicationForm.dart';

import '../mocks.mocks.dart';

void main() {
  late MockApplicationCubit mockApplicationCubit;
  final project = Project(
    id: '1',
    projectName: 'Test Project',
    projectDescription: 'Description',
    specialization: Specialization.frontEnd,
    techStacks: const [TechStack.react],
    applicationDeadline: DateTime.now(),
    intakeNumber: 5,
    projectDurationInDays: 30,
    createdBy: 'user',
  );

  setUp(() {
    mockApplicationCubit = MockApplicationCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ApplicationCubit>(
        create: (context) => mockApplicationCubit,
        child: ApplicationForm(project: project),
      ),
    );
  }

  group('ApplicationForm', () {
    testWidgets('renders application form', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('First Name'), findsOneWidget);
      expect(find.text('Last Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Experience'), findsOneWidget);
      expect(find.text('Bio'), findsOneWidget);
      expect(find.text('Upload Resume'), findsOneWidget);
    });

    testWidgets('shows error message when form is invalid', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.tap(find.text('Apply'));
      await tester.pump();

      expect(find.text('Please enter your first name'), findsOneWidget);
    });

    testWidgets('submits application when form is valid', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.enterText(find.byType(TextFormField).at(0), 'John');
      await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
      await tester.enterText(find.byType(TextFormField).at(2), 'john.doe@example.com');
      await tester.enterText(find.byType(TextFormField).at(3), '5 years');
      await tester.enterText(find.byType(TextFormField).at(4), 'Bio');
      await tester.tap(find.text('Upload Resume'));
      await tester.pump();

      await tester.tap(find.text('Apply'));
      await tester.pump();

      verify(mockApplicationCubit.submitApplication(any)).called(1);
    });
  });
}
