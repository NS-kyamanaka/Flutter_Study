import 'package:flutter/material.dart';
import 'package:flutter_study/controller/notification_controller.dart';
import 'package:flutter_study/widgets/task_tile.dart';
import '../data/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];
  final _titleController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _noticeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
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
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'タスク名'),
            ),
            const SizedBox(height: 16.0),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _deadlineController,
                    readOnly: true,
                    onTap: () => {},
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: _noticeController,
                    readOnly: true,
                    onTap: () => {},
                    decoration: const InputDecoration(
                      labelText: '通知(分前)',
                      suffixIcon: Icon(Icons.alarm),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () async {
                late Task newTask;
                setState(() {
                  newTask = Task.create(
                    title: _titleController.text,
                    deadline: DateTime(2025, 10, 30),
                    notice: 60,
                  );
                  tasks.add(newTask);
                });
                final now = DateTime.now();
                final later = now.add(const Duration(seconds: 5));

                NotificationController.scheduleNotification(
                  id: 11,
                  title: newTask.title,
                  body: 'テスト通知',
                  scheduledTime: later,
                );
                print("時間は${later}");
              },
              child: Text('登録'),
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
      ),
    );
  }
}
