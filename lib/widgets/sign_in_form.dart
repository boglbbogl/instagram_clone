import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/auth_input_decor.dart';
import 'package:instagram_clone/constants/common_size.dart';
import '../home_page.dart';
import 'or_divider.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
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
              FlatButton(
                  onPressed: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgotten Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )),
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
                onPressed: () {},
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
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          print('Validation success!!');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
