// ignore_for_file: deprecated_member_use, unused_import

import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Do you have to delete it?"),
                    content: Text("delete all data"),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            Provider.of<PostProvider>(context, listen: false)
                                .clearAllPost(); // ทำการดึงฟังชั่นจากหน้าอื่น
                            Navigator.pop(context); // ทำการย้อนกลับ
                          },
                          child: Text("ok")),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context); // ทำการย้อนกลับ
                        },
                        child: Text("cancel"),
                      ),
                    ],
                  );
                });
          },
          child: Text('delete all data'),
        ),
      ),
    );
  }
}
