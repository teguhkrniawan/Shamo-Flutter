import 'dart:convert';
import 'package:shamo/helpers/network.dart';
import 'package:shamo/models/error_models.dart';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

/**
 * Service/Layanan untuk menghandle layanan authentication
 */

class AuthService{

  // base url from static variabel Helper Network
  String base_url = Network.base_url;

  // async return function, register
  Future<UserModel> register({
    String nama,
    String email,
    String username,
    String password
  }) async {

    var endpoint_path = '$base_url/register';

    var headers = {
      'Content-Type' : 'application/json',
      'Accept' : 'application/json'
    };

    var body = jsonEncode(
        {
          'nama' : nama,
          'email' : email,
          'username' : username,
          'password' : password
        }
      );

     var response = await http.post(
        endpoint_path,
        headers: headers,
        body: body
     ).timeout(
        Duration(seconds: 30),
        onTimeout: (){
          return http.Response('Timeout to connect internal server', 408);
        }
     );

     // print(response.body);

     if(response.statusCode == 200){
      // ambil body dari key data
      var data = jsonDecode(response.body)['data'];

      // ambil dari body key data -> user
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['token_type'] +' '+ data['access_token'];

      return user;
    }
    else if(response.statusCode == 408){
      throw Exception('Request Timeout');
    }
    else {
      throw Exception('Register Failed, '+response.statusCode.toString()+ ' Code Server Request Error');
    }


  } 
   
  // async return function, login
  Future<UserModel> login({
    String email,
    String password
  }) async {

    // endpoint path
    var endpoint_path = '$base_url/login';

    var headers = {
      'Content-Type' : 'application/json',
      'Accept' : 'application/json'
    };

    var body = jsonEncode(
      {
        'email' : email,
        'password' : password
      }
    );

    var response = await http.post(
      endpoint_path,
      headers: headers,
      body: body
    ).timeout(
      Duration(seconds: 30),
      onTimeout: (){
         return http.Response('Timeout to connect internal server', 408);
      }
    );

    print(response.body);

     if(response.statusCode == 200){
      // ambil body dari key data
      var data = jsonDecode(response.body)['data'];

      // ambil dari body key data -> user
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['token_type'] +' '+ data['access_token'];

      return user;
    }
    else if(response.statusCode == 408){
      throw Exception('Request Timeout');
    }
    else {

      var data = jsonDecode(response.body)['meta'];
      MyErrorModel errorModel = MyErrorModel.fromJson(data);

      throw Exception(errorModel.messagge);

    }

  }

}