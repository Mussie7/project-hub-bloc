// test/widget_test/login_page_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:merge/features/project/presentation/bloc/user_auth_cubit.dart';
import 'package:merge/features/project/presentation/pages/screens/loginpage.dart';

import '../mocks.mocks.dart';

void main() {
  late MockUserAuthCubit mockUserAuthCubit;

  setUp(() {
    mockUserAuthCubit = MockUserAuthCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<UserAuthCubit>(
        create: (context) => mockUserAuthCubit,
        child: const LoginPage(),
      ),
    );
  }

  group('LoginPage', () {
    testWidgets('renders login form', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Log in'), findsOneWidget);
      expect(find.text('Welcome'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Log in'), findsOneWidget);
    });

    testWidgets('shows error message when login fails', (WidgetTester tester) async {
      when(mockUserAuthCubit.state).thenReturn(UserAuthState.error('Login failed'));

      await tester.pumpWidget(createWidgetUnderTest());

      await tester.pump(); // Rebuild the widget

      expect(find.text('Login failed'), findsOneWidget);
    });
  });
}
