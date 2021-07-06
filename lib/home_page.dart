import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String name = "first one";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to flutter by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
