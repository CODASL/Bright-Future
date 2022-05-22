import 'package:brightfuture/Screens/home_screen.dart';
import 'package:brightfuture/Services/Database/post_handeling.dart';
import 'package:brightfuture/Widgets/Custom%20App%20Bar/custom_app_bar.dart';
import 'package:brightfuture/Widgets/CustomDrawer/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/post.dart';
import '../Providers/post_controller.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: customAppBar(title: "My Posts", context: context),
        body: StreamBuilder<QuerySnapshot>(
          stream: PostHandling.getPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            return Consumer<PostController>(
              builder: (context, postCtrl, child) {
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return EntirePost(post: Post.fromMap(data));
                  }).toList(),
                );
              },
            );
          },
        ));
  }
}
