import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz; 
import 'package:flutter_study/screens/home_screen.dart';
import '../controller/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  try {
    //現在のデバイス時刻がUTCでも強制的にAsia/Tokyoに設定
    tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));
    print('TimeZone initialized: ${tz.local}');
  } catch (e) {
    //万が一タイムゾーン取得に失敗した場合も安全にフォールバック
    print('TimeZone initialization failed, fallback to UTC: $e');
    tz.setLocalLocation(tz.getLocation('UTC'));
  }
  await NotificationController.initNotification();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'ToDoアプリ', home: const HomeScreen());
  }
}
