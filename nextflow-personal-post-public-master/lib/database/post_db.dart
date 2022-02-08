// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:nextflow_personal_post/models/post_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PostDB {
  String databaseName;

  PostDB({this.databaseName});

  Future<Database> openDatabase() async {
    //ทำการระบุที่อยู่และทำการเชื่อมต่อ ดาต้าเบส
    Directory appDocumentDirectory = await getApplicationDocumentsDirectory();
    String databaseLocationInApp =
        join(appDocumentDirectory.path, this.databaseName);

    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(databaseLocationInApp);
    return db;
  }

  Future<int> save(Post post) async {
    var database = await this.openDatabase();
    var postStore = intMapStoreFactory.store('posts'); // เพิ่มรันเลขอัตโนมัติ

    var dataId = await postStore.add(database, Post.toJson(post));

    await database.close();
    return dataId;
  }

  Future<List<Post>> loadAllPosts() async {
    var database = await this.openDatabase();
    var postStore = intMapStoreFactory.store('posts');

    var snapshots = await postStore.find(
      database,
      finder: Finder(
          sortOrders: [SortOrder(Field.key, false)]), // ทำการเรียง ข้อมูล
    );
    var postsList = List<Post>();

    for (var record in snapshots) {
      var post = Post.fromRecord(record);
      postsList.add(post);
    }

    return postsList;
  }

  Future<void> clearPostData() async {
    var database = await this.openDatabase();
    var postStore = intMapStoreFactory.store('posts');
    await postStore.drop(database);
  }
}
