import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_l2/home_page.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  // get user_email => user!.email.toString();

  TextEditingController nameController = TextEditingController();
  TextEditingController emaiIdController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController habitController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String genderdropdownvalue = 'Male';
  String habitdropdownvalue = 'Other';

  var gender = [
    'Male',
    'Female',
    'Other',
  ];

  var habit = [
    'Reading',
    'Writing',
    'Cricket',
    'Football',
    'Movie Watching',
    'Travling',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Add Customer Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Name is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emaiIdController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Email Id is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email Id",
                    hintText: "Enter your Email Id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
// -------------------------------------------------------------------
                    DropdownButton(
                      value: genderdropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: gender.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          genderdropdownvalue = newValue!;
                        });
                      },
                    ),
// -------------------------------------------------------------------
                    DropdownButton(
                      value: habitdropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: habit.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          habitdropdownvalue = newValue!;
                        });
                      },
                    ),
// -------------------------------------------------------------------
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Address is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Address",
                    hintText: "Enter your Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Disable the button during submission
                        setState(() {
                          _isSubmitting = true;
                        });

                        await db.collection('firebase_curd_l2').add({
                          'name': nameController.text,
                          'email_Id': emaiIdController.text,
                          'gender': genderdropdownvalue,
                          'habbit': habitdropdownvalue,
                          'address': addressController.text,
                          'created_by': user!.email.toString(),
                        });

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Form Submitted"),
                          backgroundColor: Colors.green,
                        ));

                        // Clear the form fields after successful submission
                        setState(() {
                          _isSubmitting = false;
                          nameController.clear();
                          emaiIdController.clear();
                          genderdropdownvalue = 'Male'; // Reset dropdown values
                          habitdropdownvalue = 'Other';
                          addressController.clear();
                        });
                      }
                    },
                    child: _isSubmitting
                        ? CircularProgressIndicator() // Show loading indicator during submission
                        : Text('Submit'),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
