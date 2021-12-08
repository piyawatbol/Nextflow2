// ignore_for_file: deprecated_member_use
// ignore_for_file: missing_return
import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

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
                autofocus: true,
                maxLines: 3,
                validator: (String text) {
                  if (text.isEmpty) {
                    return 'กรุณากรอกข้อความ นะจ๊ะ อย่าเว้น อีดอก';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'คุณกำลังทำอะไรอยู่',
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
                      if (formKey.currentState.validate()) {
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
