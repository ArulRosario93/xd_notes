import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Initialize native android notification
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialize native Ios Notifications
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    tz.initializeTimeZones(); // <---- Make this change.
  }

  void showTimedNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'CHANNEL_ID',
      'CHANNEL_NAME',
      // Remove the extra positional argument
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Finish your task',
        'You have a task to finish. Great people finish their task on time.',

        // notify at 
        tz.TZDateTime.utc(2024, 1, 4, 0, 47, 0, 0), // <---- Make this change.
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
  // int notification_id = 1;

  // await flutterLocalNotificationsPlugin.zonedSchedule(
  //       notification_id,
  //       "Title",
  //       "Description",
  //       tz.TZDateTime.now(tz.local).add(const Duration(days: 3)),
  //       const NotificationDetails(
  //           android: AndroidNotificationDetails(CHANNEL_ID, CHANNEL_NAME,
  //               CHANNEL_DESCRIPTION)),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
}