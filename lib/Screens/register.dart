import 'package:brightfuture/Models/screen_size.dart';
import 'package:brightfuture/Models/user.dart';
import 'package:brightfuture/Screens/login.dart';
import 'package:brightfuture/Services/auth.dart';
import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:brightfuture/Widgets/Error%20Dialog/error_dialog.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/error_handler.dart';
import 'home.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController npassword = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pN = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    npassword.dispose();
    cpassword.dispose();
    city.dispose();
    pN.dispose();
    super.dispose();
  }

  onRegister() async {
    final errorHandler = Provider.of<ErrorHandler>(context, listen: false);

    if (npassword.text.isNotEmpty &&
        cpassword.text.isNotEmpty &&
        npassword.text == cpassword.text &&
        fullName.text.isNotEmpty &&
        city.text.isNotEmpty &&
        email.text.isNotEmpty &&
        pN.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      bool isRegistered = await AuthService().registerWithEmailPassword(
        user: AppUser(
          name: fullName.text,
          city: city.text,
          email: email.text,
          phoneNumber: pN.text,
        ),
        password: cpassword.text,
        errorHandler: errorHandler,
      );

      if (isRegistered) {
        setState(() {
          isLoading = false;
        });
        debugPrint("Registered Success");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
          (Route<dynamic> route) => false,
        );
      } else {
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (_) {
            return Consumer<ErrorHandler>(
              builder: (context, myType, child) {
                return ErrorDialog(
                  errorText: errorHandler.message.toString(),
                );
              },
            );
          },
        );
      }
    } else {
      showDialog(
          context: context,
          builder: (_) {
            return const ErrorDialog(
                errorText: "Please Fill All Fields Correctly");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
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
                      CustomTextField(
                        label: 'Full Name',
                        isPassword: false,
                        controller: fullName,
                      ),
                      CustomTextField(
                        label: 'Email',
                        isPassword: false,
                        controller: email,
                      ),
                      CustomTextField(
                        label: 'City',
                        isPassword: false,
                        controller: city,
                      ),
                      CustomTextField(
                        label: 'Phone Number',
                        isPassword: false,
                        controller: pN,
                      ),
                      CustomTextField(
                        label: 'New Password',
                        isPassword: true,
                        controller: npassword,
                      ),
                      CustomTextField(
                        label: 'Confirm Password',
                        isPassword: true,
                        controller: cpassword,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        onPressed: onRegister,
                        label: 'Register',
                        height: 50,
                        minWidth: ScreenSize.width,
                        radius: 25,
                      ),
                      CustomButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return const Login();
                          }));
                        },
                        label: "Log In",
                        height: 50,
                        minWidth: ScreenSize.width,
                        radius: 25,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
