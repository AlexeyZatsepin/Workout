import 'package:flutter/material.dart';
import 'package:workout/details.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List days = ['Понедельник', 'Среда', 'Пятница'];
  var text;

  @override
  void initState() {
    super.initState();
    DateTime now = new DateTime.now();
    if (now.weekday == DateTime.monday) {
      text = days[0];
    } else if (now.weekday == DateTime.wednesday) {
      text = days[1];
    } else if (now.weekday == DateTime.friday) {
      text = days[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ConstrainedBox(
        constraints: new BoxConstraints.expand(),
        child: new DecoratedBox(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/background.jpg"),
                fit: BoxFit.fitHeight
              )
//              gradient: new LinearGradient(colors: <Color>[Colors.red, Colors.blue]),
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    margin: new EdgeInsets.only(bottom: 150.0),
                    width: 150.0,
                    height: 150.0,
                    child: new Center(
                      child: new Text(text,
                        textScaleFactor: 2.0,
                        style: new TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          colors: <Color>[Colors.deepOrange, Colors.redAccent]),
                      shape: BoxShape.circle,
                    )),
                new RaisedButton(
                  padding: new EdgeInsets.all(15.0),
                  child: new Text("Начать",
                      textScaleFactor: 2.5,
                      style: new TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold
                      )),
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  onPressed: () {

                  },
                )
              ],
            )
        )
      ),
    );
  }
}