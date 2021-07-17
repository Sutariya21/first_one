// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/cart_page.dart';
import 'package:flutter_catelog/pages/home_page.dart';
import 'package:flutter_catelog/pages/login_page.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:flutter_catelog/widget/themes.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
       
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/":(context) =>LoginPage(),
        MyRoutes.homeRoute: (context) =>Homepage(),
       MyRoutes.loginRoute: (context) =>LoginPage(),
       MyRoutes.cartRoute: (context) =>CartPage(),
        
      },
    );
  }
}
