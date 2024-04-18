
import 'package:flutter/material.dart';

class CustomizationItem extends StatelessWidget {
  final String option;
  final IconData icon;
  final bool isSelected;
  final Function(String) onTap;

  CustomizationItem({required this.option, required this.icon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTap(option),
      child: Container(
        height: size.height/6.8,
        width: size.width/5,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(

          color: isSelected ? Color(0xffE65836)  : Color(0xffF5E8DD),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            SizedBox(height: size.height/74),
            Text(
              option,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}