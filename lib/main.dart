import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/home_page.dart';
import 'package:flutter_catelog/pages/login_page.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: GoogleFonts.lato().fontFamily),
        darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/":(context) =>LoginPage(),
        MyRoutes.homeRoute: (context) =>Homepage(),
        "/login":(context) => LoginPage()
      },
    );
  }
}
