import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  final data = <String, dynamic>{
    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    'id': '1',
    'status': 'done',
  };

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  bool isFlutterLocalNotificationsInitialized = false;

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    final DarwinInitializationSettings
    initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true, // Solicitar permiso para mostrar alertas
      requestBadgePermission:
          true, // Solicitar permiso para actualizar el badge
      requestSoundPermission: true, // Solicitar permiso para reproducir sonidos
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: AndroidInitializationSettings(
            '@mipmap/ic_launcher',
          ), // Icono para Android
          iOS: initializationSettingsIOS, // Configuración para iOS
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        // Manejar la interacción con la notificación
        print('Notificación tocada: ${response.payload}');
      },
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android:
              android != null
                  ? AndroidNotificationDetails(
                    channel.id,
                    channel.name,
                    channelDescription: channel.description,
                    icon: '@mipmap/ic_launcher',
                    priority: Priority.high,
                    importance: Importance.high,
                    enableLights: true,
                    enableVibration: true,
                    styleInformation: BigTextStyleInformation(
                      notification.body!,
                      htmlFormatBigText: true, // Si usas formato HTML
                      contentTitle: notification.title,
                      htmlFormatContentTitle: true,
                    ),
                    largeIcon: const DrawableResourceAndroidBitmap(
                      '@mipmap/ic_launcher',
                    ),
                  )
                  : null,
          iOS: DarwinNotificationDetails(
            presentAlert: true, // Mostrar alerta
            presentBadge: true, // Mostrar badge
            presentSound: true, // Reproducir ∏
          ),
        ),
      );
    }
  }

  static Future initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<String?> getDeviceToken() async {
    return await _firebaseMessaging.getToken();
  }

  void onMessageListener() {
    //segundo plano
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        final routeFromMessage = value.data['route'];
        print('routeFromMessage: $routeFromMessage');
        print('value.data: ${value.data}');
      }
    });
    //primer plano
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    //cuando toco la notificacion
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      // Navigator.pushNamed(
      //   context,
      //   '/message',
      //   arguments: MessageArguments(message, true),
      // );
    });
  }
}
