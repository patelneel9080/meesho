import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'navigated_screen.dart';

void main() async {
  // Initialize the hive

  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caferia',
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home:  NavigatedScreen(),
    );
  }
}
