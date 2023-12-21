import 'package:firebase_l2/pages/login_page.dart';
import 'package:firebase_l2/pages/signup_page.dart';
import 'package:flutter/material.dart';

class LoginAndSignUp extends StatefulWidget {
  const LoginAndSignUp({super.key});

  @override
  State<LoginAndSignUp> createState() => _LoginAndSignUpState();
}

class _LoginAndSignUpState extends State<LoginAndSignUp> {
  bool islogin = true;

  void togglePage() {
    islogin = !islogin;
  }

  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return LoginPage(
        onPressed: togglePage);
    } else {
      return SignupPage(
        onPressed: togglePage,
      );
    }
  }
}
