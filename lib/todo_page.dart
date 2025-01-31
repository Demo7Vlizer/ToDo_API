import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_poject/components/loading/loading_overlay.dart';
import 'package:new_poject/controllers/api/Todo_Controller.dart';
import 'package:new_poject/components/todo_item.dart';
import 'package:new_poject/screens/add_todo_screen.dart';
import 'package:new_poject/screens/completed_todos_screen.dart';
import 'package:new_poject/components/loading/todo_skeleton.dart';
import 'package:new_poject/controllers/loading_controller.dart';

class TodoPage extends StatelessWidget {
  final TodoController controller = Get.put(TodoController());
  final LoadingController loadingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TODO APP',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/img/calendar.png', height: 60),
          ],
        ),
        backgroundColor: Color(0xFF9B8ADB),
        elevation: 0,
      ),
      body: Obx(
        () => Stack(
          children: [
            loadingController.isFetching.value
                ? ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: controller.TodoList.length > 0
                        ? controller.TodoList.length
                        : 3, // Show 3 skeletons if list is empty
                    itemBuilder: (context, index) => TodoSkeleton(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: controller.TodoList.length,
                    itemBuilder: (context, index) {
                      return TodoItem(todo: controller.TodoList[index]);
                    },
                  ),
            if (loadingController.isCreating.value ||
                loadingController.isUpdating.value ||
                loadingController.isDeleting.value)
              LoadingOverlay(
                message: loadingController.isCreating.value
                    ? 'Creating...'
                    : loadingController.isUpdating.value
                        ? 'Updating...'
                        : 'Deleting...',
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddTodoScreen()),
        backgroundColor: Color(0xFF9B8ADB).withOpacity(0.4),
        child: Image.asset('assets/img/Add New ToDo Button.png', height: 50),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF9B8ADB),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.to(() => CompletedTodosScreen());
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/All_Icon.png', width: 70, height: 50),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/Tick.png', height: 50),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
