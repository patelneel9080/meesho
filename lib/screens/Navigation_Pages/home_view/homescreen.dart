import 'package:caferia/const.dart';
import 'package:caferia/model/coffee_model.dart';
import 'package:caferia/screens/Navigation_Pages/home_view/widget/listview_horizontal.dart';
import 'package:caferia/screens/Navigation_Pages/home_view/widget/listview_vertical.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Morning $userName,",
                        style:
                            TextStyle(color: Color(0xffC38248), fontSize: 24),
                      ),
                      Text(
                        "Welcome to Caferia ",
                        style: TextStyle(
                            color: Color(0xffFFF2E1),
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    height: size.height / 6,
                    width: size.width / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Images/coffee.png"))),
                  ),
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
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            SizedBox(
              height: size.height / 54,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "New in",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                )),
            ListViewCardWidget(size: size, coffees: cof.toList(),),
            const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "Frequently added",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                )),
            ListViewVerticalWidget(size: size),
          ],
        ),
      ),
    );
  }
}
