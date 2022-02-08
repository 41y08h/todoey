import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int, bool) onItemUpdated;
  const TasksList({Key? key, required this.tasks, required this.onItemUpdated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskTile(
        name: tasks[index].name,
        isDone: tasks[index].isDone,
        onChange: (value) {
          onItemUpdated(index, value);
        },
      ),
      itemCount: tasks.length,
    );
  }
}

class Task {
  final String name;
  bool isDone;

  Task(this.name, {this.isDone = false});
}
