
import 'package:flutter/cupertino.dart';
import 'package:shamo/models/produk_model.dart';
import 'package:shamo/services/product_service.dart';

class ProductProvider with ChangeNotifier {

  List<ProdukModel> _listProduk = [];

  List<ProdukModel> get listProduk => _listProduk;
  set listProduk(List<ProdukModel> produks){
    _listProduk = produks;
    notifyListeners();
  }

   String _exception;
   String get exception => _exception;
   set exception(String message){
    _exception = message;
    notifyListeners();
   }

  Future<ProdukModel> getProducts() async {
    try {
      List<ProdukModel> data = await ProdukService().getProducts();
      _listProduk = data;

    } catch (e) {
      if(e is Exception){
        var msg = e.toString();

        // Exception: Auth...
        // mau ambil dari Auth...
        exception = msg.substring(11);  
      }
    }
  }

}