import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/pages/Profile.dart';
import 'package:flutter_ecommerce_app/src/pages/likedproducts.dart';
import 'package:flutter_ecommerce_app/src/pages/signin.dart';
import 'package:flutter_ecommerce_app/src/pages/signup.dart';
import 'package:flutter_ecommerce_app/src/pages/paymentpage.dart';
import 'package:flutter_ecommerce_app/src/pages/productlistpage.dart';
class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      MainPage.routeName: (_) => MainPage(),
      SignUpScreen.routeName:(_) => SignUpScreen(),
      SignInPage.routeName:(_) => SignInPage(),
      LikedProductPage.routeName:(_) =>LikedProductPage(),
      ProfilePage.routeName:(_) => ProfilePage(),
      Payment.routeName:(_) => Payment(),
      ProductGrid.routeName:(_) => ProductGrid(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}



