import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:merge/core/network/api_client.dart';
import 'package:merge/main.dart';  // Import your main app file
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_integration_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create a new file called auth_integration_test.mocks.dart:
@GenerateMocks([http.Client])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Authentication Integration Tests', () {
    testWidgets('User can log in successfully', (WidgetTester tester) async {
      // Create a mock client.
      final client = MockClient();

      // Mock the login API response.
      when(client.post(
        Uri.parse('https://mussie-project.onrender.com/users/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
        jsonEncode({
          'user': {
            '_id': '6672f568f4ea4a67aacb86da',
            'email': 'mussie@gmail.com',
            'role': 'user',
            '__v': 0
          },
          'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjcyZjU2OGY0ZWE0YTY3YWFjYjg2ZGEiLCJlbWFpbCI6Im11c3NpZUBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTcxODgxMzk4OCwiZXhwIjoxNzI2NTg5OTg4fQ.1BjHw8CyacTqq_0qh0IHoaWJRWYW7beqLHH8o3BvtL4'
        }),
        200,
      ));

      // Inject the mock client into your app.
      // You might need to adjust this depending on how you inject dependencies.
      final apiClient = ApiClient(baseUrl: 'https://mussie-project.onrender.com/api');
      apiClient.setClient(client); // Assuming you have a method to set the client.

      // Run the app.
      await tester.pumpWidget(MyApp(apiClient: apiClient,));

      // Enter email and password.
      await tester.enterText(find.byKey(const Key('emailField')), 'mussie@gmail.com');
      await tester.enterText(find.byKey(const Key('passwordField')), 'password');

      // Tap the login button.
      await tester.tap(find.byKey(const Key('loginButton')));

      // Rebuild the widget after the state has changed.
      await tester.pumpAndSettle();

      // Verify if the user is navigated to the projects page.
      expect(find.text('Projects'), findsOneWidget);
    });
  });
}
