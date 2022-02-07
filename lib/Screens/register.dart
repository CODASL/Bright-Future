import 'package:brightfuture/Services/auth.dart';
import 'package:brightfuture/Widgets/Custom%20Button/custom_button.dart';
import 'package:brightfuture/Widgets/Custom%20Text%20Field/custom_textfield.dart';
import 'package:brightfuture/constant/image.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                      CustomButton(
                        onPressed: () async {
                          if (npassword.text.isNotEmpty &&
                              cpassword.text.isNotEmpty &&
                              npassword.text == cpassword.text &&
                              fullName.text.isNotEmpty &&
                              city.text.isNotEmpty &&
                              email.text.isNotEmpty &&
                              pN.text.isNotEmpty) {
                            debugPrint(npassword.text + " " + cpassword.text);
                            setState(() {
                              isLoading = true;
                            });
                            bool isRegistered = await AuthService()
                                .registerWithEmailPassword(
                                    phoneNumber: pN.text,
                                    city: city.text,
                                    email: email.text,
                                    password: cpassword.text,
                                    fullName: fullName.text);

                            if (isRegistered) {
                              setState(() {
                                isLoading = false;
                              });
                              debugPrint("Registered Success");
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              debugPrint("Registration Fail");
                            }
                          } else {
                            debugPrint("Something went wrong");
                          }
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
