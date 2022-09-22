import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  //* reference the box
  final _myBox = Hive.box('mybox');

  //* run this method if this is the first time ever of opening this app
  void createInitialData() {
    toDoList = [
      ['Swipe to delete', false],
    ];
  }

  //* load the data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //* update the database
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
