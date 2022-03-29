import 'package:brightfuture/Models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostHandling {
  CollectionReference posts = FirebaseFirestore.instance.collection("posts");
  Future<bool> addPost(Post post) async {
    int docID = 0;
    posts.doc((docID++).toString()).set({
      "body": post.postBody,
      "images": post.imgs,
      "posted_by": post.user,
      "posted_date": post.postedDate,
    }).then((value) {
      debugPrint("Post Added");
      return true;
    }).catchError((error) {
      debugPrint(error.toString());
      return false;
    });
    return false;
  }

  Future<bool> updatePost(Post post) async {
    DocumentReference docRef = posts.doc();
    DocumentSnapshot docSnap = await docRef.get();
    posts.doc().update({
      "body": post.postBody,
      "images": post.imgs,
      "posted_by": post.user,
      "posted_date": post.postedDate,
    }).then((value) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
    return false;
  }

  Future<bool> deletePost() async {
    posts.doc().delete().then((value) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
    return false;
  }

  Stream<QuerySnapshot> getPosts() {
    return posts.snapshots();
  }
}
