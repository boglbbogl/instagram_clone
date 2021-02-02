import 'package:flutter/foundation.dart';
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
  Widget _currentWidget;
  @override
  Widget build(BuildContext context) {
    _firebaseAuthState.watchAuthChange();
    return ChangeNotifierProvider<FirebaseAuthState>.value(
      value: _firebaseAuthState,
      child: MaterialApp(
        // home: AuthScreen(),
        home: Consumer<FirebaseAuthState>(
            builder: (BuildContext context, FirebaseAuthState firebaseAuthState,
                Widget child) {

              switch (firebaseAuthState.firebaseAuthStatus) {
                case FirebaseAuthStatus.signout:
                  _currentWidget = AuthScreen();
                  break;
                case FirebaseAuthStatus.signin:
                  _currentWidget = HomePage();
                  break;
                  default:
                    _currentWidget = MyProgressIndicator();
              }
              return AnimatedSwitcher(
                child: _currentWidget,
                  duration: Duration(milliseconds: 300),
              );
            }
        ),
        theme: ThemeData(
          primarySwatch: white,
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Widget>('_currentWidget', _currentWidget));
  }
}
