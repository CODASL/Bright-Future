
import 'package:flutter/material.dart';
import '../Models/user_data.dart';

class ProfileScreenController extends ChangeNotifier {
  UserData? user;

  setUser(UserData user) {
    this.user = user;
  }
}
