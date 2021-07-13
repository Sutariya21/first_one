import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/widget/drawer.dart';
import 'package:flutter_catelog/widget/item_widget.dart';

class Homepage extends StatelessWidget {
  final String name = "first one";
  @override
  Widget build(BuildContext context) {
        final dummylist = List.generate(50, (index) => CatelogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
          return ItemWidget(
            item: dummylist[index],
            );
        }),
      ),
      drawer: MyDrawer(),
    );
  }
}
