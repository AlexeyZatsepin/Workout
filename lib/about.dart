import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.deepOrange,
        body: new Center(
            child: new Text("Статистика",
              style: new TextStyle(color: Colors.white),
            )
        )
    );
  }

}