import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/add_task_screen.dart';

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
            onPressed: () async {
              final newTaskTitle = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AddTaskScreen();
                  },
                ),
              );

              if (newTaskTitle != null && newTaskTitle.isNotEmpty) {
                setState(() {
                  tasks.add(Task(title: newTaskTitle));
                });
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Dismissible(
            key: Key(task.title + index.toString()),  // Key harus unik, jadi tambah index juga
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                tasks.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Task Deleted")),
              );
            },
            child: ListTile(
              leading: Icon(
                task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              ),
              title: Text(task.title),
              onTap: () async {
                final editedTaskTitle = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddTaskScreen(existingTitle: tasks[index].title);
                    },
                  ),
                );

                if (editedTaskTitle != null && editedTaskTitle.isNotEmpty) {
                  setState(() {
                    tasks[index].title = editedTaskTitle;
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }
}
