import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cookie_of_the_day/model/TodoModel.dart';
import 'package:vibration/vibration.dart';
import 'package:cookie_of_the_day/model/TodoModel.dart';
import 'package:cookie_of_the_day/service/Service.dart';
import 'package:cookie_of_the_day/Widgets/AllWidgets.dart';

//
import 'package:cookie_of_the_day/service/Service.dart';
import 'package:cookie_of_the_day/model/Todo.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:math';

class TodoOfTheDayPage extends StatelessWidget {
  List<Todo> _todos = [];
  //todo write code
  //todo get List of Todo

  buildContainers() {
    for (int x = 0; x < /*todoModel.getTodoListLength() - 1*/ 8; x++)
      Container(
        height: 50,
        color: Colors.amber[500],
        child: const Center(child: Text('1')), //(todoList.getAllTodos2();)),
      );
  }
//
  @override
  Widget build(BuildContext context) {
//    // TODO: implement build
//    return ScopedModelDescendant<TodoModel>(builder: (context, child, model) {
//      return Scaffold(
//        appBar: AppBar(title: Text('To Do List')),
//        body: ListView(
//          padding: const EdgeInsets.all(8.0),
//          children: <Widget>[
//            AllTodos()
//          ],
//        ),
//
//        // todo Button: Implement later
//        /*floatingActionButton: FloatingActionButton(
//            child: Icon(Icons.add),
//            onPressed: () {
//              model.chooseRandomTodo();
//              Vibration();
//            }),*/
//      );
//    });
 }


}
