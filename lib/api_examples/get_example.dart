import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_poject/models/todo.model.dart';
import 'api_service.dart';

class GetExample extends ApiService {
  // Get all todos
  Future<List<TodoModel>> getAllTodos() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List;
        return jsonData.map((item) => TodoModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      print('Error fetching todos: $e');
      return [];
    }
  }

  // Get single todo by ID
  Future<TodoModel?> getTodoById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      
      if (response.statusCode == 200) {
        return TodoModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Todo not found');
      }
    } catch (e) {
      print('Error fetching todo: $e');
      return null;
    }
  }
} 