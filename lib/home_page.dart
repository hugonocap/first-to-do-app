import 'package:flutt/data/database.dart';
import 'package:flutt/dialog_box.dart';
import 'package:flutt/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //*  reference the hive box
  final _mybox = Hive.openBox('mybox');
  ToDoDataBase db = ToDoDataBase();

  //* text controller
  final _controller = TextEditingController();

  //* checkbox was tapped
  void CheckboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  //* save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _controller.text,
        false,
      ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //* create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //* delete task

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Center(
          child: Text('To Do'),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add_rounded),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => CheckboxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
