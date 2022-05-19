
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/post.dart';
import '../Models/screen_size.dart';
import '../Providers/post_controller.dart';
import '../Services/Database/post_handeling.dart';
import '../Widgets/CustomText/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostHandling postHandling = PostHandling();
    return StreamBuilder<QuerySnapshot>(
      stream: postHandling.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return Consumer<PostController>(
          builder: (context, postCtrl, child) {
          
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                try {
                  postCtrl.addPosts(Post(
                    imgs: data['images'],
                    postBody: data['body'],
                    postedDate: data['posted_date'],
                    user: data['posted_by'],
                  ));
                  return ListTile(
                    title: Text(data['body']),
                  );
                } catch (e) {
                  return Center(
                    child: CustomText(title: e.toString()),
                  );
                }
              }).toList(),
            );
          },
        );
      },
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenSize.height * 0.03),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.width * 0.04,
            vertical: ScreenSize.height * 0.01),
        width: ScreenSize.width,
        child: const EntirePost(),
      ),
    );
  }
}

class EntirePost extends StatelessWidget {
  const EntirePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PostHeader(),
        PostBody(),
        SizedBox(
          height: 15,
        ),
        PostImages(),
      ],
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const menuItems = ['Update', 'Delete'];
    return ListTile(
        leading: const CircleAvatar(),
        title: const Text("Full Name"),
        subtitle: Text(DateTime.now().toString()),
        trailing: PopupMenuButton<String>(
          onSelected: (String val) {},
          itemBuilder: (BuildContext context) {
            return menuItems.map((val) {
              return PopupMenuItem<String>(
                value: val,
                child: Text(val),
              );
            }).toList();
          },
        ));
  }
}

class PostBody extends StatelessWidget {
  const PostBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorempsum ha Is been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      textAlign: TextAlign.justify,
    );
  }
}

class PostImages extends StatelessWidget {
  const PostImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.height * 0.2,
      width: ScreenSize.width,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 3),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
