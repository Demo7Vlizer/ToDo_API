import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_poject/models/todo.model.dart';

class TodoController extends GetxController {
  var TodoList = RxList<TodoModel>();
  var CompletedList = RxList<TodoModel>();
  final String baseUrl = 'https://679c68d087618946e65216b3.mockapi.io/api/todolist';

  @override
  void onInit() {
    super.onInit();
    getTodoList();
  }

  // GET - Fetch all todos
  Future<void> getTodoList() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      TodoList.clear();
      CompletedList.clear();
      for (Map<String, dynamic> index in data) {
        var todo = TodoModel.fromJson(index);
        if (todo.isCompleted) {
          CompletedList.add(todo);
        } else {
          TodoList.add(todo);
        }
      }
    }
  }

  // POST - Create new todo
  Future<void> addTodo(String title, String description) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'dec': description,
      }),
    );
    if (response.statusCode == 201) {
      getTodoList(); // Refresh the list
    }
  }

  // PUT - Update todo
  Future<void> editTodo(String id, String newTitle, String newDescription) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': newTitle,
        'dec': newDescription,
      }),
    );
    if (response.statusCode == 200) {
      getTodoList(); // Refresh the list
    }
  }

  // DELETE - Remove todo
  Future<void> deleteTodo(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      getTodoList(); // Refresh the list
    }
  }

  // Add this method to toggle completion
  Future<void> toggleCompletion(TodoModel todo) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${todo.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': todo.title,
        'dec': todo.dec,
        'isCompleted': !todo.isCompleted,
      }),
    );
    if (response.statusCode == 200) {
      getTodoList(); // Refresh the list
    }
  }
}
