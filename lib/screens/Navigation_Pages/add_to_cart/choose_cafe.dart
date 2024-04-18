import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseYourCafe extends StatefulWidget {
  const ChooseYourCafe({super.key});

  @override
  State<ChooseYourCafe> createState() => _ChooseYourCafeState();
}

class _ChooseYourCafeState extends State<ChooseYourCafe> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height / 4.8),
          child: Container(
            width: size.width,
            height: size.height / 5.5,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                image: DecorationImage(
                    image: AssetImage("assets/Images/apptheme.webp"),
                    fit: BoxFit.cover,
                    opacity: .4)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(CupertinoIcons.back,color: Color(0xffFFF2E1),size: 34,)),
                SizedBox(width: size.width/14,),
                Text(
                  "Choose Your Cafe",
                  style: TextStyle(
                      color: Color(0xffFFF2E1),
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
                // Container(
                //   height: size.height / 6,
                //   width: size.width / 2,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("assets/Images/coffee.png"))),
                // ),
              ],
            ),
          )),
    );
  }
}
