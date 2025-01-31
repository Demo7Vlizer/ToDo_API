import 'package:get/get.dart';
import 'package:new_poject/models/todo.model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;

  void addTodo(String title, String description) {
    todos.add(
      TodoModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        dec: description,
      ),
    );
  }

  void toggleTodo(String id) {
    // Since we removed isDone, you might want to handle this differently
    // or remove this method if it's no longer needed
  }

  void deleteTodo(String id) {
    todos.removeWhere((element) => element.id == id);
  }

  void editTodo(String id, String newTitle, String newDescription) {
    final index = todos.indexWhere((element) => element.id == id);
    if (index != -1) {
      todos[index].title = newTitle;
      todos[index].dec = newDescription;
      todos.refresh();
    }
  }
}