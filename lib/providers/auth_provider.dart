
import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier{
  
  UserModel _user;
  String _exception;

  // getter
  UserModel get user => _user;

  // setter
  set user(UserModel user){
    _user = user;
    notifyListeners();
  }

  // getter
  String get exception => _exception;

  // setter
  set exception(String message){
    _exception = message;
    notifyListeners();
  }

  // sebuah pengkondisian apakah user berhasil/tidak dalam register
  Future<bool> register({
    String name,
    String username,
    String email,
    String password
  }) async {

    bool _status = false;

     try {  
      // lakukan proses request data
      UserModel user_data = await AuthService().register(
        nama: name,
        email: email,
        username: username,
        password: password
      );

      // assign variabel user     
      _user = user_data;
      
      // kembalikan nilai true
      _status = true;

      // print('Ubah status jadi $_status');

    } catch (e) {
      // print log exception yg dithrow pada auth_service.dart
      print(e);

      // kembalikan nilai false
      _status = false;
      // print('Ubah status jadi $_status');
    }

    return _status;
  }

  // function sebuah kondisi apakah ekseskusi async login berhasil/tidak
  Future<bool> login({
    String email,
    String password
  }) async {

    bool _status = false;

    try {
      // lakukan proses request data
      UserModel userModel = await AuthService().login(
        email: email,
        password: password
      );
      
      _user = userModel;

      _status = true;
    } catch (e) {
     
      if(e is Exception){
        var msg = e.toString();

        // Exception: Auth...
        // mau ambil dari Auth...
        exception = msg.substring(11);  
      }

      _status = false;
    }

    return _status;
  }

}
