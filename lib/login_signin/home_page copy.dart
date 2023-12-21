import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
        IconButton(onPressed: () async{
          await FirebaseAuth.instance.signOut();
        }, icon: Icon(Icons.logout,  color: Colors.white)),
      ]),
      body: Center(
        child: Text(user!.email.toString(), style: TextStyle(fontSize: 30),),
      ),
    );
  }
}