import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // widget appbar
    Widget header(){
      return PreferredSize(
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          title: Container(
            margin: EdgeInsets.only(
              top: 8
            ),
            child: Row(
              children: [
                Image.asset('assets/chat_pict_online.png', width: 40, fit: BoxFit.cover,),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Talenta Store', style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14
                    )),
                    Text('Online', style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14
                    ),)
                  ],
                )
              ],
            ),
          ),
        ), 
        preferredSize: Size.fromHeight(65)
      );
    }

    // widget product review
    Widget productReview(){
      return Container(
        width: 225,
        height: 75,
        margin: EdgeInsetsDirectional.only(
          bottom: 20
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryColor
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/shoes_running1.png', width: 55,)
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COURT VISION NEW BABY',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14
                    ),
                    overflow: TextOverflow.ellipsis
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'Rp. 1.200.999',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 20,),
            Image.asset('assets/button_close.png', width: 22,)
          ],
        ),
      );
    }

    // widget chat input
    Widget chatInput(){
      return Container( 
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productReview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12
                    ),
                    decoration: BoxDecoration(
                      color: bgColor4,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type your message',
                          hintStyle: thirdTextStyle
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Image.asset('assets/button_send.png', width: 45,)
              ],
            ),
          ],
        ),
      );
    }

    // widget content chat
    Widget content(){
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        children: [
          ChatBubble(
            isSender: true,
            message: 'Hi There, is a product ready ?',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            message: 'Good night, This item is only available in size 42 and 43',
          )
        ],
      );
    }

    return Scaffold(
       backgroundColor: bgColor3,
       appBar: header(),
       body: content(),
       bottomNavigationBar: chatInput(),
    );
  }
}