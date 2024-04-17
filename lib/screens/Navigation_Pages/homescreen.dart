import 'package:caferia/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../model/coffee_model.dart';

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
                        style: TextStyle(color: Color(0xffC38248), fontSize: 24),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: size.height / 4,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(12),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width / 4,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1.5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      margin: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(cof[index].image),
                                    fit: BoxFit.cover)),
                          ),
                          Text(cof[index].name),
                          Text("${cof[index].price}"),
                        ],
                      ),
                    );
                  },
                  itemCount: cof.length,
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    "Frequently added",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )),
              SizedBox(
                height: size.height,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(12),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width / 4,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 1.5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      margin: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(cof[index].image),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: size.width / 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cof[index].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("\$" "${cof[index].price}"),
                            ],
                          ),SizedBox(
                            width: size.width / 12,
                          ),SizedBox(
                            width: size.width / 12,
                          ),
                          Container(
                            height: 40,
                              width: 40,
                              child: Card(
                            child: Icon(Icons.add),
                            color: Color(0xffE65836),
                          ))
                        ],
                      ),
                    );
                  },
                  itemCount: cof.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
