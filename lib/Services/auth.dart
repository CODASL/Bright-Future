import 'package:brightfuture/Models/user.dart';
import 'package:brightfuture/Providers/error_handler.dart';
import 'package:brightfuture/Services/Database/user_handeling.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

//Register in using email pass
  Future<bool> registerWithEmailPassword({
    required AppUser user,
    required String password,
    required ErrorHandler errorHandler,
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
      errorHandler.setError(isError: false, message: "Registered Successfully");
      debugPrint(errorHandler.message.toString());

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorHandler.setError(isError: true, message: "Weak Password");
        debugPrint("Error" + errorHandler.message.toString());
      } else if (e.code == "email-already-in-use") {
        errorHandler.setError(
            isError: true,
            message: 'The account already exists for that email.');
        debugPrint("Error" + errorHandler.message.toString());
      }
      return false;
    } catch (e) {
      errorHandler.setError(isError: true, message: e.toString());
      debugPrint("Error" + errorHandler.message.toString());
      return false;
    }
  }

//Sign in using email pass
  Future<bool> signInWithEmailPassword({
    required String email,
    required String password,
    required ErrorHandler errorHandler,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(userCredential.user!.uid);
      errorHandler.setError(isError: false, message: "Login success");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        errorHandler.setError(
            isError: true, message: 'No user found for that email.');
        return false;
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        errorHandler.setError(
            isError: true, message: 'Wrong password provided for that user.');

        return false;
      } else {
        debugPrint(e.toString());
        errorHandler.setError(isError: true, message: e.toString());
      }

      return false;
    } catch (e) {
      debugPrint(e.toString());
      errorHandler.setError(isError: true, message: e.toString());
      return true;
    }
  }
}

//Add User


