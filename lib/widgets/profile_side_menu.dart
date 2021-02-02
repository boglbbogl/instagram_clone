import 'package:flutter/material.dart';
import 'package:instagram_clone/models/firebase_auth_state.dart';
import 'package:provider/provider.dart';

class ProfileSideMenu extends StatelessWidget {
  final double meunWidth;

  const ProfileSideMenu(
    this.meunWidth, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: meunWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
              title: Text('Sign Out'),
              onTap: (){
                Provider.of<FirebaseAuthState>(context, listen: false).signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
