import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ), // AppBar
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text("Buy Groceries"),
          ), // ListTile
          ListTile(
            leading: Icon(Icons.check_box),
            title: Text("Finish Flutter Project"),
          ), // ListTile
          ListTile(
            leading: Icon(Icons.check_box_outline_blank),
            title: Text("Workout 30 Minutes"),
          ), // ListTile
        ],
      ), // ListView
    ); // Scaffold
  }
}
