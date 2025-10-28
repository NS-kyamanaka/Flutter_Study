import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/task_tile.dart';
import '../widgets/serch_input_field.dart';
import '../data/models/task.dart';

class HomeScreen extends StatelessWidget {
  final List<Task> tasks;
  const HomeScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: null, icon: Icon(Icons.person)),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.notifications)),
          IconButton(onPressed: null, icon: Icon(Icons.person_add)),
        ],
      ),
      body: Column(
        children: [
          SearchInputField(),
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
