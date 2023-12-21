import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_l2/models/userdata.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> registerUser({
    required String email,
    required String password,
    required String username,
    required String bio,
  }) async {
    String resp = "Some Erroe Occured";
    try {
      if (email.isEmpty ||
          password.isEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserData userData = UserData(
            email: email, uid: cred.user!.uid, username: username, bio: bio);

        await _fireStore.collection('users').doc(cred.user!.uid).set(
              userData.toJson(),
            );
        resp = 'success';
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }

  // Future<String> loginUser({
  //   required String email,
  //   required String password,
  // }) async {
  //   String res = "Some error occured";

  //   try {
  //     if (email.isEmpty || password.isEmpty) {
  //       await _auth.signInWithEmailAndPassword(
  //           email: email, password: password);
  //       res = "sucess";
  //     } else {
  //       res = "Please Enter All the Fields";
  //     }
  //   } catch (err) {
  //     res = err.toString();
  //   }
  // }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please Enter Both Email and Password";
      }
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
