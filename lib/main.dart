import 'package:flutter/material.dart';
import 'package:cookie_of_the_day/model/TodoModel.dart';
import 'package:cookie_of_the_day/service/Service.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/TodoList.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Roboto',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            title: TextStyle(
                fontSize: 30.0,
                backgroundColor: Color.fromRGBO(115, 150, 200, 0.2)),
            body1: TextStyle(fontSize: 30.0, fontFamily: 'Roboto'),
          ),
        ),
       title: 'Todo List',
       home: new TodoList());
 }
}
