import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_useful_tools/tools/notifications/local_notifications_service.dart';

class RemoteNotificationService {
  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    log('*****background message: ${message.messageId}');

    log('Message also contained a notification: ${message.notification}');
    log('title ${message.notification?.title ?? ' empty'}}');
    await LocalNotificationsService.showNotification(
        title: message.notification?.title ?? ' empty',
        body: message.notification?.body ?? ' empty');
  }
// Use this method in main.dart
  static Future<void> initNotifications() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance.setAutoInitEnabled(true);

    // NOTE: foreground only
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
        log('title: ${message.notification?.title ?? ' empty'}}');
        log('body: ${message.notification?.body ?? ' empty'}}');
      }
    });

    // log('device fcm token ${await messaging.getToken()}');
  }
}
