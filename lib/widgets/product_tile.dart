import 'package:flutter/material.dart';
import 'package:shamo/models/produk_model.dart';
import 'package:shamo/pages/detail_product_page.dart';
import 'package:shamo/theme.dart';

class ProductTile extends StatelessWidget {

  final ProdukModel produk;

  ProductTile({
    this.produk
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => DetailProduct(
            produk: produk,
          ))
        );
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
              child: Image.network(
                '${produk.galleries[0].url}',
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
                    '${produk.category.namaKategori}',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    '${produk.name}', 
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold
                      ),
                    maxLines: 1,  
                    overflow: TextOverflow.ellipsis
                  ),
                  SizedBox(height: 6,),
                  Text('\$${produk.price}', style: priceTextStyle,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}