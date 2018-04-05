import 'package:flutter/material.dart';
import 'package:workout/about.dart';
import 'package:workout/details.dart';
import 'package:workout/home.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyTabs(),
    routes: <String, WidgetBuilder> {
      '/details': (BuildContext context) => new DetailPage(),
    },
  ));
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        bottomNavigationBar: new Material(
            color: Colors.redAccent,
            child: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.home)),
                  new Tab(icon: new Icon(Icons.perm_identity)),
                  new Tab(icon: new Icon(Icons.edit)),
                ]
            )
        ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new HomePage(),
              new AboutPage(),
              new AboutPage()
            ]
        )
    );
  }
}