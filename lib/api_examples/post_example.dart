import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_poject/models/todo.model.dart';
import 'api_service.dart';

class PostExample extends ApiService {
  Future<TodoModel?> createTodo(String title, String description) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode({
          'title': title,
          'dec': description,
        }),
      );

      if (response.statusCode == 201) {
        return TodoModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create todo');
      }
    } catch (e) {
      print('Error creating todo: $e');
      return null;
    }
  }
} 