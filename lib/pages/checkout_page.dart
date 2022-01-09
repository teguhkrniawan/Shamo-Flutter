import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/checkout_card.dart';

class CheckoutPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    // widget header
    Widget header(){
      return AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Checkout Details',
          style: primaryTextStyle,
        ),
      );
    }

    // widget contents
    Widget content(){
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin
        ),
        children: [
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE : label list items
              Text(
                'List Items',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold
                ),
              ),
              CheckoutCard(),
              CheckoutCard(),

              // NOTE : label & content address section
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: defaultMargin
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: bgColor4,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address Details', style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                    )),
                    SizedBox(height: 12,),
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset('assets/icon_copy.png', width: 40,),
                            Image.asset('assets/icon_line.png', height: 30),
                            Image.asset('assets/icon_location.png', width: 40,)
                          ],
                        ),
                        SizedBox(width: 12,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Store Location',
                              style: thirdTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light
                              ),
                            ),
                            Text(
                              'Adidas Core',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium
                              ),
                            ),
                            SizedBox(height: defaultMargin,),
                            Text(
                              'Your Address',
                              style: thirdTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: light
                              ),
                            ),
                            Text(
                              '12th Street Avenue, NY',
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    
                  ],
                ),
              ),

              // NOTE : Payment Summary
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: defaultMargin
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: bgColor4,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment Summary', style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                    )),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Quantity', style: secondaryTextStyle,),
                        Text('2 Items', style: primaryTextStyle)
                      ],
                    ),
                    SizedBox(height: 13,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Price', style: secondaryTextStyle,),
                        Text('Rp. 175.000', style: primaryTextStyle)
                      ],
                    ),
                    SizedBox(height: 13,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping', style: secondaryTextStyle,),
                        Text('Free', style: primaryTextStyle)
                      ],
                    ),
                    SizedBox(height: 13,),
                    Divider(
                      color: thirdTextColor,
                      thickness: 0.8,
                    ),
                   SizedBox(height: 13,),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total', style: priceTextStyle.copyWith(
                          fontWeight: semibold
                        )),
                        Text('Rp. 190.000', style: priceTextStyle.copyWith(
                          fontWeight: semibold
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              
              // NOTE : Button Checkout
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: defaultMargin),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  onPressed:(){
                    Navigator.pushNamed(context, '/checkout-success');
                  }, 
                  child: Text(
                    'Checkout Now',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold
                    ),
                  )
                ),
              )
            ],
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}