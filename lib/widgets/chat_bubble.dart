import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatBubble extends StatelessWidget {
  
  final bool isSender;
  final String message;
  final bool hasProduct;

  ChatBubble({
    this.isSender = false,
    this.message = 'default',
    this.hasProduct = false
  });

  @override
  Widget build(BuildContext context) {
    
    // widget produk view
    Widget productReview(){
     return Container(
       margin: EdgeInsets.only(bottom: 12),
       padding: EdgeInsets.all(12),
       width: 230,
       decoration: BoxDecoration(
          color: isSender ? bgColor5 : bgColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isSender ? 12 : 0),
            topRight: Radius.circular(isSender ? 0 : 12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12)
          )
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/shoes_running1.png', width: 70,)
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('COURT VISION NEW VERSION', style: primaryTextStyle,),
                      SizedBox(height: 4,),
                      Text('Rp. 1.999.000', style: priceTextStyle,)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: primaryColor
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ), 
                    child: Text('Add To Cart', style: purpleTextStyle)
                  ),
                  SizedBox(width: 12,),
                  TextButton(
                    onPressed: (){}, 
                    style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: Text('Buy Now', style: titleCard)
                  )
                ],
              )
          ],
        ),
     );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: defaultMargin
      ),
      child: Column(
        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productReview() : SizedBox(),
          Row(
            mainAxisAlignment: (isSender == true) ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12
                  ),
                  decoration: BoxDecoration(
                    color: isSender ? bgColor5 : bgColor4,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSender ? 12 : 0),
                      topRight: Radius.circular(isSender ? 0 : 12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)
                    )
                  ),
                  child: Text(message, style: primaryTextStyle,),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}