import 'package:http/http.dart' as http;
import 'api_service.dart';

class DeleteExample extends ApiService {
  Future<bool> deleteTodo(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting todo: $e');
      return false;
    }
  }
} 