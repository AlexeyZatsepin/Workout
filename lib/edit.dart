import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.deepOrange,
        body: new Center(
            child: new Text("Редактировать",
              style: new TextStyle(color: Colors.white),
            )
        )
    );
  }
}