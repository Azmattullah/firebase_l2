import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Information Cards'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              UserInfoCard(
                name: 'John Doe',
                email: 'john.doe@example.com',
                gender: 'Male',
                hobby: 'Reading',
                address: '123 Main Street, Cityville',
              ),
              SizedBox(height: 16.0),
              UserInfoCard(
                name: 'Jane Smith',
                email: 'jane.smith@example.com',
                gender: 'Female',
                hobby: 'Cooking',
                address: '456 Oak Avenue, Townsville',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String gender;
  final String hobby;
  final String address;

  UserInfoCard({
    required this.name,
    required this.email,
    required this.gender,
    required this.hobby,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Email ID: $email'),
            SizedBox(height: 8.0),
            Text('Gender: $gender'),
            SizedBox(height: 8.0),
            Text('Hobby: $hobby'),
            SizedBox(height: 8.0),
            Text('Address: $address'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle delete action
                  },
                  child: Text('Delete'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
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
