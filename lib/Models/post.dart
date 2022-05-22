import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? postedBy;
  Timestamp postedDate;
  String postBody;
  List<String> images;

  Post({
     this.postedBy,
    required this.postedDate,
    required this.postBody,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'postedBy': postedBy,
      'postedDate': postedDate,
      'postBody': postBody,
      'images': images,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postedBy: map['posted_by'] ?? '',
      postedDate: map['posted_date'],
      postBody: map['body'] ?? '',
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
