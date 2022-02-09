import 'package:flutter/material.dart';

class Task {
  final String name;
  bool isDone;

  Task(this.name, {this.isDone = false});
}

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task('Buy milk'),
    Task('Buy eggs'),
    Task('Buy bread'),
  ];

  List<Task> get tasks => _tasks;

  void addTask(String newTaskTitle) {
    _tasks.add(Task(newTaskTitle));
    notifyListeners();
  }

  void updateTask(int index, bool value) {
    _tasks[index].isDone = value;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
