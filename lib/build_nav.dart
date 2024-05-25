import 'package:flutter/material.dart';

class BuildMyNavBar extends StatefulWidget {
  final int pageIndex;
  final ValueChanged<int> onTap;

  const BuildMyNavBar({super.key, required this.pageIndex, required this.onTap});

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
        margin: EdgeInsets.symmetric(horizontal: 24),
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
              onPressed: () => widget.onTap(0),
              icon: widget.pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Color(0xffE65836),
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
              onPressed: () => widget.onTap(1),
              icon: widget.pageIndex == 1
                  ? const Icon(
                Icons.menu_book,
                color: Color(0xffE65836),
                size: 35,
              )
                  : const Icon(
                Icons.menu_book_outlined,
                color: Colors.black54,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () => widget.onTap(2),
              icon: widget.pageIndex == 2
                  ? const Icon(
                Icons.favorite,
                color: Color(0xffE65836),
                size: 35,
              )
                  : const Icon(
                Icons.favorite_outline,
                color: Colors.black54,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () => widget.onTap(3),
              icon: widget.pageIndex == 3
                  ? const Icon(
                Icons.person,
                color: Color(0xffE65836),
                size: 35,
              )
                  : const Icon(
                Icons.person_outline,
                color: Colors.black54,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () => widget.onTap(4),
              icon: widget.pageIndex == 4
                  ? const Icon(
                Icons.shopping_cart,
                color: Color(0xffE65836),
                size: 35,
              )
                  : const Icon(
                Icons.shopping_cart_outlined,
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
