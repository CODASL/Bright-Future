import 'package:flutter/material.dart';
import 'package:sisuupakara/Screens/home.dart';
import 'package:sisuupakara/Screens/register.dart';
import 'package:sisuupakara/Widgets/Custom%20Button/custom_button.dart';
import 'package:sisuupakara/Widgets/Custom%20Text%20Field/custom_textfield.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("Bright Future")],
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
