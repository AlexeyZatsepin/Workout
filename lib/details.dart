import 'package:flutter/material.dart';
import 'package:workout/model.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Мои тренировки';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.redAccent,
            title: new Text(title),
          ),
          body: generatePage()),
    );
  }
}

class ItemView extends StatefulWidget {
  var text;
  var count;
  var weight;

  ItemView({this.text, this.count, this.weight});

  @override
  ItemViewState createState() =>
      new ItemViewState(text: text, count: count, weight: weight);
}

class ItemViewState extends State<ItemView> {
  var text;
  var count;
  var weight;

  ItemViewState({this.text, this.count, this.weight});

  void changeData() {
    setState(() {
//      if (number < 3) number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(text,
          style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: new Text('3x$count',
          style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      trailing: new Container(
          margin: new EdgeInsets.only(bottom: 5.0),
          width: 60.0,
          height: 60.0,
          child: new Center(
            child: new Text(weight.toString(),
                style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          ),
//            child:  new PopupMenuButton<String>(
//                initialValue: "10",
//                onSelected: (String result) { setState(() { _selection = result; });},
//                padding: EdgeInsets.zero,
//                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
//                  new PopupMenuItem<String>(
//                      value: (weight-10).toString(),
//                      child: new Text((weight-10).toString())
//                  ),
//                  new PopupMenuItem<String>(
//                      value: weight.toString(),
//                      child: new Text(weight.toString())
//                  ),
//                  new PopupMenuItem<String>(
//                      value: (weight+10).toString(),
//                      child: new Text((weight+10).toString())
//                  )
//                ]
//            )
          ),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: <Color>[Colors.deepOrange, Colors.redAccent]),
            shape: BoxShape.circle,
          )),
      onTap: changeData,
    );
  }

  void updateWeight(String value) {
  }
}

Widget generatePage() {
  var data = new DataProvider().getData();
  var child;
  if (data==null || data.length == 0) {
    child = new Center(
        child: new Text("Сегодня нет тренировок",
            style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
        )
    );
  } else {
    var widgets = [];
    for (var item in data) {
      widgets.add(new ItemView(text: item.title, count: item.count, weight: item.weight));
    }
    child = new ListView(
      children: widgets,
    );
  }
  return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: <Color>[Colors.deepOrange, Colors.orange]),
      ),
      child: child
  );
}
