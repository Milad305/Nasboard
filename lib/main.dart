import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/config/route.dart';

import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
import 'package:flutter_ecommerce_app/src/widgets/customRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),


    debugShowCheckedModeBanner: false,
      title: 'Nasboard ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name.contains('detail')) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => ProductDetailPage());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => MainPage());
        }
      },
      initialRoute: "MainPage",
    );







  }
}
