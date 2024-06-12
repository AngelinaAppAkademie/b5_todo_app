class Todo {
  String taskName;
  bool done;

  Todo({
    required this.taskName,
    required this.done,
  });

  Map<String, dynamic> toJson() => {
        'taskName': taskName,
        'done': done,
      };

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      taskName: json['taskName'],
      done: json['done'],
    );
  }
}
