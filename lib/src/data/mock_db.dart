import 'package:b5_todo_app/src/data/database_repository.dart';
import 'package:b5_todo_app/src/features/todos/domain/todo.dart';

class MockDb implements DatabaseRepository {
  List<Todo> todos = [];

  @override
  Future<void> addTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    todos.add(todo);
  }

  @override
  Future<List<Todo>> getTodos() async {
    await Future.delayed(const Duration(seconds: 1));
    return todos;
  }

  @override
  Future<void> removeTodo(Todo todo) async {
    // await Future.delayed(const Duration(seconds: 1));
    todos.remove(todo);
  }

}
