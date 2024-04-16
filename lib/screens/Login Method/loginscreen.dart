import 'package:caferia/screens/Navigation_Pages/navigated_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _error = '';
  String userName = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height/14,),
            SizedBox(
              width: size.width/1.2,
              child: TextField(
                onTap: () {},
                cursorColor: Colors.black54,
                controller: _userName,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  labelText: "Email",
                  labelStyle: const TextStyle(color: Color(0xffE65836)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color:  Color(0xffE65836)),
                  ),
                  hintText: 'Enter your email',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffE65836)),
                  ),
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                ),
              ),
            ),
            if (_error.isNotEmpty)
              Text(
                _error,
                style: const TextStyle(color: Colors.red),
              ),
            SizedBox(
              height: size.height / 35,
            ),
            SizedBox(
              width: size.width/1.2,
              child: TextField(
                controller: _password,
                onTap: () {},
                cursorColor: Colors.black54,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  labelText: "Password",
                  labelStyle: const TextStyle(color:  Color(0xffE65836)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffE65836)),
                  ),
                  hintText: 'Enter your password',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color:  Color(0xffE65836)),
                  ),
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: Text("Forgot Password?",style: TextStyle(color:  Color(0xffE65836)),)),
                SizedBox(width: size.width/12,)
              ],
            ),
            SizedBox(
              height: size.height / 36,
            ),
            ElevatedButton(
              onPressed: () async {
                if (_userName.text.isEmpty) {
                  setState(() {
                    _error = 'Please enter your name';
                  });
                } else {
                  _error = "";
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Navigated_Screen(),
                        ));
                  });
                  SharedPreferences pref =
                  await SharedPreferences.getInstance();
                  pref.setString("userName", _userName.text);
                  userName = pref.getString("userName")!;
                  print(userName);
                }
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                    Size(size.width/1.6, size.height / 18)),
                backgroundColor:
                const MaterialStatePropertyAll(Color(0xff29333F)),
              ),
              child: Text(
                "Login",
                style: GoogleFonts.mukta(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height / 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Text("----------------"),
                SizedBox(width: size.width/16,),
                Text("Or Login with"),
                SizedBox(width: size.width/16,),
                Text("----------------"),
              ],
            ),
            SizedBox(height: size.height/24,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 60,
                 decoration: BoxDecoration(
                     color: Color(0xffFAF3EB),
                     image: DecorationImage(image: AssetImage("assets/Images/facebook_logo.png"),fit: BoxFit.cover),
                   borderRadius: BorderRadius.circular(12)
                 ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Color(0xffFAF3EB),
                      image: DecorationImage(image: AssetImage("assets/Images/google_logo.png"),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Color(0xffFAF3EB),
                      image: DecorationImage(image: AssetImage("assets/Images/Apple-Logo.png"),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12)
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}