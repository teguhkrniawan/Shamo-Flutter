import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin
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
                    ),),
                    Text(
                      'Rp. 980.000',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/button_add.png',
                    width: 16
                  ),
                  SizedBox(height: 2,),
                  Text('2', style: primaryTextStyle,),
                  SizedBox(height: 2,),
                  Image.asset(
                    'assets/button_min.png',
                    width: 16,
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Image.asset(
                'assets/icon_delete.png',
                width: 10,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertTextStyle,
              )
            ],
          )   
        ],
      ),
    );
  }
}