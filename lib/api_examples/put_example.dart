import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class PutExample extends ApiService {
  Future<bool> updateTodo(String id, String title, String description) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
        body: jsonEncode({
          'title': title,
          'dec': description,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error updating todo: $e');
      return false;
    }
  }
} 