import 'package:b5_todo_app/src/features/todos/data/database_repository.dart';
import 'package:b5_todo_app/src/features/todos/domain/todo.dart';

class MockDb extends DatabaseRepository {
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
  Future<void> removeRodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    todos.remove(todo);
  }

  @override
  Future<void> changeTodo(Todo todo, bool state) async {
    await Future.delayed(const Duration(seconds: 1));
    todo.done = state;
  }
}
