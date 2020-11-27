import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height+5;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height/10,
        width: width,
        padding: EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[LightColor.orange, LightColor.background]
          ),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.arrow_back,),
                onPressed: (){
                  print("pop");
                  Navigator.of(context).pop();
            })
          ],
        ),
      ),
    );
  }
}
