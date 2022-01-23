import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'register.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Image.asset(logo),
                    ],
                  ),
                ),
                const CustomTextField(
                  isPassword: false,
                  label: 'Email',
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(
                  isPassword: true,
                  label: 'Password',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return const Home();
                    }));
                  },
                  radius: 25,
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width,
                  label: 'Login',
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const Register();
                    }));
                  },
                  radius: 25,
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width,
                  label: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
