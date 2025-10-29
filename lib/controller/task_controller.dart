import 'package:flutter_study/controller/notification_controller.dart';

import '../data/models/task.dart';

class TaskController {
  static Future<void> addTask(Task task) async {
    final scheduledTime = task.deadline.subtract(
      Duration(minutes: task.noticeMinutes),
    );

    await NotificationController.scheduleNotification(
      id: DateTime.now().microsecondsSinceEpoch % 100000,
      title: task.title,
      body: '期限まで${task.noticeMinutes}分です!',
      scheduledTime: scheduledTime,
    );
  }
}
