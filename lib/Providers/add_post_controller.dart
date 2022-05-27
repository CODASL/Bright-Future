import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../Animations/page_transition_slide.dart';
import '../Models/post.dart';
import '../Screens/home.dart';
import '../Services/Database/post_handeling.dart';
import '../Services/storage.dart';
import '../Widgets/custom_snackbar.dart';
import '../Widgets/loading_dialog.dart';
import 'google_map_controller.dart';

class AddPostController extends ChangeNotifier {
  Map<String, XFile?> images = {};
  String? postBody;
  List<String> imgUrls = [];
  String? postType;

  addImage(String key, XFile? img) {
    images.addAll({key: img});
    notifyListeners();
  }

  setPostType(String? postType) {
    this.postType = postType;
    notifyListeners();
  }

  postBodyOnChange(String? postBody) {
    this.postBody = postBody;
    notifyListeners();
  }

  pickImage(String imageName, BuildContext context) async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      addImage(imageName, image);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future uploadImage({required BuildContext context, String? ref}) async {
    Storage storage = Storage();
    imgUrls.clear();
    if (images.isNotEmpty) {
      await Future.forEach(images.entries.map((e) => e.value).toList(),
          (XFile? image) async {
        if (image?.path != null) {
          final path = image?.path;
          final name = image?.name;

          await storage.uploadFile(
              path.toString(), name.toString(), 'postImages/$ref/$name');

          await storage.getFile('postImages/$ref/', '$name').then((String url) {
            imgUrls.add(url);
            notifyListeners();
          });
        } else {
          showSnackBar(isError: true, message: "No Images", ctx: context);
        }
      });
    }
  }

  createPost(BuildContext context) async {
    try {
      showLoaderDialog(context);
      final location = Provider.of<GoogleMapCtrl>(context, listen: false);
      print(location.address);
      String? ref = await PostHandling.addPost(
        Post(
            address: location.address,
            location: {
              "lat": location.lt?.latitude ?? 0.0,
              "lng": location.lt?.longitude ?? 0.0,
            },
            images: [],
            postBody: postBody ?? '',
            postedDate: Timestamp.now(),
            postType: postType ?? '',
            postedBy: FirebaseAuth.instance.currentUser?.uid),
      ).then((String? ref) {
        return ref;
      });

      await uploadImage(context: context, ref: ref).then((value) {
        PostHandling.updatePost(key: "images", value: imgUrls, ref: ref ?? '');
      });
      Navigator.pop(context);
      Navigator.pushReplacement(context, SlideTransition1(const Home()));
    } on Exception catch (e) {
      Navigator.pop(context);
      debugPrint(e.toString());
    }
  }

  deletePost(String docid) async {
    try {
      await PostHandling.deletePost(docid);
      notifyListeners();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
