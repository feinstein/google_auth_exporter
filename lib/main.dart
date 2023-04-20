import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di.dart';
import 'ui/home_page.dart';

void main() {
  registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Auth Exporter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        canvasColor: const Color(0xFF202124),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
