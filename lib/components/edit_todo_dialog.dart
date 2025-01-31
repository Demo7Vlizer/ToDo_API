import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_poject/controllers/api/Todo_Controller.dart';

void showEditTodoDialog(BuildContext context, String id, String currentTitle, String currentDesc) {
  final TextEditingController titleController = TextEditingController(text: currentTitle);
  final TextEditingController descController = TextEditingController(text: currentDesc);
  final TodoController controller = Get.find();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Edit Task ✏️',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {
                      if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
                        controller.editTodo(id, titleController.text, descController.text).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Text(
                      'UPDATE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
} 