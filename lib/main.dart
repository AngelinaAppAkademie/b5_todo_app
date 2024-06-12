import 'package:b5_todo_app/src/app.dart';
import 'package:b5_todo_app/src/data/database_repository.dart';
import 'package:b5_todo_app/src/data/shared_prefs_database.dart';
import 'package:flutter/material.dart';

void main() {
  DatabaseRepository dbRepo = SharedPrefsDatabase();
  runApp(App(repo: dbRepo));
}
