import 'package:flutter/material.dart';

import 'const.dart';

class BuildMyNavBar extends StatefulWidget {
  const BuildMyNavBar({super.key});

  @override
  State<BuildMyNavBar> createState() => _BuildMyNavBarState();
}

class _BuildMyNavBarState extends State<BuildMyNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          height: 56,
          alignment: Alignment.center,
          // padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.8),
              borderRadius: BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    // offset: Offset(0, 20),
                    blurRadius: 15),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                  Icons.home_filled,
                  color: Color(0xffF6A0A9),
                  size: 35,
                )
                    : const Icon(
                  Icons.home_outlined,
                  color: Colors.black54,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                  Icons.trending_up,
                  color:  Color(0xffF6A0A9),
                  size: 35,
                )
                    : const Icon(
                  Icons.trending_up_outlined,
                  color: Colors.black54,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                  Icons.shopping_cart,
                  color:  Color(0xffF6A0A9),
                  size: 35,
                )
                    : const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black54,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                  Icons.widgets,
                  color:  Color(0xffF6A0A9),
                  size: 35,
                )
                    : const Icon(
                  Icons.widgets_outlined,
                  color: Colors.black54,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
