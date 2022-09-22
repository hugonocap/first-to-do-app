import 'package:flutt/dialog_box.dart';
import 'package:flutt/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //* text controller
  final _controller = TextEditingController();

  //* list of todo tasks
  List toDoList = [
    ['Make tutorial', false],
    ['Make cake', false],
  ];

  //* checkbox was tapped
  void CheckboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //* save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Center(
          child: Text('MAGA To Do'),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add_rounded),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => CheckboxChanged(value, index),
          );
        },
      ),
    );
  }
}
