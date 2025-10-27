import 'package:flutter/material.dart';
import 'package:flutter_study/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              )
            );
          },
          child: Text('ログイン'),
        ),
      ),
    );
  }
}