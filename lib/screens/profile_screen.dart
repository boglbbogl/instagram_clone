import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/widgets/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = Duration(milliseconds: 300);
  final menuWidth = size.width / 2;

  MenuStatus _menuStatus = MenuStatus.closed;
  double bodyXpos = 0;
  double meunXpos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            child: ProfileBody(onMenuChanged: () {
              setState(() {
                _menuStatus = (_menuStatus == MenuStatus.closed)
                    ? MenuStatus.opened
                    : MenuStatus.closed;
                switch (_menuStatus) {
                  case MenuStatus.opened:
                    bodyXpos = -menuWidth;
                    meunXpos = size.width - menuWidth;
                    break;
                  case MenuStatus.closed:
                    bodyXpos = 0;
                    meunXpos = size.width;
                    break;
                }
              });
            }),
            transform: Matrix4.translationValues(bodyXpos, 0, 0),
          ),
          AnimatedContainer(
            duration: duration,
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(meunXpos, 0, 0),
            child: Positioned(
              top: 0,
              bottom: 0,
              width: menuWidth,
              child: Container(
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuStatus { opened, closed }
