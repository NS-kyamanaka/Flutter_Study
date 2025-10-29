// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationController {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin
//    = FlutterLocalNotificationsPlugin();

// //権限の取得
// bool? permission = await _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();



// }


import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // 💡 Androidで必須な通知チャンネルを定義
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel', // チャンネルID (一意である必要があります)
    '高重要度通知', // ユーザーに見せるチャンネル名
    description: 'このチャンネルはタスクリマインダーに使用されます。', // ユーザーに見せる説明文
    importance: Importance.max, // 通知の重要度（最優先）
  );

  static Future<void> initNotification() async {
    // 1. Androidの初期化設定
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // アプリのランチャーアイコンを指定

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    // 💡 初期化処理を実行
    await _notificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveNotificationResponse: ... (通知タップ時の処理)
    );

    // 2. Android通知チャンネルの作成 (アプリインストール後に一度だけ実行されるのが理想)
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        _notificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();

    if (androidImplementation != null) {
      await androidImplementation.createNotificationChannel(_channel);
      
      // 3. Android 13 (API 33) 以降の権限要求
      // Future<bool?> を返す。権限が許可されたか確認
      final bool? granted = 
          await androidImplementation.requestNotificationsPermission();
      
      if (granted == true) {
        print("Android通知権限が許可されました。");
      } else {
        print("Android通知権限が拒否されました。");
      }
    }
    
    print('Android通知プラグインの初期化が完了しました。');
  }
}