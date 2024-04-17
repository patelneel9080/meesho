import 'package:flutter/material.dart';

import '../../const.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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
                        "Menu",
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
              child: SizedBox(
                width: size.width / 1.15,
                child: const SearchBar(
                  hintText: "Search",
                  trailing: [
                    CircleAvatar(
                      backgroundColor: Color(0xffE65836),
                      child: Icon(Icons.search_rounded),
                    )
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
