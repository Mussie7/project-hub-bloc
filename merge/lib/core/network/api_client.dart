// core/network/api_client.dart
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  final String baseUrl;
  String? _token;
  http.Client client;

  ApiClient({required this.baseUrl, http.Client? client}) : client = client ?? http.Client();

  void setToken(String token) {
    _token = token;
  }

  void setClient(http.Client newClient) {
    client = newClient;
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    print(url);
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
    try {
      final response = await http
          .post(
            url,
            headers: headers,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 60)); // Add timeout

      if (response.statusCode < 200 || response.statusCode >= 300) {
        print(1);
        throw HttpException('Failed to load data: ${response.reasonPhrase}');
      }
      print(response.body);
      return json.decode(response.body);
    } on SocketException catch (e) {
      print(2);
      throw Exception('No Internet connection: $e');
    } on TimeoutException catch (e) {
      print(3);
      throw Exception('Request timed out: $e');
    } on HttpException catch (e) {
      print(4);
      throw Exception('HTTP error: $e');
    } catch (e) {
      print(5);
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        if (_token != null) 'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Add other methods like put, delete if needed
}
