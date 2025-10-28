import 'package:intl/intl.dart';

class Task {
  final int? id;
  final String title;//タイトル
  final DateTime deadline;//期限日時
  final bool isCompleted;//完了したか
  final DateTime createdAt;//作成日
  final String userId; //作成したユーザーのユーザーID
  final String visibility; //private or public
  final DateTime reminderTime;//期限前にリマインドする

  const Task({
    this.id,
    required this.title,
    required this.deadline,
    required this.isCompleted,
    required this.createdAt,
    required this.userId,
    required this.visibility,
    required this.reminderTime,
  });

  String getDeadline() {
    return DateFormat('yyyy/MM/dd HH:mm').format(deadline);
  }
}
