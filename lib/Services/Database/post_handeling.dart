import 'package:brightfuture/Models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostHandling {
  static CollectionReference posts =
      FirebaseFirestore.instance.collection("posts");
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<String?> addPost(Post post) async {
    String? id =
        await posts.add(post.toMap()).then((DocumentReference<Object?> value) {
      debugPrint("Post Added");
      return value.id;
    });

    return id;
  }

  static Future<bool> updatePost(
      {required String key,
      required dynamic value,
      required String ref}) async {
    posts.doc(ref).update({key: value}).then((value) {
      return true;
    }).catchError((error, stackTrace) {
      throw error;
    });
    return false;
  }

  static Future deletePost(String docid) async {
    posts.doc(docid).delete().then((value) {}).catchError((error, stackTrace) {
      throw error;
    });
  }

  static Stream<QuerySnapshot> getPosts({String? uid, String? postType}) {
    return posts
        .orderBy('posted_date', descending: true)
        .where('posted_by', isEqualTo: uid)
        .where('postType', isEqualTo: postType)
        .snapshots();
  }
}
