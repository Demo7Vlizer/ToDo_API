import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_poject/todo_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
      ),
      home: TodoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
    