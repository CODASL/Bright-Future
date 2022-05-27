import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String? postedBy;
  Timestamp postedDate;
  String postBody;
  List<String> images;
  String postType;
  Map<String, double> location;

  Post({
    this.postedBy,
    required this.postedDate,
    required this.postBody,
    required this.images,
    required this.postType,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'postedBy': postedBy,
      'postedDate': postedDate,
      'postBody': postBody,
      'images': images,
      'postType': postType,
      'location': location,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postedBy: map['postedBy'],
      postedDate: map['postedDate'],
      postBody: map['postBody'] ?? '',
      images: List<String>.from(map['images']),
      postType: map['postType'] ?? '',
      location: Map<String, double>.from(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}
