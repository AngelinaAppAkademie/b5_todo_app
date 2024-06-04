import 'package:b5_todo_app/src/app.dart';
import 'package:b5_todo_app/src/features/todos/data/database_repository.dart';
import 'package:b5_todo_app/src/features/todos/data/mock_db.dart';
import 'package:flutter/material.dart';

void main() {
  DatabaseRepository dbRepo = MockDb();
  runApp(App(repo: dbRepo));
}

