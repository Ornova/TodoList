import 'package:flutter/material.dart';
import 'package:cookie_of_the_day/model/TodoModel.dart';
import 'package:cookie_of_the_day/service/Service.dart';
import 'package:cookie_of_the_day/pages/TodoOfTheDayPage.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/TodoList.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Todo List',
        home: new TodoList()
    );
  }
}
