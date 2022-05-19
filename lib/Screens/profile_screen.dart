import 'package:badges/badges.dart';
import 'package:brightfuture/Providers/profile_screen_controller.dart';
import 'package:brightfuture/Services/Database/user_handeling.dart';
import 'package:brightfuture/Widgets/loading.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/screen_size.dart';
import '../Models/user_data.dart';
import '../Widgets/CustomText/custom_text.dart';
import '../Widgets/Profile Screen/profile_tile.dart';
import '../constant/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 30, vertical: ScreenSize.height * 0.1),
        child: Material(
          borderRadius: BorderRadius.circular(25),
          elevation: 7,
          color: Colors.white,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: UserHandling.getCurrentUserDetails(),
            builder: (context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              if (snapshot.data != null) {
                UserData user = UserData.fromMap(
                    snapshot.data?.data() as Map<String, dynamic>);
                Provider.of<ProfileScreenController>(context, listen: false)
                    .setUser(user);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Badge(
                      badgeContent: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: kWhite,
                          )),
                      child: CircleAvatar(
                        backgroundColor: kWhite,
                        child: CachedNetworkImage(
                            imageUrl:
                                "https://firebasestorage.googleapis.com/v0/b/bright-future-6834f.appspot.com/o/avt.png?alt=media&token=84ac186f-4d52-4c9e-8756-727303f14ee7",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.error);
                            }),
                        radius: 70,
                      ),
                    ),
                    CustomText(
                      title: user.fullName,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: ScreenSize.height * 0.05,
                    ),
                    Column(
                      children: [
                        ProfileListTile(
                          leading: Icons.person,
                          title: "Name",
                          subtitle: user.fullName,
                        ),
                        ProfileListTile(
                          leading: Icons.location_city,
                          title: "City",
                          subtitle: user.city,
                        ),
                        ProfileListTile(
                          leading: Icons.mail,
                          title: "Email",
                          subtitle: user.email,
                        ),
                        ProfileListTile(
                          leading: Icons.call,
                          title: "Phone Number",
                          subtitle: user.phoneNumber,
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
