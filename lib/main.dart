import 'package:bomber_app/config/config.dart';
import 'package:bomber_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pushNotifications = PushNotifications();
@pragma('vm:entry-point')
Future _firebaseBackgroundHandler(RemoteMessage message) async {
  await pushNotifications.setupFlutterNotifications();
  pushNotifications.showFlutterNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Environment.initEnvirontment();
  PushNotifications.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  await pushNotifications.setupFlutterNotifications();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    pushNotifications.onMessageListener();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bomberapp',
      theme: AppTheme(isDarkmode: true, context: context).getTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
