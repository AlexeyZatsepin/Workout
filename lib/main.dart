import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Workout';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            new ItemView(text:'First'),
            new ItemView(text:'Second'),
            new ItemView(text:'Third',),
          ],
        ),
      ),
    );
  }

}

class ItemView extends StatefulWidget {
  String text;
  ItemView({this.text});
  @override
  ItemViewState createState() => new ItemViewState(text:text);
}

class ItemViewState extends State<ItemView> {
  int number = 0;
  String text;

  ItemViewState({this.text});

  void changeData() {
    setState(() {
       if (number < 3) number ++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(text),
      trailing: new Text('$number/3'),
      onTap: changeData,
    );
  }
}