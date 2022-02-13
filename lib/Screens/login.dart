import 'package:brightfuture/Services/auth.dart';
import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                          children: [
                            Image.asset(logo),
                          ],
                        ),
                      ),
                      CustomTextField(
                        controller: email,
                        isPassword: false,
                        label: 'Email',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextField(
                        controller: password,
                        isPassword: true,
                        label: 'Password',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        onPressed: () async {
                          if (email.text.isNotEmpty &&
                              password.text.isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            bool isLoggedIn = await AuthService()
                                .signInWithEmailPassword(
                                    email: email.text, password: password.text);
                            if (isLoggedIn) {
                              debugPrint("Logged in");
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return const Home();
                              }));
                              setState(() {
                                isLoading = false;
                              });
                            } else {
                              debugPrint("Login Failed");
                              setState(() {
                                isLoading = false;
                              });
                            }
                          } else {
                            debugPrint("Invalid Credentials");
                          }
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
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
