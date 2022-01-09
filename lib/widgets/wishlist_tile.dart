import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class WishlistTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
             child: Image.asset(
               'assets/shoes_running1.png',
               width: 60,
             ),
           ),
           SizedBox(width: 12,),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Terrex Urban Low', style: primaryTextStyle.copyWith(fontWeight: semibold),),
                 Text('Rp. 190.000', style: priceTextStyle), 
               ],
             ),
           ),
           Image.asset(
             'assets/icon_enable_love.png',
             width: 34,
           )
         ],
       ),
    );
  }
}