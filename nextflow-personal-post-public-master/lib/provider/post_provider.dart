// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nextflow_personal_post/database/post_db.dart';
import 'package:nextflow_personal_post/models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

// List <String>  get posts {
//     return _posts;
//   }

  List<Post> get posts => _posts; // เหมือนกันกับด้านบน

  addNewPost(String postMessage) async {
    var post = Post(messege: postMessage, createDate: DateTime.now());

    var postDB = PostDB(databaseName: 'app.db');
    await postDB.save(post);
    var postsFromDB = await postDB.loadAllPosts();

    _posts = postsFromDB;
    notifyListeners();
  }

  initData() async {
    var postDB = PostDB(databaseName: 'app.db');
    _posts = await postDB.loadAllPosts();
    notifyListeners();
  }

  clearAllPost() async {
    var postDB = PostDB(databaseName: 'app.db');
    await postDB.clearPostData();

    _posts = [];

    notifyListeners();
  }
}
