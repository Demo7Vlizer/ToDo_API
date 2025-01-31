import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class PatchExample extends ApiService {
  Future<bool> partialUpdateTodo(String id, {String? title, String? description}) async {
    try {
      // Only include fields that are not null
      Map<String, dynamic> updates = {};
      if (title != null) updates['title'] = title;
      if (description != null) updates['dec'] = description;

      final response = await http.patch(
        Uri.parse('$baseUrl/$id'),
        headers: headers,
        body: jsonEncode(updates),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error updating todo: $e');
      return false;
    }
  }
} 