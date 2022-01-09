import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductCard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/detail-product');
      },
      child: Container(
        width: 215,
        height: 279,
        margin: EdgeInsets.only(
          right: defaultMargin
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgCard
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/shoes_running1.png', 
              width: 215, 
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hiking', 
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: reguler
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('COURT VISION NEW 2.0', style: titleCard.copyWith(
                    fontSize: 18,
                    fontWeight: semibold
                  ), overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Rp. 129K',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}