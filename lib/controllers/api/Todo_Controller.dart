import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_poject/models/todo.model.dart';
import 'package:new_poject/controllers/loading_controller.dart';
import 'package:flutter/material.dart';

class TodoController extends GetxController {
  final loadingController = Get.put(LoadingController());
  var TodoList = RxList<TodoModel>();
  var CompletedList = RxList<TodoModel>();
  final String baseUrl =
      'https://679c68d087618946e65216b3.mockapi.io/api/todolist';

  @override
  void onInit() {
    super.onInit();
    getTodoList();
  }

  // GET - Fetch all todos
  Future<void> getTodoList() async {
    loadingController.startFetching();
    try {
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
        update(); // Trigger UI update
      }
    } catch (e) {
      print('Error fetching todos: $e');
    } finally {
      loadingController.stopFetching();
    }
  }

  // POST - Create new todo
  Future<void> addTodo(String title, String description) async {
    loadingController.startCreating();
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'dec': description,
          'isCompleted': false,
        }),
      );
      if (response.statusCode == 201) {
        await getTodoList(); // Refresh the list
        Get.back(); // Close dialog
        Get.snackbar('Success', 'Todo added successfully',
            backgroundColor: Color(0xFF9B8ADB), colorText: Colors.white);
      }
    } catch (e) {
      print('Error adding todo: $e');
      Get.snackbar('Error', 'Failed to add todo',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      loadingController.stopCreating();
    }
  }

  // PUT - Update todo
  Future<void> editTodo(
      String id, String newTitle, String newDescription) async {
    loadingController.startUpdating();
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': newTitle,
          'dec': newDescription,
        }),
      );
      if (response.statusCode == 200) {
        await getTodoList(); // Refresh the list
        Get.back(); // Close dialog
        Get.snackbar('Success', 'Todo updated successfully',
            backgroundColor: Color(0xFF9B8ADB), colorText: Colors.white);
      }
    } catch (e) {
      print('Error updating todo: $e');
      Get.snackbar('Error', 'Failed to update todo',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      loadingController.stopUpdating();
    }
  }

  // DELETE - Remove todo
  Future<void> deleteTodo(String id) async {
    loadingController.startDeleting();
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        await getTodoList(); // Refresh the list
        Get.snackbar('Success', 'Todo deleted successfully',
            backgroundColor: Color(0xFF9B8ADB), colorText: Colors.white);
      }
    } catch (e) {
      print('Error deleting todo: $e');
      Get.snackbar('Error', 'Failed to delete todo',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      loadingController.stopDeleting();
    }
  }

  // Add this method to toggle completion
  Future<void> toggleCompletion(TodoModel todo) async {
    loadingController.startUpdating();
    try {
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
        await getTodoList(); // Refresh the list
      }
    } catch (e) {
      print('Error toggling completion: $e');
    } finally {
      loadingController.stopUpdating();
    }
  }
}
