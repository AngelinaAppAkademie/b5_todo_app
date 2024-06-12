import 'dart:convert';
import 'package:b5_todo_app/src/data/database_repository.dart';
import 'package:b5_todo_app/src/features/todos/domain/todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsDatabase implements DatabaseRepository {
  static const String todosKey = 'todos';

  @override
  Future<void> addTodo(Todo todo) async {
    // Zuerst holen wir uns die Instanz
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Dann die Liste
    List<String> todosList = prefs.getStringList(todosKey) ?? [];

    // Nun fügen wir das Todo in Form eines Json-Strings an die Liste an
    todosList.add(jsonEncode(todo.toJson()));

    // Und setzen final die Liste auf unsere aktuelle Liste
    await prefs.setStringList(todosKey, todosList);
  }

  @override
  Future<List<Todo>> getTodos() async {
    // Zuerst holen wir uns die Instanz
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Dann die Liste
    List<String> todosList = prefs.getStringList(todosKey) ?? [];

    // Mittels .map wandeln wir nun zu einer Todo Liste um
    return todosList
        .map((todoString) => Todo.fromJson(jsonDecode(todoString)))
        .toList();
  }

  @override
  Future<void> removeTodo(Todo todo) async {
    // Zuerst holen wir uns die Instanz
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Dann die Liste
    List<String> todosList = prefs.getStringList(todosKey) ?? [];

    // Dann suchen wir den String in unserer Liste und entfernen wenn der task name korrekt ist
    todosList.removeWhere((todoString) {
      Todo currentTodo = Todo.fromJson(jsonDecode(todoString));
      return currentTodo.taskName == todo.taskName;
    });

    await prefs.setStringList(todosKey, todosList);
  }
}
