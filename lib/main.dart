import 'package:flutter/material.dart';

var monday = ['Обратные скручивания',
              'Подъем ног в висе',
              'Жим гантелей лежа на горизонтальной скамье',
              'Разводка гантелей лежа на горизонтальной скамье',
              'Французский жим',
              'Жим лежа узким хватом',
              'Жим вниз на верхнем блоке'];
var wednesday = ['Скручивания на блоке',
              'Тяга штанги к поясу в наклоне',
              'Тяга верхнего блока к груди широким хватом',
              'Подтягивания широким хватом до груди',
              'Тяги нижнего блока',
              'Сгибание рук в локтевом суставе со штангой стоя',
              'Подъем штанги на бицепс на скамье Скотта',
              'Подъем рук с гантелями через стороны в положении стоя',
              'Тяга штанги к подбородку'];
var friday = ['Подъем туловища на римском стуле',
              'Отведение рук назад в тренажере пек-дек',
              'Махи гантелями или разведение гантелей в наклоне'
              'Упражнение велосипед'];

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Мои тренировки';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: generatePage(),
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
    return new Center(
        child: new Text("Сегодня нет тренировок")
    );
  }
  var widgets;
  for (var item in data) {
    widgets.add(new ItemView(text:item));
  }
  return new ListView(
    children: widgets,
  );
}