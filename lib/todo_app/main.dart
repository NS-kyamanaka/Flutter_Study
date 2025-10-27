import 'package:flutter/material.dart';
import 'package:flutter_study/screens/login_screen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'ToDoアプリ',
      home: const LoginScreen(),
    );
  }
}