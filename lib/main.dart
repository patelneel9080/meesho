import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:caferia/screens/Login%20Method/Login_method.dart';
import 'package:caferia/screens/Navigation_Pages/navigated_screen.dart';
import 'package:caferia/screens/splashscreen.dart';
import 'package:device_preview/device_preview.dart';

import 'cart_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()), // Provide an instance of CartProvider
        // You can add more providers if needed
      ],
      child: GetMaterialApp(
        title: 'Caferia',
        darkTheme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: Consumer<CartProvider>(
          builder: (context, cartProvider, child) {
            return SplashScreen(); // or any other widget that needs access to CartProvider
          },
        ),
      ),
    );
  }
}
