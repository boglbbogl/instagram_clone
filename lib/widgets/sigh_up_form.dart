import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_size.dart';
import 'package:instagram_clone/home_page.dart';

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
                decoration: _textInputDecor('Email'),
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
                decoration: _textInputDecor('Password'),
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
                decoration: _textInputDecor('Confirm password'),
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
              _orDivider(),
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
                'Join',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if(_formKey.currentState.validate()){
                  print('Validation success!!');
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePage()));
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            );
  }

  Stack _orDivider() {
    return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  height: 1,
                  child: Container(
                    color: Colors.grey[300],
                    height: 1,
                  ),
                ),
                Container(
                  color: Colors.grey[50],
                  height: 3,
                  width: 60,
                ),
                Text('OR',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold
                  ),)
              ],
            );
  }

  InputDecoration _textInputDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: _activeInputBorder(),
      focusedBorder: _activeInputBorder(),
      errorBorder: _errorInputBorder(),
      focusedErrorBorder: _activeInputBorder(),
      filled: true,
      fillColor: Colors.grey[100],
    );
  }

  OutlineInputBorder _errorInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.redAccent,
      ),
      borderRadius: BorderRadius.circular(common_s_gap),
    );
  }

  OutlineInputBorder _activeInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
      borderRadius: BorderRadius.circular(common_s_gap),
    );
  }
}
