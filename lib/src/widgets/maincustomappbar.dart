import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';


class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  CustomAppBar(
      this.title,
      { Key key,}) : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,

      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Color(0xfffbfbfb),
      automaticallyImplyLeading: true,
    );
  }
}

