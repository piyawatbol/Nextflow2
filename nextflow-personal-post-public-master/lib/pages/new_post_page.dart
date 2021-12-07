// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  const NewPostPage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างโพสใหม่"),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                autofocus: true,
                maxLines: 3,
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
                      Navigator.pop(context);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}