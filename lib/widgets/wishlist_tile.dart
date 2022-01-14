import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/produk_model.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class WishlistTile extends StatelessWidget {

  final ProdukModel produk;
  WishlistTile({
    this.produk
  });

  @override
  Widget build(BuildContext context) {

    // wishlist provider
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
       margin: EdgeInsets.only(
         top: 20
       ),
       padding: EdgeInsets.only(
         top: 10,
         left: 12,
         bottom: 14,
         right: 20
       ),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),
         color: bgColor4
       ),
       child: Row(
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(12),
             child: Image.network(
               produk.galleries[0].url,
               width: 60,
             ),
           ),
           SizedBox(width: 12,),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('${produk.name}', style: primaryTextStyle.copyWith(fontWeight: semibold),),
                 Text('\$${produk.price}', style: priceTextStyle), 
               ],
             ),
           ),
           GestureDetector(
             onTap: (){
               wishlistProvider.setProduct(produk);
             },
             child: Image.asset(
               wishlistProvider.isWishlist(produk)
                ? 'assets/icon_enable_love.png'
                :'assets/icon_disable_love.png',
               width: 34,
             ),
           )
         ],
       ),
    );
  }
}