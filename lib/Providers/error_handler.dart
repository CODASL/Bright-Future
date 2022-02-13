
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ErrorHandler extends ChangeNotifier {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  String? message;
  bool? isError;

  void setError({required bool isError, required String message}) {
    this.message = message;
    this.isError = isError;

    notifyListeners();
  }
}
