import 'package:brightfuture/Screens/show_location.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Models/post.dart';
import '../Models/screen_size.dart';
import '../Services/Database/user_handeling.dart';
import '../Widgets/CustomText/custom_text.dart';
import '../constant/colors.dart';
import '../constant/image.dart';

class PostScreen extends StatelessWidget {
  final Post post;
  const PostScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: ScreenSize.height * 0.02,
          ),
          post.images.length == 1
              ? SizedBox(
                  height: ScreenSize.height * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PostImageWidget(imageUrl: post.images[0]),
                    ],
                  ),
                )
              : post.images.length == 2
                  ? SizedBox(
                      height: ScreenSize.height * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PostImageWidget(imageUrl: post.images[1]),
                        ],
                      ),
                    )
                  : const SizedBox(),
          UserTile(
            post: post,
          ),
          PostDescription(
            title: post.postBody,
          ),
          PostTypeTile(
            postType: post.postType,
          ),
          LocationTile(post: post),
        ],
      )),
    );
  }
}

class LocationTile extends StatelessWidget {
  final Post post;
  const LocationTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          FontAwesomeIcons.locationArrow,
          color: primaryColor,
        ),
        title: const CustomText(
          title: "Location",
        ),
        subtitle: CustomText(title: post.address),
        trailing: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ShowLocation(
                lat: post.location['lat'] ?? 0.0,
                lng: post.location['lng'] ?? 0.0,
              );
            }));
          },
          icon: Icon(
            FontAwesomeIcons.map,
            color: primaryColor,
          ),
        ));
  }
}

class PostTypeTile extends StatelessWidget {
  final String postType;
  const PostTypeTile({Key? key, required this.postType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        FontAwesomeIcons.gift,
        color: primaryColor,
      ),
      title: const CustomText(
        title: "Post Type",
      ),
      subtitle: CustomText(title: postType + " Post"),
    );
  }
}

class PostDescription extends StatelessWidget {
  final String title;
  const PostDescription({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.width * 0.03,
          vertical: ScreenSize.height * 0.015),
      child: CustomText(title: title),
    );
  }
}

class PostImageWidget extends StatelessWidget {
  final String imageUrl;
  const PostImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: CachedNetworkImage(
      imageUrl: imageUrl,
    ));
  }
}

class UserTile extends StatelessWidget {
  final Post post;
  const UserTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: UserHandling.getUserFieldValue(post.postedBy),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var item = snapshot.data?.docs[0];
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: item?.get('photoUrl') ?? dp,
              imageBuilder: (context, imageProvider) => Container(
                height: ScreenSize.height * 0.12,
                width: ScreenSize.width * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            title: CustomText(
                title: "Posted By : ${item?.get('fullName') ?? "Loading .."}"),
            subtitle: CustomText(title: post.postedDate.toDate().toString()),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chat,
                  color: primaryColor,
                )),
          );
        });
  }
}
