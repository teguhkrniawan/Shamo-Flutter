import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_card.dart';
import 'package:shamo/widgets/product_tile.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    // widget header
    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Teguh', style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semibold
                  ),),
                  Text('@teguhkrniawan', style: thirdTextStyle.copyWith(
                    fontSize: 14,
                  ),)
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/icon_user.png'))
              ),
            )
          ],
        ),
      );
    }

    // Widget categoris
    Widget categories(){
      return Container(
        margin: EdgeInsetsDirectional.only(
          top: defaultMargin
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor
                ),
                child: Text('All Shoes', style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium
                ),),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantNavColor,
                  border: Border.all(
                    color: thirdTextColor
                  )
                ),
                child: Text('Running', style: thirdTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium
                ),),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantNavColor,
                  border: Border.all(
                    color: thirdTextColor
                  )
                ),
                child: Text('Training', style: thirdTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium
                ),),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantNavColor,
                  border: Border.all(
                    color: thirdTextColor
                  )
                ),
                child: Text('Basket Ball', style: thirdTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium
                ),),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: transparantNavColor,
                  border: Border.all(
                    color: thirdTextColor
                  )
                ),
                child: Text('Hiking', style: thirdTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium
                ),),
              )
            ],
          ),
        ),
      );
    }

    // Widget popular product title
    Widget popularProductTitle(){
      return Container(
        margin: EdgeInsetsDirectional.only(
          top: defaultMargin,
          start: defaultMargin,
          end: defaultMargin
        ),
        child: Text('Popular Product', style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semibold
        ),),
      );
    }

    // Widget popular new arrival title
    Widget newArrivalTitle(){
      return Container(
        margin: EdgeInsetsDirectional.only(
          top: defaultMargin,
          start: defaultMargin,
          end: defaultMargin
        ),
        child: Text('New Arrivals', style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semibold
        ),),
      );
    }

    // Widget item new arrivals
    Widget newArivalsItem(){
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: [
            ProductTile(),
            ProductTile(),
            ProductTile(),
          ],
        ),
      );
    }

    // Widget card item scroll popular products
    Widget popularProductItem(){
      return Container(
        margin: EdgeInsetsDirectional.only(
          top: 14
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin
              ),
              Row(
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              )
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductTitle(),
        popularProductItem(),
        newArrivalTitle(),
        newArivalsItem()
      ],
    );
  }
}