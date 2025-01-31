import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_poject/controllers/api/Todo_Controller.dart';
import 'package:new_poject/models/todo.model.dart';
import 'package:new_poject/screens/edit_todo_screen.dart';

class TodoItem extends StatelessWidget {
  final TodoModel todo;
  final TodoController controller = Get.find();

  TodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          todo.title,
          style: TextStyle(
            color: Color(0xFF9B8ADB),
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(todo.dec),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Image.asset('assets/img/Pencil.png', height: 100),
              onPressed: () => Get.to(() => EditTodoScreen(todo: todo)),
            ),
            IconButton(
              icon: Image.asset('assets/img/Trash.png', height: 100),
              onPressed: () => controller.deleteTodo(todo.id),
            ),
            IconButton(
              icon: Image.asset(
                todo.isCompleted
                    ? 'assets/img/CheckCircle.png'
                    : 'assets/img/CheckCircle.png',
                height: 100,
                color: todo.isCompleted ? Color(0xFF9B8ADB) : null,
              ),
              onPressed: () => controller.toggleCompletion(todo),
            ),
          ],
        ),
      ),
    );
  }
}
