/**
 * Class service produk
 */
import 'dart:convert';

import 'package:shamo/helpers/network.dart';
import 'package:shamo/models/error_models.dart';
import 'package:shamo/models/produk_model.dart';
import 'package:http/http.dart' as http;

class ProdukService{

  String base_url = '${Network.base_url}/products';

  // async get produk
  Future<List<ProdukModel>> getProducts() async {
    var headers = {
      'Content-Type' : 'application/json'
    };

    var response = await http.get(
      base_url,
      headers: headers
    ).timeout(
      Duration(seconds: 30),
      onTimeout: (){
        return http.Response('Timeout to connect internal server', 408);
      }
    );

    print(response.body);

    if(response.statusCode == 200){

      // karena responsenya list, eksekusi kode dibawah ini
      List data = jsonDecode(response.body)['data']['data'];
      List<ProdukModel> listProduk = [];

      for(var item in data){
        listProduk.add(ProdukModel.fromJson(item));
      }

      return listProduk;

    }
    else if(response.statusCode == 408){
      throw Exception('Request Timeout');
    }
    else{
       var data = jsonDecode(response.body)['meta'];
       MyErrorModel errorModel = MyErrorModel.fromJson(data);

       throw Exception(errorModel.messagge);
    }
  }

}