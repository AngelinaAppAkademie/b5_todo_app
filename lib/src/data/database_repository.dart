import 'package:b5_todo_app/src/features/todos/domain/todo.dart';

abstract class DatabaseRepository {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(Todo todo);
  Future<void> removeTodo(Todo todo);
}