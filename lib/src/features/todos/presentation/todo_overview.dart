import 'package:b5_todo_app/src/features/todos/data/database_repository.dart';
import 'package:b5_todo_app/src/features/todos/domain/todo.dart';
import 'package:flutter/material.dart';

class TodoOverview extends StatefulWidget {
  final DatabaseRepository dbRepo;

  const TodoOverview({
    required this.dbRepo,
    super.key,
  });

  @override
  State<TodoOverview> createState() => _TodoOverviewState();
}

class _TodoOverviewState extends State<TodoOverview> {
  late Future<List<Todo>> todos;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    todos = widget.dbRepo.getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Overview')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<Todo>>(
                  future: todos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                      List<Todo> todos = snapshot.data!;
                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          Todo currentTodo = todos[index];
                          return CheckboxListTile(
                            title: Text(currentTodo.taskName),
                            value: currentTodo.done,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.dbRepo.changeTodo(currentTodo, value!);
                              });
                            },
                          );
                        },
                      );
                    } else if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Icon(Icons.error));
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter a new todo',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: () {
                        final checkItem = Todo(
                          taskName: _controller.text,
                          done: false,
                        );
                        _controller.clear();
                        setState(() {
                          widget.dbRepo.addTodo(checkItem);
                          todos = widget.dbRepo.getTodos();
                        });
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
