import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_poject/controllers/api/Todo_Controller.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TodoController controller = Get.find();

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
          'Add Task',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      detailController.text.isNotEmpty) {
                    controller
                        .addTodo(titleController.text, detailController.text)
                        .then((_) => Get.back());
                  }
                },
                child: Text(
                  'ADD',
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
