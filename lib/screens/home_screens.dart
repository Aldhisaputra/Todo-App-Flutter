import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [
    Task(title: "Buy Groceries"),
    Task(title: "Finish Flutter Project"),
    Task(title: "Workout 30 Minutes"),
    Task(title: "Workout 30 Minutes", isDone: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            leading: Icon(
              task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            title: Text(task.title),
          );
        },
      ),
    );
  }
}
