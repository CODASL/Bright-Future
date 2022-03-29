import 'package:flutter/cupertino.dart';

import '../Models/post.dart';

class PostController extends ChangeNotifier {
  List<Post> postList = [];

  addPosts(Post post) {
    postList.add(post);
    debugPrint(postList.length.toString());
  }
}
