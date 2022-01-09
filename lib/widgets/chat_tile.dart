import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatTile extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detail-chat');
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 18),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/chat_picture.png',
                  width: 54,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Premium Shoes Store',
                        style: primaryTextStyle.copyWith(
                          fontSize: 15
                        ),
                      ),
                      Text(
                        'Good night, This item is on ready for buy',
                        style: secondaryTextStyle.copyWith(
                          fontWeight: light
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 10
                  ),
                )
              ],
            ),
            SizedBox(height: 12,),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        )
      ),
    );
  }
}