import 'dart:async';
import 'package:brightfuture/Widgets/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Models/screen_size.dart';
import '../Providers/register_controller.dart';
import '../Providers/validations.dart';
import '../Widgets/Custom Button/custom_button.dart';
import '../Widgets/Custom Text Field/custom_textfield.dart';
import '../Widgets/CustomText/custom_text.dart';
import '../Widgets/loading.dart';
import 'home.dart';
import 'login.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
    }
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  @override
  void dispose() {
    timer!.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? const Home()
        : Scaffold(
            appBar: AppBar(
              title: const CustomText(title: "Verify your email"),
              centerTitle: true,
            ),
            body: SizedBox(
              width: ScreenSize.width,
              height: ScreenSize.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    title: "Verification email sent to your email",
                    fontSize: 20,
                  ),
                  CustomText(
                    title: FirebaseAuth.instance.currentUser?.email ??
                        "Loading ..",
                    fontSize: 15,
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.05,
                  ),
                  CustomButton(
                    radius: 0,
                    height: ScreenSize.height * 0.08,
                    label: "Resend",
                    minWidth: ScreenSize.width * 0.8,
                    onPressed: () async {
                      await sendVerificationEmail();
                    },
                  ),
                  SizedBox(
                    height: ScreenSize.height * 0.02,
                  ),
                  CustomButton(
                    radius: 0,
                    height: ScreenSize.height * 0.08,
                    label: "Change Email Address",
                    minWidth: ScreenSize.width * 0.8,
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return ChangeEmailBox(
                                sendVerificationEmail: sendVerificationEmail());
                          });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () async {
                        try {
                          timer?.cancel();
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                            (Route<dynamic> route) => false,
                          );
                        } catch (e) {
                          debugPrint("$e");
                        }
                      },
                      child: const CustomText(title: "Cancel"))
                ],
              ),
            ),
          );
  }
}

class ChangeEmailBox extends StatefulWidget {
  final Future<dynamic> sendVerificationEmail;
  const ChangeEmailBox({Key? key, required this.sendVerificationEmail})
      : super(key: key);

  @override
  State<ChangeEmailBox> createState() => _ChangeEmailBoxState();
}

class _ChangeEmailBoxState extends State<ChangeEmailBox> {
  final _changeMail = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _changeMail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(
      builder: (context, regCtrl, child) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            title: const Center(child: CustomText(title: "Change Email")),
            content: SizedBox(
              height: ScreenSize.height * 0.15,
              width: ScreenSize.width,
              child: regCtrl.isLoading
                  ? const LoadingWidget()
                  : Center(
                      child: CustomTextField(
                        hintText: "New Email address",
                        controller: _changeMail,
                        validator: (val) {
                          return ValidationController.isEmailValidated(val);
                        },
                        prefixIcon: const Icon(FontAwesomeIcons.envelope),
                      ),
                    ),
            ),
            actions: [
              CustomButton(
                minWidth: ScreenSize.width * 0.8,
                radius: 0,
                height: ScreenSize.height * 0.08,
                label: "Change",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      regCtrl.setLoadingOnchanged(true);
                      await FirebaseAuth.instance.currentUser!
                          .updateEmail(_changeMail.text.trim());
                      await FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({"email": _changeMail.text.trim()});
                      await widget.sendVerificationEmail;
                      Navigator.pop(context);
                      regCtrl.setLoadingOnchanged(false);
                    } on FirebaseException catch (e) {
                      showSnackBar(
                          isError: true, message: e.code, ctx: context);
                      regCtrl.setLoadingOnchanged(false);
                    }
                  }
                },
              ),
              CustomButton(
                minWidth: ScreenSize.width * 0.8,
                radius: 0,
                height: ScreenSize.height * 0.08,
                label: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
