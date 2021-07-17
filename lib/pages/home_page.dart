import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:flutter_catelog/widget/home_widgets/catalog_header.dart';
import 'package:flutter_catelog/widget/home_widgets/catalog_list.dart';
import 'package:flutter_catelog/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catelog/models/catelog.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String name = "first one";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catelogJson =
        await rootBundle.loadString("assets/files/catelog.json");
    final decodedData = jsonDecode(catelogJson);
    var productsData = decodedData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.liteblueColor,
        child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          bottom: false,
          child: Container(
            padding: Vx.m24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  CatelogList().py16().expand()
                else
                    CircularProgressIndicator().centered().py16().expand(),
                  
              ],
            ),
          ),
        ));
  }
}


