
import 'package:flutter/material.dart';
import 'package:flutter_catelog/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
