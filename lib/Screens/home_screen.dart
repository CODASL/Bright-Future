import 'package:brightfuture/Providers/my_post_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/post.dart';
import '../Models/screen_size.dart';
import '../Services/Database/post_handeling.dart';
import '../Services/Database/user_handeling.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: PostHandling.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return EntirePost(
              post: Post.fromMap(data),
              ref: document.reference.id,
            );
          }).toList(),
        );
      },
    );
  }
}

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
                        print("del");
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
    return Text(
      postBody,
      textAlign: TextAlign.justify,
    );
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
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: ScreenSize.height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(images[index]), fit: BoxFit.cover)),
        );
      },
    );
  }
}
