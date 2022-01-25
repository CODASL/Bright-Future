import 'package:brightfuture/Widgets/Profile%20Screen/profile_tile.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "City",
      "Email",
      "Phone number",
    ];
    List<String> subtitles = [
      "Colombo",
      "example@gmail.com",
      "+94774758652",
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        elevation: 10,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 50,
            ),
            const ProfileListTile(
              title: "Saman Kumara",
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return ProfileListTile(
                  title: titles[index],
                  subtitle: subtitles[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
