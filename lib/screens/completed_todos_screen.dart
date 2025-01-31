import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_poject/controllers/api/Todo_Controller.dart';
import 'package:new_poject/components/todo_item.dart';

class CompletedTodosScreen extends StatelessWidget {
  final TodoController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Completed Tasks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF9B8ADB),
        elevation: 0,
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.CompletedList.length,
          itemBuilder: (context, index) {
            return TodoItem(todo: controller.CompletedList[index]);
          },
        ),
      ),
    );
  }
} 