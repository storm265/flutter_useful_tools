import 'dart:developer';
import 'package:flutter_useful_tools/tools/notifications/local_notifications_service.dart';
import 'package:flutter_useful_tools/tools/notifications/remote_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void _handleMessage(RemoteMessage message) {
  log('on opened notification?');
  // if (message.data['type'] == 'chat') {
  //   Navigator.pushNamed(context, '/chat',
  //     arguments: ChatArguments(message),
  //   );
  // }
}

Future<void> initNotificationService() async {
  await LocalNotificationsService.initLocalNotifications();
  await RemoteNotificationService.initNotifications();
  FirebaseMessaging.onBackgroundMessage(
      RemoteNotificationService.firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
}
