import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sisuupakara/constant/image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 10,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 50,
            ),
            ListTile(
              title: Center(
                  child: Text(
                "Saman Kumara",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
            ),
            ListTile(
              title: Center(child: Text("City : Colombo")),
            ),
            ListTile(
              title: Center(child: Text("Email : example@gmail.com")),
            ),
            ListTile(
              title: Center(child: Text("Phone : +94778548789")),
            ),
          ],
        ),
      ),
    );
  }
}
