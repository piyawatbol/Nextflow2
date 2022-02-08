// ignore_for_file: deprecated_member_use, unused_local_variable
// ignore_for_file: missing_return
import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final postMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างโพสใหม่"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: postMessageController,
                autofocus: true,
                maxLines: 3,
                validator: (String text) {
                  if (text.isEmpty) {
                    return 'กรุณากรอกข้อความ นะจ๊ะ อย่าเว้น อีดอก';
                  }
                  if (text.length < 5) {
                    return 'ข้อความต้องมากกว่า 5 ตัวอักษร';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:'คุณกำลังทำอะไรอยู่',
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                    child: Text("Post"),
                    onPressed: () {
                      // ถ้าเช็คข้อ
                      {
                        var message = postMessageController.text;
                        print(message);
                        var postProvider =
                            Provider.of<PostProvider>(context, listen: false);
                        postProvider.addNewPost(message);
                        Navigator.pop(context);
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
