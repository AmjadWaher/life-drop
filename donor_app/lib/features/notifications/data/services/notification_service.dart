import 'package:app_settings/app_settings.dart';
import 'package:donor_app/core/di/injection_container.dart';
import 'package:donor_app/core/routing/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  int get platformValue {
    return defaultTargetPlatform == TargetPlatform.iOS ? 1 : 0;
  }

  Future<bool> requestNotificationPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      return true;
    } else {
      AppSettings.openAppSettings(type: AppSettingsType.notification);
      return false;
    }
  }

  Future<String?> getDeviceToken() async {
    return await _messaging.getToken();
  }

  Future<String?> getAuthorizedDeviceToken() async {
    final isAllowed = await requestNotificationPermission();
    if (!isAllowed) return null;

    return getDeviceToken();
  }

  Future<void> initializeHandlers({
    Future<void> Function(String token)? onTokenRefresh,
  }) async {
    await initLocalNotifications();

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }

    if (onTokenRefresh != null) {
      this.onTokenRefresh(onTokenRefresh);
    }
  }

  Future<void> initLocalNotifications() async {
    const androidInitializationSettings = AndroidInitializationSettings(
      '@mipmap/logo',
    );
    const initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSetting,
      onDidReceiveNotificationResponse: (details) {
        // TODO::handle when tap on local message to navigate to request details screen
      },
    );

    const androidChannel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'your channel description',
      importance: Importance.max,
      playSound: true,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidChannel);
  }

  Future<void> showNotification(RemoteMessage message) async {
    final title =
        message.notification?.title ?? message.data['title']?.toString();
    final body = message.notification?.body ?? message.data['body']?.toString();

    if (title == null && body == null) return;

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.max,
          ticker: 'ticker',
          icon: '@mipmap/logo',
        );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      id: message.hashCode,
      title: message.notification!.title.toString(),
      body: message.notification!.body.toString(),
      notificationDetails: notificationDetails,
    );
  }

  void onTokenRefresh(void Function(String) onNewToken) {
    _messaging.onTokenRefresh.listen(onNewToken);
  }

  void _handleForegroundMessage(RemoteMessage message) {
    showNotification(message);
  }

  void _handleNotificationTap(RemoteMessage message) {
    final requestId = message.data['requestId'];
    if (requestId == null || requestId.isEmpty) return;

    void openRequestDetails() {
      navigatorKey.currentState?.pushNamed(
        Routes.requestDetails,
        arguments: {'requestId': requestId},
      );
    }

    if (navigatorKey.currentState == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => openRequestDetails());
      return;
    }

    openRequestDetails();
  }
}
