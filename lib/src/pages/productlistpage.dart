import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/widgets/product_card.dart';
import 'package:flutter_ecommerce_app/src/widgets/maincustomappbar.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';


class ProductGrid extends StatefulWidget {
  static const routeName ='/productcat' ;

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    final title = 'محصولات سامسونگ';
    return Scaffold(
      appBar: CustomAppBar(
        title,
        Colors.white10
      ),
      body:GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:2.8/4 ,

            mainAxisSpacing: 30,
            crossAxisSpacing: 20),

          padding: EdgeInsets.only(right: 20,left: 20),
          scrollDirection: Axis.vertical,
          children: AppData.productList
              .map(
                (product) => ProductCard(product: product, onSelected: (model) {
              setState(() {
                AppData.productList.forEach((item) {
                  item.isSelected = false;
                });
                model.isSelected = true;
              });
            },
            ),
          )
              .toList(),

      )
    );
        }
}
