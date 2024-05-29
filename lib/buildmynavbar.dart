import 'package:flutter/material.dart';
import 'const.dart';

class BuildMyNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BuildMyNavBar({super.key, required this.currentIndex, required this.onTap});

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
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.8),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 15,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                widget.onTap(0);
              },
              icon: widget.currentIndex == 0
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
                widget.onTap(1);
              },
              icon: widget.currentIndex == 1
                  ? const Icon(
                Icons.trending_up,
                color: Color(0xffF6A0A9),
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
                widget.onTap(2);
              },
              icon: widget.currentIndex == 2
                  ? const Icon(
                Icons.shopping_cart,
                color: Color(0xffF6A0A9),
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
                widget.onTap(3);
              },
              icon: widget.currentIndex == 3
                  ? const Icon(
                Icons.widgets,
                color: Color(0xffF6A0A9),
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
