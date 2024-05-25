import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../const.dart';
import '../Navigation_Pages/navigated_screen.dart';

class SignUpController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  var error = RxString('');

  void signUp() async {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      error.value = 'Please enter your name or email';
    } else if (passwordController.text != confirmPasswordController.text) {
      error.value = 'Passwords do not match';
    } else {
      error.value = '';
      SharedPreferences pref =
      await SharedPreferences.getInstance();
      pref.setString("userName", userNameController.text);
      userName = userNameController.text;
      pref.setString("userEmail", emailController.text);
      userEmail = emailController.text;
      pref.setString("userPassword", passwordController.text);
      Get.off(() => Navigated_Screen());
    }
  }
}

class SignUpScreen extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

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
            SizedBox(height: size.height / 14),
            SizedBox(
              width: size.width / 1.2,
              child: TextField(
                controller: signUpController.userNameController,
                onTap: () {},
                cursorColor: Colors.black54,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  labelText: "Name",
                  labelStyle: const TextStyle(color: Color(0xffE65836)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffE65836)),
                  ),
                  hintText: 'Enter your name',
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
            SizedBox(height: size.height / 35),
            SizedBox(
              width: size.width / 1.2,
              child: TextField(
                controller: signUpController.emailController,
                onTap: () {},
                cursorColor: Colors.black54,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  labelText: "Email Address",
                  labelStyle: const TextStyle(color: Color(0xffE65836)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffE65836)),
                  ),
                  hintText: 'Enter your email address',
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
            SizedBox(height: size.height / 35),
            SizedBox(
              width: size.width / 1.2,
              child: TextField(
                controller: signUpController.passwordController,
                onTap: () {},
                cursorColor: Colors.black54,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Color(0xffE65836)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffE65836)),
                  ),
                  hintText: 'Enter your password',
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
            SizedBox(height: size.height / 35),
            SizedBox(
              width: size.width / 1.2,
              child: TextField(
                controller: signUpController.confirmPasswordController,
                onTap: () {},
                cursorColor: Colors.black54,
                style: const TextStyle(fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  labelText: "Confirm Password",
                  labelStyle: const TextStyle(color: Color(0xffE65836)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xffE65836)),
                  ),
                  hintText: 'Enter your confirm password',
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
            SizedBox(height: size.height / 36),
            ElevatedButton(
              onPressed: () => signUpController.signUp(),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(size.width / 1.6, size.height / 18)),
                backgroundColor: MaterialStateProperty.all(const Color(0xff29333F)),
              ),
              child: Text(
                "Sign Up",
                style: GoogleFonts.mukta(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Obx(() => signUpController.error.isNotEmpty
                ? Text(
              signUpController.error.value,
              style: TextStyle(color: Colors.red),
            )
                : SizedBox.shrink()),
            SizedBox(height: size.height / 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("----------------"),
                SizedBox(width: size.width / 16),
                Text("Or Login with"),
                SizedBox(width: size.width / 16),
                Text("----------------"),
              ],
            ),
            SizedBox(height: size.height / 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xffFAF3EB),
                    image: DecorationImage(
                      image: AssetImage("assets/Images/facebook_logo.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffFAF3EB),
                    image: DecorationImage(
                      image: AssetImage("assets/Images/google_logo.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: Color(0xffFAF3EB),
                    image: DecorationImage(
                      image: AssetImage("assets/Images/Apple-Logo.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
