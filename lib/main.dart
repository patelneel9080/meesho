import 'package:caferia/screens/Login%20Method/Login_method.dart';
import 'package:caferia/screens/Navigation_Pages/navigated_screen.dart';
import 'package:caferia/screens/splashscreen.dart';
import 'package:flutter/material.dart';


void main() async {
  //initialise the hive

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musify',
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Navigated_Screen(),
    );
  }
}
