import 'package:brightfuture/Widgets/Profile%20Screen/profile_tile.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


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
            ProfileListTile(
              title: "Saman Kumara",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ProfileListTile(title: "City : Colombo"),
            ProfileListTile(title: "Email : example@gmail.com"),
            ProfileListTile(title: "Phone : +94778548789"),
          ],
        ),
      ),
    );
  }
}
