import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String name) onAdd;
  const AddTaskScreen({Key? key, required this.onAdd}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 12),
            TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ).copyWith(
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) =>
                      states.contains(MaterialState.disabled)
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white,
                ),
              ),
              onPressed: name != "" ? () => widget.onAdd(name) : null,
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
