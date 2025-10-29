import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/task_input_form.dart';
import 'package:flutter_study/widgets/task_tile.dart';
import '../data/models/task.dart';
import '../controller/task_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void _addNewTask(Task task) async {
    setState(() {
      tasks.add(task);
    });
    await TaskController.addTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.notifications)),
          IconButton(onPressed: null, icon: Icon(Icons.person)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TaskInputForm(onSubmit: _addNewTask),
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
      ),
    );
  }
}
