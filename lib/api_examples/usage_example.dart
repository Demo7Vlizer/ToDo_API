import 'package:new_poject/api_examples/get_example.dart';
import 'package:new_poject/api_examples/post_example.dart';
import 'package:new_poject/api_examples/put_example.dart';
import 'package:new_poject/api_examples/patch_example.dart';
import 'package:new_poject/api_examples/delete_example.dart';

void main() async {
  // GET examples
  final getExample = GetExample();
  final todos = await getExample.getAllTodos();
  final singleTodo = await getExample.getTodoById('1');

  // POST example
  final postExample = PostExample();
  final newTodo = await postExample.createTodo('New Task', 'Task Description');

  // PUT example
  final putExample = PutExample();
  final updated = await putExample.updateTodo('1', 'Updated Task', 'Updated Description');

  // PATCH example
  final patchExample = PatchExample();
  final partiallyUpdated = await patchExample.partialUpdateTodo('1', title: 'Only Title Updated');

  // DELETE example
  final deleteExample = DeleteExample();
  final deleted = await deleteExample.deleteTodo('1');

  // Print results
  print('All todos: $todos');
  print('Single todo: $singleTodo');
  print('New todo: $newTodo');
  print('Updated: $updated');
  print('Partially updated: $partiallyUpdated');
  print('Deleted: $deleted');
} 