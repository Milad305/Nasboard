import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_ecommerce_app/src/config/route.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,

        children: <Widget>[
          UserAccountsDrawerHeader(
            arrowColor: LightColor.orange,
            accountName: Container(
              child: Text(
                "میلاد حاجیلو",
                style: TextStyle(color: Colors.white),
              ),
            ),
            accountEmail: Text(
              "info@gmail.com",
              style: TextStyle(color: Colors.white),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/pro.png'),
            ),
            onDetailsPressed: () {},
            decoration: BoxDecoration(
              color: LightColor.orange,
            ),
          ),
          Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
         children: [
           ListTile(
             title: Text('پروفایل'),
             leading: Icon(Icons.person),
             onTap: () {
               Navigator.of(context).pushNamed('/profile');
             },
           ),
           ListTile(
             title: Text('ثبت نام'),
             leading: Icon(Icons.person),
             onTap: () {
               Navigator.of(context).pushNamed('/signup');
             },
           ),
           ListTile(
             title: Text('ورود'),
             leading: Icon(Icons.person),
             onTap: () {
               Navigator.of(context).pushNamed('/signin');
             },
           ),
           Container(
             height: 2,
             color: Colors.white70,
           ),
           ExpansionTile(
             expandedAlignment: Alignment.bottomCenter,
             title: Text('دسته بندی'),
             leading: Icon(Icons.assistant_photo),
             trailing: Icon(
               Icons.arrow_back_ios_rounded,
               size: 17,
             ),
             children: <Widget>[
               ListTile(
                 contentPadding: EdgeInsets.only(right: 30,left: 16),
                 title: Text("موبایل"),
                 onTap: () {},
                 trailing: Icon(
                   Icons.arrow_back_ios_rounded,
                   size: 17,
                 ),
               ),
               ListTile(
                   contentPadding: EdgeInsets.only(right: 30,left: 16),
                   title: Text("فایل"),
                   onTap: () {}),
               ListTile(
                 contentPadding: EdgeInsets.only(right: 30,left: 16),
                 title: Text("موبایل"),
                 onTap: () {},
                 trailing: Icon(
                   Icons.arrow_back_ios_rounded,
                   size: 17,
                 ),
               ),
               ListTile(
                   contentPadding: EdgeInsets.only(right: 30,left: 16),
                   title: Text("فایل"),
                   onTap: () {}),
               ListTile(
                 contentPadding: EdgeInsets.only(right: 30,left: 16),
                 title: Text("موبایل"),
                 onTap: () {},
                 trailing: Icon(
                   Icons.arrow_back_ios_rounded,
                   size: 17,
                 ),
               ),
               ListTile(
                   contentPadding: EdgeInsets.only(right: 30,left: 16),
                   title: Text("فایل"),
                   onTap: () {}),
             ],
           ),

           Expanded(
             child: Align(
                 alignment: Alignment.bottomCenter,
                 child: Container(
                   alignment: Alignment.bottomRight,
                   height: MediaQuery.of(context).size.height * .3,
                   child: Column(
                     mainAxisSize: MainAxisSize.max,
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [

                       ListTile(
                           title: Text("درخواست برد:"),
                           subtitle:Text("info@gmail.com"),
                           leading: Icon(Icons.email),
                           onTap: () {launch('mailto:info@gmail.com?subject=درخواست برد');}),
                       Divider(),
                       ListTile(
                           title: Text(" 9369256527 98+ "),
                           leading: Icon(Icons.call),
                           onTap: () {
                             launch("tel://+989369256527");
                           }),
                       SizedBox(
                         height: 15,
                       ),
                       ListTile(
                           title: Text('بازگشت'),
                           leading: Icon(Icons.close),
                           onTap: () {
                             Navigator.of(context).pop();
                           }),

                     ],
                   ),
                 )),
           ),
         ],

              )

          )
        ],
      ),

    );
  }
}