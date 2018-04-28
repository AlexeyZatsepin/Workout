var monday = [
  new WorkoutItem('Обратные скручивания', 12, 0),
  new WorkoutItem('Подъем ног в висе', 15, 0),
  new WorkoutItem('Жим гантелей лежа на горизонтальной скамье', 12, 0),
  new WorkoutItem('Штанга от груди лежа', 12, 52),
  new WorkoutItem('Разводка гантелей лежа на горизонтальной скамье', 12, 10),
  new WorkoutItem('Французский жим', 10, 40),
  new WorkoutItem('Жим вниз на верхнем блоке', 12, 25),
  new WorkoutItem('Подьем гантелей перед собой', 12, 9)
];
var wednesday = [
  new WorkoutItem('Скручивания на блоке', 12, 0),
  new WorkoutItem('Тяга штанги к поясу в наклоне', 10, 40),
  new WorkoutItem('Тяга верхнего блока к груди широким хватом', 12, 70),
  new WorkoutItem('Подтягивания широким хватом до груди', 12, 0),
  new WorkoutItem('Тяги нижнего блока', 12, 60),
  new WorkoutItem('Сгибание рук в локтевом суставе со штангой стоя', 12, 40),
  new WorkoutItem('Подъем штанги на бицепс на скамье Скотта', 12, 9),
  new WorkoutItem('Подъем рук с гантелями через стороны в положении стоя', 12, 10),
  new WorkoutItem('Тяга штанги к подбородку', 12, 0)
];
var friday = [
  new WorkoutItem('Подъем туловища на римском стуле', 12, 10),
  new WorkoutItem('Отведение рук назад в тренажере пек-дек', 12, 70),
  new WorkoutItem('Махи гантелями или разведение гантелей в наклоне', 12, 9),
  new WorkoutItem('Упражнение велосипед', 12, 0)
];

class WorkoutItem {
  var title;
  var count;
  var weight;
  WorkoutItem(this.title, this.count, this.weight);
}

class DataProvider {
  var _selected = new DateTime.now().weekday;

  static final DataProvider _singleton = new DataProvider._internal();

  factory DataProvider() {
    return _singleton;
  }

  DataProvider._internal();

  List<WorkoutItem> getData(){
    var data;
    if (DateTime.monday == _selected) {
      data = monday;
    } else if (DateTime.wednesday == _selected) {
      data = wednesday;
    } else if (DateTime.friday == _selected) {
      data = friday;
    }
    return data;
  }

  void select(String number){
    if ('Пн' == number) {
      _selected = DateTime.monday;
    } else if ('Ср' == number) {
      _selected = DateTime.wednesday;
    } else if ('Пт' == number) {
      _selected = DateTime.friday;
    }
  }
}

