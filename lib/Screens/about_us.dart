import 'package:brightfuture/Widgets/Custom%20App%20Bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(title: "About us", context: context),
    );
  }
}
