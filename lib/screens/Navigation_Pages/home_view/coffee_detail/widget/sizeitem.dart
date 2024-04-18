import 'package:flutter/material.dart';

class SizeItem extends StatelessWidget {
  final String sizecof;
  final bool isSelected;
  final Function(String) onTap;

  SizeItem({required this.sizecof, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTap(sizecof),
      child: Container(
        width: size.width/3.5,
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black),
          ],
          color: isSelected ? Color(0xffE65836) : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          sizecof,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}