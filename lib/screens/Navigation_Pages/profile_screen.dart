import 'package:caferia/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                      image: AssetImage("assets/Images/apptheme.webp"),
                      fit: BoxFit.cover,
                      opacity: .4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width/14,),
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Color(0xffFFF2E1),
                        fontSize: 43,
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 150, left: 28),
              child: Container(
                height: size.height/12,
                width: size.width / 1.15,
                decoration: BoxDecoration(
                  color: Color(0xffEEE8F4),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: size.width/14,),
                    CircleAvatar(maxRadius: 26,
                      backgroundImage: NetworkImage("https://www.renderhub.com/zcnaipowered/gallery/made-a-quick-profile-picture-using-a-i.jpg"),
                    ),
                    SizedBox(width: size.width/14,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("abc"),
                        Text("abc"),
                        // Text(userName),
                        // Text(userEmail),
                      ],
                    ),
                    SizedBox(width: size.width/2.8,),
                    Card(
                      color: Color(0xffE65836),
                      shape: CircleBorder(),
                      child: IconButton(onPressed: () {

                      }, icon: Icon(CupertinoIcons.pencil,color: Colors.white,)),
                    )
                  ],
                )
              ),
            )
          ])),
    );
  }
}
