import 'package:flutter/material.dart';
import 'package:sisuupakara/Screens/home.dart';
import 'package:sisuupakara/Screens/register.dart';

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
                  height: 200,
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

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final String label;
  const CustomTextField(
      {Key? key, required this.label, required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration:
          InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double radius;
  final String label;
  final double height;
  final double minWidth;
  final void Function()? onPressed;
  const CustomButton({
    Key? key,
    required this.label,
    required this.height,
    required this.minWidth,
    required this.radius,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        height: height,
        minWidth: minWidth,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
      ),
    );
  }
}
