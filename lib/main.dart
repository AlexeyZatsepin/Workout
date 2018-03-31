import 'package:flutter/material.dart';
import 'package:workout/details.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List days;
  var selected;

  @override
  void initState() {
    super.initState();
    days = ['Понедельник', 'Среда', 'Пятница'];
    DateTime now = new DateTime.now();
    if (now.weekday == DateTime.monday) {
      selected = 1;
    } else if (now.weekday == DateTime.wednesday) {
      selected = 2;
    } else if (now.weekday == DateTime.friday) {
      selected = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Мои тренировки'),
      ),
      body: new ListView.builder(
        itemCount: days == null ? 0 : days.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
              onTap: () => Navigator.of(context).push(new PageRouteBuilder(
                pageBuilder: (_, __, ___) => new DetailPage(),
              )),
              child: new Container(
                  decoration: selected == null? null : new BoxDecoration(color: Colors.grey),
                  padding: new EdgeInsets.all(20.0),
                  child: new Center(
                      child: new Text(days[index],
                          style: new TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'RobotoMono'
                          )
                      )
                  )
              )
          );
        },
      ),
    );
  }
}