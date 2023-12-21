import 'package:firebase_l2/screens/login_screen.dart';
import 'package:firebase_l2/widgets/input_text_field.dart';
import 'package:firebase_l2/resources/auth_method.dart';
import 'package:flutter/material.dart';

class MySignupScreen extends StatefulWidget {
  const MySignupScreen({super.key});

  @override
  State<MySignupScreen> createState() => My_SignuScreenpState();
}

class My_SignuScreenpState extends State<MySignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void registerUsers() async {
      String resp = await AuthMethods().registerUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _nameController.text,
        bio: _bioController.text,
      );
      if (resp == 'success') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyLoginScreen(),
        ));
      }
    }

    void navigateLogin() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyLoginScreen()));
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(flex: 2, child: Container()),
              InputTextField(
                textEditingController: _emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24,
              ),
              InputTextField(
                textEditingController: _passwordController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 24,
              ),
              InputTextField(
                textEditingController: _nameController,
                hintText: 'Name',
                textInputType: TextInputType.text,
                isPass: false,
              ),
              SizedBox(
                height: 24,
              ),
              InputTextField(
                textEditingController: _bioController,
                hintText: 'Bio',
                textInputType: TextInputType.text,
                isPass: false,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(onPressed: registerUsers, child: Text('Sign Up')),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Already have an Account  "),
                  ),
                  GestureDetector(
                    onTap: navigateLogin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
