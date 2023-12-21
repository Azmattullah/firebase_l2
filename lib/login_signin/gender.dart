// import 'package:flutter/material.dart';

// // Define the enum for gender
// enum Gender { Male, Female, Other }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Gender Input'),
//         ),
//         body: Center(
//           child: GenderInputWidget(),
//         ),
//       ),
//     );
//   }
// }

// class GenderInputWidget extends StatefulWidget {
//   @override
//   _GenderInputWidgetState createState() => _GenderInputWidgetState();
// }

// class _GenderInputWidgetState extends State<GenderInputWidget> {
//   Gender _selectedGender = Gender.Male;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text('Select Gender:'),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Radio(
//               value: Gender.Male,
//               groupValue: _selectedGender,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedGender = value;
//                 });
//               },
//             ),
//             Text('Male'),
//             Radio(
//               value: Gender.Female,
//               groupValue: _selectedGender,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedGender = value;
//                 });
//               },
//             ),
//             Text('Female'),
//             Radio(
//               value: Gender.Other,
//               groupValue: _selectedGender,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedGender = value;
//                 });
//               },
//             ),
//             Text('Other'),
//           ],
//         ),
//         SizedBox(height: 20),
//         Text('Selected Gender: $_selectedGender'),
//         SizedBox(height: 20),
//         // Use the enum for gender input in TextFormField
//         TextFormField(
//           validator: (text) {
//             if (_selectedGender == null) {
//               return 'Please select a gender';
//             }
//             return null;
//           },
//           decoration: InputDecoration(labelText: "Gender"),
//         ),
//       ],
//     );
//   }
// }


                // SizedBox(height: 20),
                // TextFormField(
                //   controller: genderController,
                //   validator: (text) {
                //     if (text == null || text.isEmpty) {
                //       return 'Gender is empty';
                //     }
                //     return null;
                //   },
                //   decoration: InputDecoration(labelText: "Gender"),
                // ),




            //       StreamBuilder(
            //   stream: db.collection('firebase_curd_l2').snapshots(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (!snapshot.hasData) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else {
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: snapshot.data?.docs.length,
            //           itemBuilder: (context, int index) {
            //             DocumentSnapshot documentSnapshot =
            //                 snapshot.data.docs[index];
            //             return ListTile(
            //               title: Text(documentSnapshot['name']),
            //               trailing: IconButton(
            //                 icon: Icon(Icons.delete),
            //                 onPressed: () {
            //                   db
            //                       .collection('firebase_curd_l2')
            //                       .doc(documentSnapshot.id)
            //                       .delete();
            //                   ScaffoldMessenger.of(context)
            //                       .showSnackBar(const SnackBar(
            //                     content: Text("Deleted"),
            //                     backgroundColor: Colors.red,
            //                   ));
            //                 },
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     }
            //   }
            // ),