import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  // bool _globalIslogin = false;

  Future<bool> getPrefsLogin() async{
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('isLogin');
    if(isLogin == null){
      return false;
    }
    return true;
  }

  @override
  void initState() {

    getPrefsLogin().then((islogin) {
      if(!islogin){
        Timer(
          Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(context, ('/sign-in'), (route) => false)
        );
      }
      else{
        Timer(
          Duration(seconds: 3),
          () => Navigator.pushNamedAndRemoveUntil(context, ('/home'), (route) => false)
        );
      }
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        body: Center(
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_splash.png')
              )
            ),
          )
        ),
    );
  }
}