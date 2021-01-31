import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/widgets/sigh_up_form.dart';
import 'package:instagram_clone/widgets/sign_in_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Widget signUpForm = SignUpForm();
  Widget signInForm = SignInForm();

  Widget currentWidgets;

  @override
  void initState() {
    if(currentWidgets == null)
      currentWidgets = signUpForm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
                child: currentWidgets,
              duration: duration,
            ),
            Container(
              child: FlatButton(onPressed: () {
                setState(() {
                  if(currentWidgets is SignUpForm){
                    currentWidgets = signInForm;
                  } else{
                    currentWidgets = signUpForm;
                  }
                });
              },
                  child: Text('go to Sign up')),
            ),
          ],
        ),
      ),
    );
  }
}
