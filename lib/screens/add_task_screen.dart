import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final String? existingTitle;
  const AddTaskScreen({super.key, this.existingTitle});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late TextEditingController _controller;

  @override
void initState() {
  super.initState();
  _controller = TextEditingController(
    text: widget.existingTitle ?? "");
}


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
