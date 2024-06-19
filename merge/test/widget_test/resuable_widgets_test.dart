import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';

void main() {
  group('ReusableWidgets', () {
    testWidgets('CustomElevatedButton renders correctly', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomElevatedButton(
              text: 'Press me',
              onPressed: () {
                pressed = true;
              },
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
          ),
        ),
      );

      expect(find.text('Press me'), findsOneWidget);

      await tester.tap(find.text('Press me'));
      expect(pressed, true);
    });

    testWidgets('InputFieldWidget renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: InputFieldWidget(hintText: 'Enter text'),
          ),
        ),
      );

      expect(find.text('Enter text'), findsOneWidget);
    });

    testWidgets('SubmitButtonWidget renders correctly', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SubmitButtonWidget(
              text: 'Submit',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);

      await tester.tap(find.text('Submit'));
      expect(pressed, true);
    });

    testWidgets('NavigationRowWidget renders correctly', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NavigationRowWidget(
              text: "Don't have an account?",
              actionText: 'Sign Up',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.text("Don't have an account?"), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);

      await tester.tap(find.text('Sign Up'));
      expect(pressed, true);
    });

    testWidgets('SocialMediaButtonWidget renders correctly', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SocialMediaButtonWidget(
              icon: Icons.g_translate,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.g_translate), findsOneWidget);

      await tester.tap(find.byIcon(Icons.g_translate));
      expect(pressed, true);
    });

    testWidgets('SectionHeader renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionHeader(
              title: 'Title',
              subtitle: 'Subtitle',
              icon: Icon(Icons.star),
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('AppForm renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppForm(
              formFields: [TextFormField()],
              sectionHeaderTitle: 'Title',
              sectionHeaderSubtitle: 'Subtitle',
              sectionHeaderIcon: const Icon(Icons.star),
              buttonText: 'Submit',
              onButtonPressed: () {},
              formKey: GlobalKey<FormState>(),
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
    });
  });
}
