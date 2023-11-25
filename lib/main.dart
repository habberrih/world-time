import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'pages/choose_location.dart';
import 'pages/home_page.dart';
import 'pages/loading.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (BuildContext context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const HomePage(),
        '/location': (context) => const ChooseLocation()
      },
    );
  }
}
