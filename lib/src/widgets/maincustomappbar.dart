import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final Color bgcolor;
  CustomAppBar(
      this.title,
      this.bgcolor,
      { Key key,}) : preferredSize = Size.fromHeight(36.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,

      title: Text(
        title,
        style: TextStyle(color: LightColor.lightGrey,fontSize: 17),
      ),
      backgroundColor: bgcolor,//Color(0xfffbfbfb),
      automaticallyImplyLeading:true,

    );
  }
}

