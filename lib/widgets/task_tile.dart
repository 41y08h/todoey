import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool isDone;
  final Function(bool) onChange;
  final Function() onDelete;
  const TaskTile({
    Key? key,
    required this.name,
    this.isDone = true,
    required this.onChange,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onDelete,
      title: Text(
        name,
        style: isDone
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      trailing: Checkbox(
        value: isDone,
        onChanged: (value) => {onChange(value ?? false)},
      ),
    );
  }
}
