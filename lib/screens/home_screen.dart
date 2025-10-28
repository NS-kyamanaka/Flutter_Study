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
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'タスク'
                  ),
                ),
                Row(
                  children: [
                    TextField(),//期限
                    TextField(),//リマインドする時間〇時間前
                  ],
                )
              ],
            ),
          ),
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
