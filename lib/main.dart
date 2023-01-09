import 'package:flutter/material.dart';
import 'package:flutter_application_2/functions/internet_connection.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: InternetConnection()
        // home: HomeScreen(),
      ),
    );
  }
}
