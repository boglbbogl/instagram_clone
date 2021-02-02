import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/auth_input_decor.dart';
import 'package:instagram_clone/constants/common_size.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/models/firebase_auth_state.dart';
import 'package:provider/provider.dart';
import 'or_divider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _cpwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    _cpwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(common_gap),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: common_l_gap,
              ),
              Image.asset(
                'assets/images/insta_text_logo.png',
                scale: 3.5,
              ),
              TextFormField(
                cursorColor: Colors.black54,
                controller: _emailController,
                decoration: textInputDecor('Email'),
                validator: (text) {
                  if (text.isNotEmpty && text.contains("@")) {
                    return null;
                  } else {
                    return '정확한 이메일 주소를 입력해주세요!!';
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                cursorColor: Colors.black54,
                obscureText: true,
                controller: _pwController,
                decoration: textInputDecor('Password'),
                validator: (text) {
                  if (text.isNotEmpty && text.length > 5) {
                    return null;
                  } else {
                    return '제대로 된 비밀번호를 입력해주세요';
                  }
                },
              ),
              SizedBox(
                height: common_xs_gap,
              ),
              TextFormField(
                cursorColor: Colors.black54,
                obscureText: true,
                controller: _cpwController,
                decoration: textInputDecor('Confirm password'),
                validator: (text) {
                  if (text.isNotEmpty && _pwController.text == text) {
                    return null;
                  } else {
                    return '입력한 값이 비밀번호와 일치하지 않습니다';
                  }
                },
              ),
              SizedBox(
                height: common_s_gap,
              ),
              _summitButton(context),
              SizedBox(
                height: common_s_gap,
              ),
              OrDivider(),
              FlatButton.icon(
                icon: ImageIcon(AssetImage('assets/images/facebook.png')),
                label: Text('Login with Facebook'),
                onPressed: () {
                  Provider.of<FirebaseAuthState>(context, listen: false)
                      .changeFirebaseAuthStatus(FirebaseAuthStatus.signin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  FlatButton _summitButton(BuildContext context) {
    return FlatButton(
              color: Colors.blue,
              child: Text(
                'Join',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if(_formKey.currentState.validate()){
                  print('Validation success!!');
                  Provider.of<FirebaseAuthState>(context, listen: false)
                      .registerUser(context, email:_emailController.text , password: _pwController.text);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            );
  }
}

