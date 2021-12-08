// ignore_for_file: missing_return

import 'package:flutter/material.dart';
import 'package:nextflow_personal_post/pages/new_post_page.dart';
import 'package:nextflow_personal_post/provider/post_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
         ChangeNotifierProvider(create: (BuildContext context) {
           return PostProvider();
         } ),
      ],
      child: MaterialApp(
        title: 'Nextflow Personal Post',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Personal Post'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return NewPostPage();
                  }),
                );
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: Consumer<PostProvider>(
          builder: (BuildContext context, PostProvider provider, Widget child) {
        return ListView.builder(
          itemCount: provider.posts.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(provider.posts[index]);
          },
        );
      }),


      // body: ListView.builder(
      //   itemCount: 1,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           padding: EdgeInsets.all(10),
      //           child: Column(
      //             children: [
      //               Text(
      //                 '10 min ago',
      //                 style: TextStyle(color: Colors.grey[400]),
      //               ),
      //               SizedBox(height: 10),
      //               Text(
      //                 'สวัสดีโลก',
      //                 style: TextStyle(fontSize: 20),
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               color: Colors.grey[350],
      //             ),
      //           ),
      //         ),
      //       ],
      //     );
      //   },
      // )
      
    );
  }
}
