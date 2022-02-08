import 'package:brightfuture/Models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserHandling {
  static Future<void> adduser(
      {required AppUser user, required String uid}) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users
        .doc(uid)
        .set({
          'fullName': user.name,
          'email': user.email,
          'city': user.city,
          'phoneNumber': user.phoneNumber,
          'uid': uid,
        })
        .then((val) => debugPrint("User Added"))
        .catchError((error) => debugPrint(error.toString()));
  }
}
