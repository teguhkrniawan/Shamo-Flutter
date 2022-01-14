
import 'package:flutter/cupertino.dart';
import 'package:shamo/models/produk_model.dart';

/**
 * Wishlist provider
 */
class WishlistProvider with ChangeNotifier {

  List<ProdukModel> _wishlist = [];

  List<ProdukModel> get wishlist => _wishlist;
  set wishlist(List<ProdukModel> wishlist){
    _wishlist = wishlist;
    notifyListeners();
  }

  // function mengecek apakah produk ini sudah masuk dalam wishlist
  bool isWishlist(ProdukModel produk){
     // apabila id_produk dalam wishlist tidak sama dengan produk.id
     if(_wishlist.indexWhere((element) => element.id == produk.id) == -1){
       return false;
     } 
     return true;
  }

  // function melakukan set produk ke wishlist
  setProduct(ProdukModel produk){
    if(!isWishlist(produk)){
      // tambahkan ke _wishlist produk tsb
      _wishlist.add(produk);
    } else {
       _wishlist.removeWhere((element) => element.id == produk.id);
    }
    notifyListeners();
  }
}