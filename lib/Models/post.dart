import 'package:brightfuture/Models/user.dart';


class Post {
  AppUser? user;
  String? postedDate;
  String? postBody;
  List<String>? imgs;

  Post({
     this.user,
     this.postedDate,
     this.postBody,
     this.imgs,
  });

  Post.fromJson(Map<String, dynamic> json) {
    user = json['uid'];
    postedDate = json['postedDate'];
    postBody = json['postBody'];
    imgs = json['imgs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = user;
    data['postedDate'] = postedDate;
    data['postBody'] = postBody;
    data['imgs'] = imgs;
    return data;
  }
}
