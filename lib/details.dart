import 'package:flutter/material.dart';

var monday = [
  'Обратные скручивания',
  'Подъем ног в висе',
  'Жим гантелей лежа на горизонтальной скамье',
  'Разводка гантелей лежа на горизонтальной скамье',
  'Французский жим',
  'Жим лежа узким хватом',
  'Жим вниз на верхнем блоке'
];
var wednesday = [
  'Скручивания на блоке',
  'Тяга штанги к поясу в наклоне',
  'Тяга верхнего блока к груди широким хватом',
  'Подтягивания широким хватом до груди',
  'Тяги нижнего блока',
  'Сгибание рук в локтевом суставе со штангой стоя',
  'Подъем штанги на бицепс на скамье Скотта',
  'Подъем рук с гантелями через стороны в положении стоя',
  'Тяга штанги к подбородку'
];
var friday = [
  'Подъем туловища на римском стуле',
  'Отведение рук назад в тренажере пек-дек',
  'Махи гантелями или разведение гантелей в наклоне',
  'Упражнение велосипед'
];

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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
          width: 50.0,
          height: 50.0,
          child: new Center(
            child:  new PopupMenuButton<String>(
                initialValue: "40",
                onSelected: updateWeight,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                      value: "40",
                      child: new Text("40")
                  ),
                  new PopupMenuItem<String>(
                      value: "50",
                      child: new Text("50")
                  ),
                  new PopupMenuItem<String>(
                      value: "60",
                      child: new Text("60")
                  )
                ]
            )
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
  DateTime now = new DateTime.now();
  var data;
  if (now.weekday == DateTime.monday) {
    data = monday;
  } else if (now.weekday == DateTime.wednesday) {
    data = wednesday;
  } else if (now.weekday == DateTime.friday) {
    data = friday;
  } else {
    data = monday;
//    return new Center(child: new Text("Сегодня нет тренировок"));
  }
  var widgets = [];
  for (var item in data) {
    widgets.add(new ItemView(text: item, count: 0, weight: 50));
  }
  return new Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: <Color>[Colors.deepOrange, Colors.orange]),
      ),
      child: new ListView(
        children: widgets,
      ));
}
