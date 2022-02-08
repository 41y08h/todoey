import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class Task {
  final String name;
  bool isDone;

  Task(this.name, {this.isDone = false});
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task('Buy milk'),
    Task('Buy eggs'),
    Task('Buy bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskTile(
        name: tasks[index].name,
        isDone: tasks[index].isDone,
        onChange: (value) {
          setState(() {
            tasks[index].isDone = value;
          });
        },
      ),
      itemCount: tasks.length,
    );
  }
}
