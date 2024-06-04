import 'package:b5_todo_app/src/features/todos/data/database_repository.dart';
import 'package:b5_todo_app/src/features/todos/presentation/todo_overview.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository repo;
  const App({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoOverview(dbRepo: repo),
    );
  }
}
