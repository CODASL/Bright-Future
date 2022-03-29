import 'package:brightfuture/Widgets/Profile%20Screen/profile_tile.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<String> titles = [
                "City",
                "Email",
                "Phone number",
              ];
              var user = snapshot.data;
              List subtitles = [
                user["city"],
                user["email"],
                user["phoneNumber"]
              ];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(avatar),
                    radius: 50,
                  ),
                  ProfileListTile(
                    title: user["fullName"],
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
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
