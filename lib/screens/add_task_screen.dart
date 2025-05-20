import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Task Title"),
            ),
            SizedBox(height: 28),
            ElevatedButton(
              onPressed: () {
                final taskTitle = _controller.text;
                if (taskTitle.isNotEmpty) {
                  Navigator.pop(context, taskTitle);
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
