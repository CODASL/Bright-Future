import 'package:brightfuture/Models/user.dart';
import 'package:brightfuture/Services/Database/user_handeling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

//Register in using email pass
  Future<bool> registerWithEmailPassword({
    required AppUser user,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      UserHandling.adduser(
        user: user,
        uid: userCredential.user!.uid,
      );

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

//Sign in using email pass
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
      debugPrint(e.toString());
      return false;
    }
  }
}

//Add User


