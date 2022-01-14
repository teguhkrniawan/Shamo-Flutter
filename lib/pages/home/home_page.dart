import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/produk_model.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/product_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/product_card.dart';
import 'package:shamo/widgets/product_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isLoading = false;
  List<ProdukModel> listProduk = [];
  
  @override
  void initState() {
    handlePopularProduk();
    super.initState();
  }

  handlePopularProduk() async {

    setState(() {
      _isLoading = true;
    });

    // get produk
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    
    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {

    // provider auth user
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    // produk provider
    ProductProvider produkProvider = Provider.of<ProductProvider>(context);

    // widget Circular
    Widget circularLoading(){
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Center(
          child: Container(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(
                primaryTextColor
              )
            ),
          ),
        ),
      );
    }

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
                  Text('Hello, ${user.nama}', style: primaryTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semibold
                  ),),
                  Text('@${user.username}', style: thirdTextStyle.copyWith(
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
                image: DecorationImage(image: NetworkImage(user.profile_pict))
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
          children: produkProvider.listProduk.map((item) => ProductTile(produk: item,)).toList()
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
                children: produkProvider.listProduk.map((item) => ProductCard(produk: item,)).toList()
              )
            ],
          ),
        ),
      );
    }

    Widget body(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          popularProductTitle(),
          popularProductItem(),
          newArrivalTitle(),
          newArivalsItem()
        ],
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        _isLoading ? circularLoading() : body()
      ],
    );
  }
}