import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/widgets/product_card.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_ecommerce_app/src/widgets/title_text.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
static const routeName ='/Homepage' ;


  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(

      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _LastProductsTitle(){
    return Container(
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.topRight,
      width: AppTheme.fullWidth(context),
      height: 35,
      child:TitleText(
        text: "آخرین محصولات",
      ) ,
    );
  }

  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .6,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
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
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "جستجو محصول",
                    hintStyle: TextStyle(fontSize: 15,color: Colors.grey.withOpacity(0.7)),

                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54.withOpacity(0.3))),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
          height: MediaQuery.of(context).size.height ,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _search(),
                /*_categoryWidget(),*/
                _LastProductsTitle(),
                _productWidget(),
                _Carousel()

              ],
            ),
          ),
        )
    ) ;
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height:MediaQuery.of(context).size.height*0.4 ,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: AppData.carousellist.map((i) {
        return Builder(
          builder: (BuildContext context) {

            return Column(
              children:[
                SizedBox(height: 15,),
                Expanded(
                    child: Container(

                        width: MediaQuery.of(context).size.width-50,
                        margin: EdgeInsets.symmetric(horizontal: 9),
                        child: FittedBox(
                          child: Image.asset(i),
                          fit: BoxFit.fill,

                        )

                    )
                ),
                SizedBox(height: 20,),
              ]

            );
          },
        );
      }).toList(),
    );
  }
}
