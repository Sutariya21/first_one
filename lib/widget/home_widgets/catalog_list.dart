
import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/pages/home_detail_page.dart';
import 'package:flutter_catelog/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatelogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items.length,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context , MaterialPageRoute(
            builder: (context)=>HomeDetailPage(
              catalog: catelog),
              ),
              ) ,
          child: CatelogItem(catalog: catelog));
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
        Hero(
          tag: Key(catalog.id.toString()),
        child: CatelogImage(image: catalog.image,
        ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [catalog.name.text.lg.color(context.accentColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.make(),
                ElevatedButton(onPressed: (){},
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder(),
                )), 
                child: "Add to Cart".text.make())
              ],
            ).pOnly(right: 8.0),
            ],
          ),
        )
      ],
    )).color(context.cardColor ).roundedLg.square(150).make().py16();
  }
}
