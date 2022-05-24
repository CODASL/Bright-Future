import 'package:brightfuture/Widgets/CustomText/custom_text.dart';
import 'package:brightfuture/Widgets/loading.dart';
import 'package:brightfuture/constant/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Models/post.dart';
import '../../Models/screen_size.dart';
import '../../Providers/my_post_controller.dart';
import '../../Services/Database/user_handeling.dart';

class EntirePost extends StatelessWidget {
  final Post post;
  final String ref;
  const EntirePost({Key? key, required this.post, required this.ref})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        ScreenSize.width * 0.02,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(ScreenSize.width * 0.02),
          child: Column(
            children: [
              PostHeader(
                uid: post.postedBy,
                postedDate: post.postedDate,
                ref: ref,
              ),
              PostBody(postBody: post.postBody),
              const SizedBox(
                height: 15,
              ),
              post.images.isNotEmpty
                  ? PostImages(images: post.images)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final String? uid;
  final Timestamp postedDate;
  final String ref;
  const PostHeader(
      {Key? key,
      required this.uid,
      required this.postedDate,
      required this.ref})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const menuItems = ['Update', 'Delete'];
    return StreamBuilder<QuerySnapshot>(
      stream: UserHandling.getUserFieldValue(uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        String? photoUrl = snapshot.data?.docs[0].get('photoUrl');
        String? name = snapshot.data?.docs[0].get('fullName');
        return ListTile(
            leading: photoUrl == null
                ? null
                : CircleAvatar(
                    backgroundImage: NetworkImage(photoUrl),
                  ),
            title: Text(name ?? "Loading...."),
            subtitle: Text(postedDate.toDate().toString()),
            trailing: uid == FirebaseAuth.instance.currentUser!.uid
                ? PopupMenuButton<String>(
                    onSelected: (String val) {
                      if (val == "Delete") {
                        Provider.of<MyPostController>(context, listen: false)
                            .deletePost(ref);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return menuItems.map((val) {
                        return PopupMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList();
                    },
                  )
                : null);
      },
    );
  }
}

class PostBody extends StatelessWidget {
  final String postBody;
  const PostBody({Key? key, required this.postBody}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ShowBodyText(bodyText: postBody),
    );
  }
}

class ShowBodyText extends StatelessWidget {
  final String bodyText;
  const ShowBodyText({Key? key, required this.bodyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bodyText.length > 100) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(text: bodyText.substring(0, 100)),
            TextSpan(
                style: TextStyle(color: primaryColor), text: "read more ...")
          ],
        ),
      );
    }
    return CustomText(title: bodyText);
  }
}

class PostImages extends StatelessWidget {
  final List<String> images;
  const PostImages({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 3),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return CachedNetworkImage(
          imageUrl: images[index],
          imageBuilder: (context, imageProvider) => Container(
            height: ScreenSize.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => const LoadingWidget(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      },
    );
  }
}
