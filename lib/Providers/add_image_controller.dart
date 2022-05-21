import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddImageController extends ChangeNotifier {
  Map<String, XFile?> images = {};
  String? postBody;

  addImage(String key, XFile? img) {
    images.addAll({key: img});

    notifyListeners();
  }

  postBodyOnChange(String postBody) {
    this.postBody = postBody;
    notifyListeners();
  }
}
