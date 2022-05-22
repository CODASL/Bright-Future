import 'package:brightfuture/Services/Database/post_handeling.dart';
import 'package:flutter/cupertino.dart';

class MyPostController extends ChangeNotifier {
  String? dropdownvalue = 'Claim';
  var items = [
    'Claim',
    'Offer',
  ];

  setPostType(String? dropdownvalue) {
    this.dropdownvalue = dropdownvalue;
    notifyListeners();
  }

  deletePost(String docid) async {
    try {
      await PostHandling.deletePost(docid);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
