import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:caferia/screens/Login%20Method/loginscreen.dart';
import 'package:caferia/screens/Login%20Method/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginMethod extends StatefulWidget {
  const LoginMethod({super.key});

  @override
  State<LoginMethod> createState() => _LoginMethodState();
}

class _LoginMethodState extends State<LoginMethod> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size(size.width, size.height / 3.8),
            child: Stack(children: [
              Container(
                width: size.width,
                height: size.height / 4.5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/Images/apptheme.webp"),
                        fit: BoxFit.cover,
                        opacity: .4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height/7,
                        width: size.width/1.3,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Images/coffee.png"))),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 150, left: 30),
                child: Container(
                  width: size.width / 1.2,
                  child: SegmentedTabControl(indicatorDecoration: BoxDecoration(
                    color: Color(0xffE65836),
                    borderRadius: BorderRadius.circular(25)
                  ),barDecoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    // Customization of widget
                    // radius: const Radius.circular(25),
                    // backgroundColor: Color(0xffEFEAF4),
                    // indicatorColor: Color(0xffE65836),
                    tabTextColor: Colors.black45,
                    selectedTabTextColor: Colors.white,
                    squeezeIntensity: 8,
                    height: size.height / 14,

                    // tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                    tabs: [
                      SegmentTab(
                          label: 'Sign In',
                          textColor: Colors.black,
                          backgroundColor: Color(0xffEFEAF4),
                          selectedTextColor: Colors.white),
                      SegmentTab(
                        label: 'Sign Up',
                        backgroundColor: Color(0xffEFEAF4),
                        selectedTextColor: Colors.white,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
            ])),
        body: TabBarView(
          children: [
           LoginScreen(),
            SignUpScreen()
          ],
        ),
      ),
    );
  }
}
