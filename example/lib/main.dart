import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player_example/model/TodoModel.dart';
import 'package:flutter_ringtone_player_example/service/Service.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
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
                fontSize: 15.0,
                backgroundColor: Color.fromRGBO(115, 150, 200, 0.2)),
            body1: TextStyle(fontSize: 15.0, fontFamily: 'Roboto'),
          ),
        ),
        title: 'Todo List',
        home: new TodoList());
  }
}