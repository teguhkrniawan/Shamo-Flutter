import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10
      ),
      decoration: BoxDecoration(
        color: bgColor5,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(image: AssetImage('assets/shoes_running1.png'))
                ),
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Terrex Urban Low', style: primaryTextStyle.copyWith(
                      fontWeight: semibold
                    ), overflow: TextOverflow.ellipsis,),
                    Text(
                      'Rp. 980.000',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              SizedBox(width: 12,),
              Text('2 Items', style: thirdTextStyle,)
            ],
          ),  
        ],
      ),
    );
  }
}