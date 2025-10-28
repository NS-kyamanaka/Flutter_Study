import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/task_tile.dart';
import '../data/models/task.dart';

class HomeScreen extends StatelessWidget {
  final List<Task> tasks;
  const HomeScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.notifications)),
          IconButton(onPressed: null, icon: Icon(Icons.person)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(task: tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
