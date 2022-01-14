import 'package:flutter/material.dart';
import 'package:shamo/models/produk_model.dart';
import 'package:shamo/pages/detail_product_page.dart';
import 'package:shamo/theme.dart';

class ProductCard extends StatelessWidget {

  final ProdukModel produk;
  ProductCard({
    this.produk
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => DetailProduct(produk: produk,))
        );
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
            Image.network(
              produk.galleries[0].url, 
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
                    '${produk.category.namaKategori}', 
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: reguler
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('${produk.name}', 
                    maxLines: 1,
                    style: titleCard.copyWith(
                      fontSize: 18,
                      fontWeight: semibold
                    ), overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$'+produk.price.toString(),
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