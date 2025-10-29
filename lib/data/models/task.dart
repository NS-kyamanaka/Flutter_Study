import 'package:intl/intl.dart';

class Task {
  final int? id;
  final String title;//タイトル
  final DateTime deadline;//期限日時
  final bool isCompleted;//完了したか
  final DateTime createdAt;//作成日
  final DateTime reminderTime;//期限前にリマインドする

  const Task({
    this.id,
    required this.title,
    required this.deadline,
    required this.isCompleted,
    required this.createdAt,
    required this.reminderTime,
  });

  String getDeadline() {
    return DateFormat('yyyy/MM/dd HH:mm').format(deadline);
  }

  factory Task.create({
    required String title,
    required DateTime deadline,
    required int notice,
  }){
    final Duration duration = Duration(minutes: notice);
    DateTime reminderTime = deadline.subtract(duration);
    return  Task(title: title, deadline: deadline, isCompleted: false, 
    createdAt: DateTime.now(), reminderTime: reminderTime);
  }
}
