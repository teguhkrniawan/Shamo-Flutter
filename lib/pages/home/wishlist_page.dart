import 'package:flutter/material.dart';
import 'package:shamo/widgets/wishlist_tile.dart';

import '../../theme.dart';

class WishlistPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // widget header
    Widget header(){
      return AppBar(
        backgroundColor: bgColor3,
        centerTitle: true,
        title: Text(
          'My Favorite Shoes',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    // widget empty content
    Widget emptyWishlist(){
      return Expanded(
         child: Container(
           width: double.infinity,
           color: bgColor1,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/icon_love.png',
                 width: 80,
               ),
               SizedBox(height: 20,),
               Text(
                 'You don\'t have favorite shoes',
                 style: primaryTextStyle.copyWith(
                   fontSize: 16,
                   fontWeight: medium
                 ),
               ),
               SizedBox(height: 12,),
               Text(
                 'lets find your favorite shoes',
                 style: secondaryTextStyle,
               ),
               SizedBox(height: 20,),
               Container(
                 height: 44,
                 child: TextButton(
                   onPressed: (){},
                   style: TextButton.styleFrom(
                     padding: EdgeInsets.symmetric(
                       horizontal: 24,
                       vertical: 10
                     ),
                     backgroundColor: primaryColor,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12)
                     )
                   ),
                   child: Text(
                     'Explore Store',
                     style: primaryTextStyle.copyWith(
                       fontWeight: medium,
                       fontSize: 16
                     ),
                   ),
                 ),
               )
             ],
           ),
         ),
      );
    }

    // widget content
    Widget content(){
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
          ),
          child: ListView(
            children: [
              WishlistTile(),
              WishlistTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // 
        content()
      ],
    );
  }
}