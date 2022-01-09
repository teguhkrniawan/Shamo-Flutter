import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductTile extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detail-product');
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/shoes_hiking2.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Footbal',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    'Terrex Urban Hiking Low Budget', 
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold
                      ),
                    overflow: TextOverflow.ellipsis
                  ),
                  SizedBox(height: 6,),
                  Text('Rp. 112K', style: priceTextStyle,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}