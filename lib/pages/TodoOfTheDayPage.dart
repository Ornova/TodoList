import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cookie_of_the_day/model/TodoModel.dart';
import 'package:vibration/vibration.dart';

class TodoOfTheDayPage extends StatelessWidget {
  //todo write code

  //todo get List of Todo

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<TodoModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(title: Text('To Do List')),
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  /*...*/
                },
                child: Text(
                  "Flat Button",
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              model.chooseRandomTodo();
              Vibration();
            }),
      );
    });
  }

  @override
  Widget build2(BuildContext context) {
    return ScopedModelDescendant<TodoModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(title: Text('To Do List 2')),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  '${model.actualTodo.text}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${model.actualTodo.author}',
                  style: Theme.of(context).textTheme.display1,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              model.chooseRandomTodo();
              Vibration();
            }),
      );
    });
  }

  @override
  Widget build3(BuildContext context) {
    return ScopedModelDescendant<TodoModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(title: Text('To Do List 3')),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  '${model.actualTodo.text}',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '${model.actualTodo.author}',
                  style: Theme.of(context).textTheme.display1,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              model.chooseRandomTodo();
              Vibration();
            }),
      );
    });
  }
}
