// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PostProvider with ChangeNotifier {
  List<String> _posts = [];

// List <String>  get posts {
//     return _posts;
//   }

List<String> get post => _posts ; // เหมือนกันกับด้านบน 
addNewPost(String post){
  _posts.add(post) ;
  notifyListeners(); 
}

}
