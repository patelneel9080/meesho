import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(left: 12),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xffF599A4),
            child: Icon(CupertinoIcons.money_dollar_circle,color: Colors.white,),
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage("assets/Images/user.png"),
               ),
          )
        ],
        centerTitle: true,
        title: Text("meesho",style: GoogleFonts.poppins(textStyle: TextStyle(color: Color(0xff570D48),fontSize: 24,fontWeight: FontWeight.w600)),),
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width/1.3,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search,color: Colors.black54,),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black54),borderRadius: BorderRadius.circular(16))
              ),
            )
          )
        ],
      ),
    );
  }
}
