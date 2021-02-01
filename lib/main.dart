import 'package:flutter/material.dart';
import 'package:instagram_clone/models/firebase_auth_state.dart';
import 'package:instagram_clone/screens/auth_screen.dart';
import 'package:instagram_clone/widgets/my_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'constants/material_white.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  FirebaseAuthState _firebaseAuthState = FirebaseAuthState();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FirebaseAuthState>.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        // home: AuthScreen(),
        home: Consumer<FirebaseAuthState>(
            builder: (BuildContext context, FirebaseAuthState firebaseAuthState,
                Widget child) {
              switch (firebaseAuthState.firebaseAuthStatus) {
                case FirebaseAuthStatus.signout:
                  return AuthScreen();
                case FirebaseAuthStatus.signin:
                  return HomePage();
                default:
                  return MyProgressIndicator();
              }
            },
        ),
        theme: ThemeData(
          primarySwatch: white,
        ),
      ),
    );
  }
}
