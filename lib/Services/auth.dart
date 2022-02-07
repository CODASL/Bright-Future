import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> registerWithEmailPassword(
      {required String email,
      required String password,
      required String fullName,
      required String city,
      required String phoneNumber}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      users
          .doc(userCredential.user!.uid)
          .set({
            'fullName': fullName,
            'email': email,
            'city': city,
            'phoneNumber': phoneNumber,
            'uid': userCredential.user!.uid,
          })
          .then((val) => debugPrint("User Added"))
          .catchError((error) => debugPrint(error.toString()));

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint("Weak Password");
      } else if (e.code == "email-already-in-use") {
        debugPrint('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(userCredential.user!.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        return false;
      }
      return false;
    }
  }
}
