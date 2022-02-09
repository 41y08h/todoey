import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/tasks_provider.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TasksProvider>().tasks;

    return ListView.builder(
      itemBuilder: (context, index) => TaskTile(
        name: tasks[index].name,
        isDone: tasks[index].isDone,
        onChange: (value) {
          context.read<TasksProvider>().updateTask(index, value);
        },
        onDelete: () {
          context.read<TasksProvider>().removeTask(index);
        },
      ),
      itemCount: tasks.length,
    );
  }
}
