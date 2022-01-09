import 'package:flutter/material.dart';
import 'package:shamo/widgets/chat_tile.dart';

import '../../theme.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // widget header
    Widget header(){
      return AppBar(
        backgroundColor: bgColor3,
        centerTitle: true,
        title: Text(
          'Message Support',
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
    Widget emptyChat(){
      return Expanded(
         child: Container(
           width: double.infinity,
           color: bgColor1,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.asset(
                 'assets/icon_headset.png',
                 width: 80,
               ),
               SizedBox(height: 20,),
               Text(
                 'Oops Not Message Yet ?',
                 style: primaryTextStyle.copyWith(
                   fontSize: 16,
                   fontWeight: medium
                 ),
               ),
               SizedBox(height: 12,),
               Text(
                 'You have never done a transaction',
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

    // widget chat tile
    Widget chatTile(){
      return Expanded(
        child: Container(
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin
            ),
            children: [
              ChatTile(),
              ChatTile(),
              ChatTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        //emptyChat(),
        chatTile()
      ]
    );
  }
}