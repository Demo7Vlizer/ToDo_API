import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_poject/controllers/api/Todo_Controller.dart';
import 'package:new_poject/models/todo.model.dart';

class EditTodoScreen extends StatelessWidget {
  final TodoModel todo;
  final TextEditingController titleController;
  final TextEditingController detailController;
  final TodoController controller = Get.find();

  EditTodoScreen({required this.todo})
      : titleController = TextEditingController(text: todo.title),
        detailController = TextEditingController(text: todo.dec);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Edit Task',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF9B8ADB),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: detailController,
              decoration: InputDecoration(
                hintText: 'Detail',
                border: UnderlineInputBorder(),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty &&
                          detailController.text.isNotEmpty) {
                        controller
                            .editTodo(todo.id, titleController.text,
                                detailController.text)
                            .then((_) => Get.back());
                      }
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(color: Color(0xFF9B8ADB), fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      side: BorderSide(color: Color(0xFF9B8ADB)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9B8ADB),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
