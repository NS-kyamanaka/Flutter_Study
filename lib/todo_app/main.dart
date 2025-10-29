import 'package:flutter/material.dart';
import 'package:flutter_study/screens/login_screen.dart';
import '../controller/notification_controller.dart';

// void main() {
//   runApp(const ToDoApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationController.initNotification();

  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ToDoアプリ', home: const LoginScreen());
  }
}
