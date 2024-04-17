import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../model/coffee_model.dart';

class CoffeeDetailsScreen extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetailsScreen({required this.coffee});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height / 2.8),
          child: Stack(
            children: [
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
                      "Favourites",
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
                padding: EdgeInsets.only(top: 150,),
                child: Container(
                  height: size.height/8,
                  width: size.width/2,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(coffee.image),fit: BoxFit.cover)),
                ),
                // child: Image.asset(
                //   coffee.image,
                //   height: 400,
                // ),
              ),
            ],
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20),
            Text(
              coffee.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\$${coffee.price}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
