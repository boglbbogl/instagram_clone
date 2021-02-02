import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/post.dart';

class FeedScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: () {
          },
          icon: Icon(
            Icons.send,
            color: Colors.black87,
          ),
        ),
        middle: Text(
          'instagram',
          style: TextStyle(
            fontFamily: 'VeganStyle',
            color: Colors.black87,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {
              },
              icon: ImageIcon(
                AssetImage('assets/images/actionbar_camera2.png'),
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: feedListBuilder,
      ),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Post(index);
  }
}


