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
  final String text;
  final int count;
  final int weight;

  ItemView({this.text, this.count, this.weight});

  @override
  ItemViewState createState() =>
      new ItemViewState(text: text, count: count, weight: weight);
}

class ItemViewState extends State<ItemView> {
  var text;
  var count;
  var weight;
  var _value = 0.0;
  static var selected_count=0;

  ItemViewState({this.text, this.count, this.weight});

  void showSlideupView(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
              new Container(
                height: 40.0,
                child: new LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
                  value: _value,
                  backgroundColor: Colors.white,
                ),
              );
        });
  }

  void changeData(BuildContext context) {
    showSlideupView(context);
    setState(() {
      selected_count++;
      _value = selected_count / new DataProvider().getData().length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: buildText(text),
      subtitle: buildText('3x$count'),
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
      onTap: () => changeData(context),
    );
  }

  Text buildText(String text) {
    return new Text(text,
        style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
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
