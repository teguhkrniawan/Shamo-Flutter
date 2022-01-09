import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/cart_card.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // widget appbar
    Widget header(){
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: primaryTextStyle,
        ),
        elevation: 0,
      );
    }

    // widget empty cart
    Widget emptyCart(){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_keranjang.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Oops! Your cart is empty',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text('Lets find your favorite shoes', style: secondaryTextStyle,),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(
                top: 20
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                }, 
                child: Text(
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                  ),
                )
              ),
            )
          ],
        ),
      );
    }

    // widget content apabila cart berisi
    Widget content(){
      return ListView(
        children: [
          CartCard(),
          CartCard(),
        ],
      );
    }

    // widget custom bottom navigation
    Widget customBottomNavigation(){
      return Container(
        height: 170,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total',
                    style: primaryTextStyle,
                  ),
                  Text(
                    'Rp. 129.000',
                    style: priceTextStyle.copyWith(
                      fontWeight: semibold
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Divider(
              thickness: 0.5,
              color: thirdTextColor
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                  children: [
                    Text('Continue To Checkout', style: primaryTextStyle.copyWith(
                      fontSize: 16
                    )),
                    Icon(Icons.arrow_forward, color: primaryTextColor,)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      // body: emptyCart(),
      body: content(),
      bottomNavigationBar: customBottomNavigation()
    );
  }
}