import 'package:brightfuture/Models/screen_size.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const PostWidget();
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
        child: Column(
          children: const [
            PostHeader(),
            PostBody(),
            SizedBox(
              height: 15,
            ),
            PostImages(),
          ],
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: const Text("Full Name"),
      subtitle: Text(DateTime.now().toString()),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
      ),
    );
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
