import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/widget/drawer.dart';
import 'package:flutter_catelog/widget/item_widget.dart';

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
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatelogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  CatelogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatelogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "CatelogApp".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Treanding Products".text.xl2.make(),
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.items[index];
        return CatelogItem(catalog: catelog);
      },
    );
  }
}

class CatelogItem extends StatelessWidget {
  final Item catalog;

  const CatelogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatelogImage(image: catalog.image),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.make(),
                ElevatedButton(onPressed: (){},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder(),
                )), 
                child: "Buy".text.make())
              ],
            ).pOnly(right: 8.0)
            ],
          ),
        )
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CatelogImage extends StatelessWidget {
  final String image;

  const CatelogImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .p16
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
