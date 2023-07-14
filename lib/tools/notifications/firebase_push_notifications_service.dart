import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_useful_tools/tools/notifications/local_notifications_service.dart';

/*
TODO put this code inside main function main.dart

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChromeService.setSystemChrome();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await RemoteNotificationService.initNotifications();
  FirebaseMessaging.onBackgroundMessage(
      RemoteNotificationService.firebaseMessagingBackgroundHandler);
*/

class RemoteNotificationService {
  @pragma('vm:entry-point')

  //   NOTE: for background
  // Even if your app is closed u may get messages;
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    log('*****background message: ${message.messageId}');

    log('Message also contained a notification: ${message.notification}');
    log('title ${message.notification?.title ?? ' empty'}}');
    await LocalNotificationsService.showNotification();
  }

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

    //   NOTE: foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
        log('title ${message.notification?.title ?? ' empty'}}');
      }
    });

    log('token ${await messaging.getToken()}');
  }
}
