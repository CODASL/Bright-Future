import 'package:brightfuture/Models/user.dart';
import 'post_option.dart';

class Post {
  AppUser user;
  String postedData;
  String postBody;
  List<String> imgs;
  List<PostOption> options;
  Post({
    required this.user,
    required this.postedData,
    required this.postBody,
    required this.imgs,
    required this.options,
  });
}
