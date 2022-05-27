import 'package:brightfuture/Models/faq.dart';
import 'package:brightfuture/Services/Database/faqs_handeling.dart';
import 'package:brightfuture/Widgets/custom_snackbar.dart';
import 'package:brightfuture/Widgets/loading_dialog.dart';
import 'package:flutter/cupertino.dart';

class FAQController extends ChangeNotifier {
  String? quiz;

  setQuiz(String? quiz) {
    this.quiz = quiz;
    notifyListeners();
  }

  createFaq(BuildContext context) {
    try {
      showLoaderDialog(context);
      FAQsHandeling.createFaq(
          FAQ(title: quiz ?? '', subtitle: "Not Answered yet"));
      Navigator.pop(context);
      Navigator.pop(context);
      quiz = null;
      notifyListeners();
    } on Exception {
      Navigator.pop(context);
      showSnackBar(isError: true, message: "Error Adding", ctx: context);
    }
  }
}
