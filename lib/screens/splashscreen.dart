import 'dart:async';

import 'package:caferia/screens/Login%20Method/Login_method.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(
                    "assets/Images/apptheme.webp"),
                fit: BoxFit.cover,
                opacity: .4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                height: size.height / 2,
                width: size.width / 1.4,
                child: Image.asset(
                  "assets/Images/splashscreen.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height/54,),
            Text(
              "Welcome to",
              style: TextStyle(
                  color: Color(0xffFFF2E1),
                  fontSize: 45,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Caferia",
              style: TextStyle(
                  color: Color(0xffFFF2E1),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height/54,),
            GestureDetector(
              onTap: () {
                setState(() {
                  _expanded = true;

                });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginMethod(),
                      ));
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: _expanded ? Color(0xffAA6F47) : Color(0xffAA6F47),
                    borderRadius: BorderRadius.circular(12)),
                duration: Duration(seconds: 3),
                curve: Curves.decelerate,
                width:
                   MediaQuery.of(context).size.width / 2.5 ,
                height:
                    MediaQuery.of(context).size.height / 20 ,
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
