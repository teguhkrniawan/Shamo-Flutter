import 'dart:convert';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

/**
 * Service/Layanan untuk menghandle layanan authentication
 */

class AuthService{

  // base url
  String base_url = 'http://192.168.241.154:8000/api';

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
    );

    print(response.body);

    if(response.statusCode == 200){
      // ambil body dari key data
      var data = jsonDecode(response.body)['data'];

      // ambil dari body key data -> user
      UserModel user = UserModel.fromJson(data['pelanggan']);
      user.token = data['token_type'] +' '+ data['remember_token'];

      return user;
    }else {
      throw Exception('Gagal Register, '+response.statusCode.toString()+ ' Code Server Request Error');
    }

  } 
   

}