import 'package:flutter/material.dart';
import 'package:flutter_catelog/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatelogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "CatelogApp".text.xl5.bold.color(context.theme.accentColor).make(),
        "Treanding Products".text.xl2.make(),
      ],
    );
  }
}
