import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/test/login/home.dart';
import 'package:flutter_ui/test/login/user.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginPage extends StatefulWidget {
  static const String loginPage = "LoginPage";
  AppState createState() => new AppState();
}

class AppState extends State<LoginPage> {
  String _username = "";
  Widget currentPage;
  GoogleSignIn googleSignIn;
  Widget userPage;

  @override
  void initState() {
    super.initState();
    userPage = new Home(
      onSignin: () {
        _signin();
        print("Sign");
      },
      onLogout: _logout,
      showLoading: false,
    );
  }

  Future<FirebaseUser> _signin() async {
    setState(() {
      userPage = new Home(onSignin: null, onLogout: _logout, showLoading: true);
    });
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      googleSignIn = new GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication gauth =
      await googleSignInAccount.authentication;

      FirebaseUser user = await _auth.signInWithCustomToken(token: gauth.accessToken);

//      FirebaseUser user = await _auth.signInWithGoogle(
//        accessToken: gauth.accessToken,
//        idToken: gauth.idToken,
//      );

      setState(() {
        _username = user.displayName;
        userPage = new User(
          onLogout: _logout,
          user: user,
        );
      });

      return user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  void _logout() async {
    await googleSignIn.signOut();
    setState(() {
      userPage = new Home(
        onSignin: () {
          _signin();
          print("Sign");
        },
        onLogout: _logout,
        showLoading: false,
      );
    });

    print("Logged Out");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: userPage,
    );
  }
}