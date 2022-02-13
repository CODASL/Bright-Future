import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginState extends ChangeNotifier {
  bool isLoggedIn = false;

  Future<void> checkLoginState() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isLoggedIn = false;
        notifyListeners();
      } else {
        isLoggedIn = true;
        notifyListeners();
      }
    });
  }
}
