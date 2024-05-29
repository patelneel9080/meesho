import 'package:flutter/material.dart';
import 'navigated_screen.dart';

void main() async {
  // Initialize the hive

  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caferia',
      debugShowCheckedModeBanner: false,
      home:  NavigatedScreen(),
    );
  }
}
