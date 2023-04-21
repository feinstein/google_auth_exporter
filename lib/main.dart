import 'package:flutter/material.dart';

import 'di.dart';
import 'ui/home_page.dart';

void main() {
  registerDependencies();
  runApp(const MyApp());
}

final routeObserver = RouteObserver();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Authenticator Exporter',
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
      navigatorObservers: [routeObserver],
    );
  }
}
