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

  static var done = {};
  static var selectedCount = {};

  ItemViewState({this.text, this.count, this.weight});

  void showSlideupView(BuildContext context) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
                height: 40.0,
                child: new LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),
                  value: _value,
                  backgroundColor: Colors.white,
                ),
          );
        });
  }

  void changeData(BuildContext context, String text) {
    showSlideupView(context);
    setState(() {
      if (selectedCount[text] == null) selectedCount[text] = 1;
      else selectedCount[text] = selectedCount[text] + 1;
      _value = selectedCount[text] / 3;
      if (_value >= 1) {
        done[text] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: done[text] != null? new BoxDecoration(
          color: Colors.black12
      ) : null,
      child: new ListTile(
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
            ),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: <Color>[Colors.deepOrange, Colors.redAccent]),
              shape: BoxShape.circle,
            )),
        onTap: () => changeData(context, text),
      ),
    );
  }

  Text buildText(String text) {
    return new Text(text,
        style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
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
