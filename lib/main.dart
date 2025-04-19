import 'package:bomber_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvirontment();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
