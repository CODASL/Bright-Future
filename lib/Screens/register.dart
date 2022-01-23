import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:flutter/material.dart';

import 'home.dart';


class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(logo),
                    ],
                  ),
                ),
                const CustomTextField(label: 'Full Name', isPassword: false),
                const CustomTextField(label: 'Email', isPassword: false),
                const CustomTextField(label: 'New Password', isPassword: true),
                const CustomTextField(
                    label: 'Confirm Password', isPassword: true),
                CustomButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  label: 'Register',
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width,
                  radius: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
