import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseAuthState extends ChangeNotifier {
  FirebaseAuthStatus _firebaseAuthStatus = FirebaseAuthStatus.signout;
  FirebaseUser _firebaseUser;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void watchAuthChange() {
    _firebaseAuth.onAuthStateChanged.listen((firebaseUser) {
      if (firebaseUser == null && _firebaseUser == null) {
        return;
      } else if (firebaseUser != _firebaseUser) {
        _firebaseUser = firebaseUser;
        changeFirebaseAuthStatus();
      }
    });
  }

  void registerUser(BuildContext context,
      {@required email, @required password}) {
    _firebaseAuth
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim())
        .catchError((error) {
      print(error);
      String _massage = '';
      switch (error.code) {
        case 'ERROR_WEAK_PASSWORD':
          _massage = '패스워드 잘 넣어줘!!';
          break;
        case 'ERROR_INVALID_EMAIL':
          _massage = '이메일 주소가 이상해!!';
          break;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          _massage = '해당 이메일은 다른사람이 쓰고 있는데?';
          break;
      }
      SnackBar snackBar = SnackBar(
        content: Text(_massage),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void signOut() {
    _firebaseAuthStatus = FirebaseAuthStatus.signout;
    if (_firebaseUser != null) {
      _firebaseUser = null;
      _firebaseAuth.signOut();
    }
    notifyListeners();
  }

  void login(BuildContext context, {@required email, @required password}) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email.trim(), password: password.trim())
        .catchError((error) {
      print(error);
      String _massage;
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          _massage = '메일주소 고쳐';
          break;
        case 'ERROR_WRONG_PASSWORD':
          _massage = '비밀번호가 이상해';
          break;
        case 'ERROR_USER_NOT_FOUND':
          _massage = '유저 없는데?';
          break;
        case 'ERROR_USER_DISABLED':
          _massage = '해당 유저 금지됬어';
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          _massage = '너무 많이 시도하는데 ?';
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          _massage = '해당 동작은 여기서는 금지야';
          break;
      }
      SnackBar snackBar = SnackBar(
        content: Text(_massage),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  void changeFirebaseAuthStatus([FirebaseAuthStatus firebaseAuthStatus]) {
    if (firebaseAuthStatus != null) {
      _firebaseAuthStatus = firebaseAuthStatus;
    } else {
      if (_firebaseUser != null) {
        _firebaseAuthStatus = FirebaseAuthStatus.signin;
      } else {
        _firebaseAuthStatus = FirebaseAuthStatus.signout;
      }
    }
    notifyListeners();
  }

  FirebaseAuthStatus get firebaseAuthStatus => _firebaseAuthStatus;
}

enum FirebaseAuthStatus { signout, progress, signin }
