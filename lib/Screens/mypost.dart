
import 'package:brightfuture/Screens/home_screen.dart';
import 'package:brightfuture/Widgets/Custom%20App%20Bar/custom_app_bar.dart';
import 'package:brightfuture/Widgets/CustomDrawer/drawer.dart';
import 'package:flutter/material.dart';


class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customAppBar(title: "My Posts", context: context),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const PostWidget();
        },
      ),
    );
  }
}
