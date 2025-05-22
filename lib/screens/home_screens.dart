import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(
          "My Tasks",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            onPressed: () async {
              final newTaskTitle = await Navigator.push<String>(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskScreen(),
                ),
              );

              if (newTaskTitle != null && newTaskTitle.isNotEmpty) {
                setState(() {
                  tasks.add(Task(title: newTaskTitle));
                });
              }
            },
            icon: const Icon(Icons.add),
            color: Colors.black87,
          ),
        ],
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                'No tasks yet!',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Dismissible(
                  key: Key(task.title + index.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) {
                    setState(() {
                      tasks.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Task Deleted")),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      leading: Icon(
                        task.isDone
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: task.isDone ? Colors.green : Colors.grey,
                      ),
                      title: Text(
                        task.title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          decoration: task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      onTap: () async {
                        final editedTaskTitle =
                            await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTaskScreen(
                              existingTitle: task.title,
                            ),
                          ),
                        );

                        if (editedTaskTitle != null &&
                            editedTaskTitle.isNotEmpty) {
                          setState(() {
                            tasks[index].title = editedTaskTitle;
                          });
                        }
                      },
                      onLongPress: () {
                        setState(() {
                          task.isDone = !task.isDone;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
