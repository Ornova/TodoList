import 'package:flutter/material.dart';
import 'package:cookie_of_the_day/model/TodoModel.dart';
import 'package:cookie_of_the_day/service/Service.dart';
import 'package:cookie_of_the_day/pages/TodoOfTheDayPage.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(TodoApp(TodoModel(TodoService())));

class TodoApp extends StatelessWidget {
  TodoModel _todoModel;

  TodoApp(this._todoModel);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ScopedModel(
          model: _todoModel,
          child: TodoOfTheDayPage(),
        ));
  }
}
