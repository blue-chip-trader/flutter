import 'dart:async';

import 'package:bluechip/app/models/posts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostService {
  CollectionReference postRef =
      FirebaseFirestore.instance.collection("posts");

  final StreamController<List<PostModel>> _postController =
      StreamController<List<PostModel>>.broadcast();

  Stream<List<PostModel>> findAll() {
    // Register the handler for when the posts data changes
    postRef.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.docs.isNotEmpty) {
        var posts = postsSnapshot.docs
            .map((snapshot) => PostModel.fromDocumentSnapshot(snapshot))
            .toList();
        print(posts.length);
        // Add the posts onto the controller
        _postController.add(posts);
      }
    });
    // Return the stream underlying our _postsController.
    return _postController.stream;
  }

  Future<PostModel> findOne(String id) async {
    var result = await postRef.doc(id).get();
    return PostModel.fromDocumentSnapshot(result);
  }
}

// Future<void> updateOne(PostModel post) async {
//   productsRef.doc(post.id).update(post.toJson());
// }
