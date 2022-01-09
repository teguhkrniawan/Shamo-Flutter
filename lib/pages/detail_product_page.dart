import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailProduct extends StatefulWidget {

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {

  final List images = [
    'assets/shoes_running1.png',
    'assets/shoes_hiking2.png',
    'assets/shoes_running1.png',
  ];

  final List familiarShoes = [
    'assets/shoes_running1.png',
    'assets/shoes_hiking2.png',
    'assets/shoes_running1.png',
    'assets/shoes_hiking2.png',
    'assets/shoes_running1.png',
    'assets/shoes_hiking2.png',
    'assets/shoes_running1.png',
    'assets/shoes_hiking2.png',
  ];

  int indexCorousel = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {

    // widget dialog success
    Future<void> showSuccessDialog() async{
      return showDialog(
        context: context, 
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: bgColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor
                      ),
                    ),
                  ),
                  Image.asset('assets/icon_success.png', width: 100,),
                  SizedBox(height: 12,),
                  Text('Hurray', style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold
                  )),
                  SizedBox(height: 12,),
                  Text('Item added successfully', style: secondaryTextStyle,),
                  SizedBox(height: 12,),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                      onPressed: (){}, 
                      child: Text(
                        'View my cart',
                        style: primaryTextStyle.copyWith(
                          fontWeight: semibold
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    // widget indicator
    Widget indicator(int index){
      return Container(
        width: indexCorousel == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 4
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: indexCorousel == index ? primaryColor : Color(0xffC4C4C4)
        )
      );
    }

    // widget card familiar shoes
    Widget cardFamiliarShoes(String imageUrl){
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(
          right: 16
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl)
          ),
          borderRadius: BorderRadius.circular(6)
        ),
      );
    }

    // widget header
    Widget header(){

      int indexHeader = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left)
                ),
                GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.shopping_bag, color: bgColor1,),
                )
              ],
            ),
          ),
          CarouselSlider(
            items: images.map(
                (element) => Image.asset(
                  element,
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.contain,
                )
              ).toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason){
                setState(() {
                  indexCorousel = index;
                });
              }
            ),  
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((element){
              indexHeader++;
              return indicator(indexHeader);
            }).toList()
          )
        ],
      );
    }

    // widget content
    Widget content(){

      int index = -1;

      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.65,
        margin: EdgeInsetsDirectional.only(
          top: 17
        ),
        decoration: BoxDecoration(
          color: bgColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24)
          )
        ),
        child: Column(
          children: [
            
            // NOTE: header
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin, 
                left: defaultMargin, 
                right: defaultMargin, 
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TERREX URBAN LOW',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold
                          )
                        ),
                        Text(
                          'Hiking',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12
                          )
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isWishlist = !isWishlist;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        isWishlist 
                          ? SnackBar(
                              backgroundColor: secondaryColor,
                              content: Text('Has beed added to your Wishlist')
                            )
                          :
                            SnackBar(
                              backgroundColor: bgColor7,
                              content: Text('Has been removed from the Wishlist')
                            )  
                      );
                    },
                    child: Image.asset(
                      isWishlist ? 'assets/icon_enable_love.png' : 'assets/icon_disable_love.png', 
                      width: 46,
                    ),
                  )
                ],
              ),
            ),
            
            // NOTE : Price
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin
              ),
              decoration: BoxDecoration(
                color: bgColor2,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price start from',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12
                    ),
                  ),
                  Text(
                    'Rp. 129.000',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold
                    ),
                  )
                ],
              ),
            ),

            // NOTE: Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: defaultMargin
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: primaryTextStyle.copyWith(fontWeight: semibold),),
                  SizedBox(height: 12,),
                  Text("Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.", style: primaryTextStyle.copyWith(fontSize: 12), textAlign: TextAlign.justify,)
                ],
              ),
            ),

            // NOTE : Familiar Shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                      'Fimilar Shoes',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((element) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(left: index == 0 ? 12 : 0),
                          child: cardFamiliarShoes(element)
                        );
                      }).toList()
                    ),
                  )
                ],
              ),
            ),

            // NOTE : Buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 0
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/button_chat.png')
                        )
                      )
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor
                        ),
                        onPressed: (){
                          showSuccessDialog();
                        }, 
                        child: Text('Add To Cart', style: primaryTextStyle)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          header(),
          content()
        ],
      )
    );
  }
}