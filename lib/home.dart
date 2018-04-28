import 'package:flutter/material.dart';
import 'package:workout/model.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  var days = ['Пн', 'Ср', 'Пт'];
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
    } else {
      text = "??";
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
                        child: buildCenterText(),
                      ),
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                            colors: <Color>[Colors.deepOrange, Colors.redAccent
                            ]),
                        shape: BoxShape.circle,
                      )
                  ),
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
                      Navigator.of(context).pushNamed('/details');
                    },
                  )
                ],
              )
          )
      ),
    );
  }

  Widget buildCenterText() {
      return new Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.redAccent
        ),
        child: new DropdownButton<String>(
          items: <String>["??", 'Пн', 'Ср', 'Пт'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value,
                  textScaleFactor: 2.0,
                  style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
              ),
            );
          }).toList(),
          value: text,
          onChanged: (txt) {
            setState(() {
              text = txt;
              new DataProvider().select(txt);
            });
          },
        )
      );

    }
}
