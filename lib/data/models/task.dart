class Task {
  final int? id;
  final String title;
  final DateTime deadline;
  final bool isCompleted;
  final DateTime createdAt;
  final String userId; //作成したユーザーのID
  final String visibility; //private or public
  final DateTime reminderTime;

  Task({
    this.id,
    required this.title,
    required this.deadline,
    required this.isCompleted,
    required this.createdAt,
    required this.userId,
    required this.visibility,
    required this.reminderTime,
  });
}
