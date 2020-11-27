import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/home_page.dart';
import 'package:flutter_ecommerce_app/src/pages/likedproducts.dart';
import 'package:flutter_ecommerce_app/src/pages/shopping_cart_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';
import 'package:flutter_ecommerce_app/src/widgets/Drawer.dart';
import 'package:flutter_ecommerce_app/src/widgets/title_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_ecommerce_app/src/widgets/maincustomappbar.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  static const String routeName = '/';
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedindex =0;
  bool isHomePageSelected = true;
  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon:_icon(Icons.sort, color: Colors.black54) ,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }
          ),
          /*RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.black54),
          ),*/
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xfff8f8f8),
                      blurRadius: 10,
                      spreadRadius: 10),
                ],
              ),
              child: Image.asset("assets/user.png"),
            ),
          ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
        ],
      ),
    );
  }

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

  Widget _title() {
    return Container(
        margin: AppTheme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: isHomePageSelected ? 'Our' : 'Shopping',
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: isHomePageSelected ? 'Products' : 'Cart',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            !isHomePageSelected
                ? Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.delete_outline,
                color: LightColor.orange,
              ),
            ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)))
                : SizedBox()
          ],
        ));
  }

  List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    ShoppingCartPage(),
    LikedProductPage()

  ];
  void onBottomIconPressed(int index) {
    setState(() {
      _selectedindex = index;
    });
  }



  ///maiinnnnnnnnnn////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar('NasBoard'),
      drawer: Drawerwidget(),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[



                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child:_widgetOptions.elementAt(_selectedindex),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
              ),
            )
          ],
        ),
      ),
    );
  }
}




/*
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  static const String routeName = '/';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedindex =0;


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


   List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
     ShoppingCartPage(),
     LikedProductPage()

  ];




  void onBottomIconPressed(int index) {
   setState(() {
     _selectedindex = index;
   });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
                height: AppTheme.fullHeight(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                  ),
                ),
                child: Expanded(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 600),
                    switchInCurve: Curves.easeInToLinear,
                    switchOutCurve: Curves.easeOutBack,
                    child:Align(
                      alignment: Alignment.topCenter,
                      child:  _widgetOptions.elementAt(_selectedindex),
                    )


                  ),
                )),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              onIconPresedCallback: onBottomIconPressed,

            ),
          )
        ],
      ),

      /* body:

*/

      drawer: DrawerWidget(context),
    );
  }



  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Color(0xfff7f7f7),
      title: Text("NasBoard"),
    );
  }

}
*/