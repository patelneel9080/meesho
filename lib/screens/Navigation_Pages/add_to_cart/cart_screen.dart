import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height / 3.8),
          child: Container(
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
                  "My Cart",
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
          )),
    );
  }
}
