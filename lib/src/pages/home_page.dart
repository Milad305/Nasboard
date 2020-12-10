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
          color: LightColor.grey,
          //boxShadow: AppTheme.shadow
      ),
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
  Widget _DownloadFileTitle(){
    return Container(
      padding: EdgeInsets.only(right: 20),
      alignment: Alignment.topRight,
      width: AppTheme.fullWidth(context),
      height: 35,
      child:TitleText(
        text: "رام گوشی",
      ) ,
    );
  }

  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .65,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio:7/4.7 ,

            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: EdgeInsets.only(right: 20),
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
      alignment: Alignment.topCenter,
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey,//.withAlpha(100)
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(

                decoration: InputDecoration(

                    border: InputBorder.none,

                    hintText: "جستجو محصول",

                    hintStyle: TextStyle(fontSize: 15,color: Colors.black54,),//.withOpacity(0.7)

                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),//.withOpacity(0.3)
              ),
            ),
          ),
        //  SizedBox(width: 20),
         // _icon(Icons.filter_list, color: Colors.black54)
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
                SizedBox(
                    height:MediaQuery.of(context).size.height*0.4,
                  child: Column(
                      children: [
                        _search(),
                          _Carousel(),

                      ],
            )


                ),
                /*_categoryWidget(),*/

                _LastProductsTitle(),
                _productWidget(),

                _DownloadFileTitle(),
                _productWidget(),
                SizedBox(
                  height: 110,
                )

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
      options: CarouselOptions(
        height:MediaQuery.of(context).size.height*0.3 ,

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
                 Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13)
                      ),
                        height: MediaQuery.of(context).size.height * 0.24,
                        width: MediaQuery.of(context).size.width-50,
                        margin: EdgeInsets.symmetric(horizontal: 9),
                        child: FittedBox(
                            fit: BoxFit.fill,
                          child:ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:Image.asset(
                            i,

                          ),

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
