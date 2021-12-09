// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nextflow_personal_post/models/post_model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];

// List <String>  get posts {
//     return _posts;
//   }

  List<Post> get posts => _posts; // เหมือนกันกับด้านบน

  addNewPost(String postMessage) {
    var post = Post(messege: postMessage, createDate: DateTime.now());
    _posts.insert(0, post);
    notifyListeners();
  }
}
