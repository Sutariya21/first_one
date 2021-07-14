import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  // ignore: unnecessary_null_comparison
  const ItemWidget({Key? key, required this.item})
      // ignore: unnecessary_null_comparison
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name}pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}
