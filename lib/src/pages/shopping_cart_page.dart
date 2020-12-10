import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/widgets/title_text.dart';

class ShoppingCartPage extends StatelessWidget {

  const ShoppingCartPage({Key key}) : super(key: key);

  Widget _cartItems() {
    int tedad =5;
    return Column(children:

    AppData.cartList.map((x) => _item(x,tedad)).toList(),

    );
  }

  Widget _item(Product model,tedad) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 80,
      child: Row(
        children: <Widget>[
          GestureDetector(
           child:  AspectRatio(
             aspectRatio: 1.1,
             child: Stack(
               children: <Widget>[
                 Align(
                   alignment: Alignment.bottomLeft,
                   child: Container(
                     height: 70,
                     width: 70,

                     child: Stack(
                       children: <Widget>[
                         Align(
                           alignment: Alignment.bottomLeft,
                           child: Container(
                             padding: EdgeInsets.only(top: 10),
                             decoration: BoxDecoration(

                                 color: LightColor.lightGrey,
                                 borderRadius: BorderRadius.circular(10)),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 Positioned(
                   left: -20,
                   bottom: -20,

                   child: Container(
                     child: Image.asset(model.image, height: 75, width: 110,),
                     padding: EdgeInsets.only(bottom: 25,),

                   ),


                 ),

               ],
             ),
           ),
            ///ba click roye tasvir be mahsool erja dade mishavad
            onTap: (){
              print("clicked");
            },
          ),

          Expanded(
              child: ListTile(
                  title: GestureDetector(
                    child: TitleText(
                      text: model.name,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    ///ba click roye tasvir be mahsool erja dade mishavad
                    onTap: (){
                      print("clicked");
                    },
                  ),

                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: '\$ ',
                        color: LightColor.red,
                        fontSize: 12,
                      ),
                      TitleText(
                        text: model.price.toString(),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 100,
                    height: 37,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                     ),

                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: LightColor.lightGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: IconButton(icon:Icon(Icons.delete_outline), onPressed: (){}),
                          ),

                          Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: LightColor.lightGrey.withAlpha(150),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Text(
                                  tedad.toString()+"x",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                          )

                        ],

                    )
                  )))
        ],
      ),
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: '${AppData.cartList.length} محصول ',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: '${getPrice()}\T',
          fontSize: 18,
        ),
      ],
    );
  }

 Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/payment');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: LightColor.orange,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: AppTheme.fullWidth(context) * .7,
          child: TitleText(
            text: 'تکمیل خرید',
            color: LightColor.background,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _FavorritList(),
            _cartItems(),
            SizedBox(
              height: 20,
            ),
            _price(),
            SizedBox(height: 30),
            _submitButton(context),
            SizedBox(
              height: 180,
            )
          ],
        ),
      ),
    );
  }
}

Widget _FavorritList() {
  return Container(
    height: 50,
    child: Row(
      children: [
        TitleText(
          text: "سبد خرید",
        )
      ],
    ),
  );
}



