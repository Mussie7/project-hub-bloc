import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:merge/core/network/api_client.dart'; // Update the import path

// Generates the 'api_client_test.mocks.dart' file
@GenerateMocks([http.Client])
import 'api_client_test.mocks.dart';

void main() {
  const baseUrl = 'https://mussie-project.onrender.com/api';
  late ApiClient apiClient;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    apiClient = ApiClient(baseUrl: baseUrl);
  });

  group('ApiClient', () {
    test('successful POST request', () async {
      const endpoint = '/users/login';
      final data = {'email': 'mussie@gmail.com', 'password': '12345678'};
      final responsePayload = {'user': {
              '_id': '6672f568f4ea4a67aacb86da',
              'email': 'mussie@gmail.com',
              'password': "",
              'role': 'user',
              '__v': 0
            },
            'token': 'fake_token'};

      when(mockHttpClient.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: anyNamed('headers'),
        body: json.encode(data),
      )).thenAnswer((_) async => http.Response(json.encode(responsePayload), 200));

      final response = await apiClient.post(endpoint, data);

      // expect(response.statusCode, 200);
      expect(response, responsePayload);
    });

  //   test('failed POST request', () async {
  //     const endpoint = '/users/login';
  //     final data = {'email': 'mussie@gmail.com', 'password': 'wrong_password'};
  //     final responsePayload = {'message': 'Invalid credentials'};

  //     when(mockHttpClient.post(
  //       Uri.parse('$baseUrl$endpoint'),
  //       headers: anyNamed('headers'),
  //       body: json.encode(data),
  //     )).thenAnswer((_) async => http.Response(json.encode(responsePayload), 401));

  //     expect(() => apiClient.post(endpoint, data), throwsException);
  //   });

  //   test('successful GET request', () async {
  //     const endpoint = '/projects';
  //     final responsePayload = {'data': 'some data'};

  //     when(mockHttpClient.get(
  //       Uri.parse('$baseUrl$endpoint'),
  //       headers: anyNamed('headers'),
  //     )).thenAnswer((_) async => http.Response(json.encode(responsePayload), 200));

  //     final response = await apiClient.get(endpoint);

  //     expect(response, responsePayload);
  //   });

  //   test('failed GET request', () async {
  //     const endpoint = '/some-endpoint';

  //     when(mockHttpClient.get(
  //       Uri.parse('$baseUrl$endpoint'),
  //       headers: anyNamed('headers'),
  //     )).thenAnswer((_) async => http.Response('Not Found', 404));

  //     expect(() => apiClient.get(endpoint), throwsException);
  //   });
  });
}
