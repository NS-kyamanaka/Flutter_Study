import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/models/task.dart';

class TaskInputForm extends StatefulWidget {
  final void Function(Task) onSubmit;

  const TaskInputForm({super.key, required this.onSubmit});

  @override
  State<TaskInputForm> createState() => _TaskInputFormState();
}

class _TaskInputFormState extends State<TaskInputForm> {
  final _titleController = TextEditingController();
  DateTime? _selectedDeadline;
  int _noticeMinutes = 60;

  Future<void> _pickDeadline() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );
    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 12, minute: 0),
    );
    if (pickedTime == null) return;

    setState(() {
      _selectedDeadline = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  void _submit() {
    if (_titleController.text.isEmpty || _selectedDeadline == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('タイトルと期限を入力してください')));
      return;
    }

    final task = Task.create(
      title: _titleController.text,
      deadline: _selectedDeadline!,
      noticeMinutes: _noticeMinutes,
    );

    widget.onSubmit(task);

    _titleController.clear();
    setState(() {
      _selectedDeadline = null;
      _noticeMinutes = 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _selectedDeadline == null
        ? '未設定'
        : DateFormat('yyyy/MM/dd HH:mm').format(_selectedDeadline!);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'タスク名'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: Text('期限: $formattedDate')),
                TextButton(onPressed: _pickDeadline, child: Text('選択')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('通知: '),
                DropdownButton<int>(
                  value: _noticeMinutes,
                  onChanged: (v) => setState(() => _noticeMinutes = v ?? 60),
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('1分前')),
                    DropdownMenuItem(value: 10, child: Text('10分前')),
                    DropdownMenuItem(value: 30, child: Text('30分前')),
                    DropdownMenuItem(value: 60, child: Text('60分前')),
                  ],
                ),
                ElevatedButton(onPressed: _submit, child: Text('追加')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
