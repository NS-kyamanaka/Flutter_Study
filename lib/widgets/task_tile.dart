import 'package:flutter/material.dart';
import '../data/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color:Colors.grey, width: 1.0))
      ),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(),
      ),
    );
  }
}