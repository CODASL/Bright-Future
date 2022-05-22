import 'package:brightfuture/Widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends ChangeNotifier {
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

  pickImage(String imageName, BuildContext context) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      addImage(imageName, image);
    } catch (e) {
      showSnackBar(
          isError: true, message: "Something went wrong", ctx: context);
    }
  }
}
