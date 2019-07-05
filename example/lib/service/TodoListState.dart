import 'package:flutter_ringtone_player_example/model/TodoList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player_example/service/GeoDataService.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];
  GetLocationPage glp = new GetLocationPage();

  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if (task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      FlutterRingtonePlayer.stop();
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Mark "${_todoItems[index]}" as done?'),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('CANCEL'),
                    // The alert is actually part of the navigation stack, so to close it, we
                    // need to pop it.
                    onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('MARK AS DONE'),
                    onPressed: () {
                      FlutterRingtonePlayer.playNotification();
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  // Build the whole list of todo items
  Widget _buildTodoList() {
    return new ListView.separated(
      separatorBuilder: (context, index) => Divider(
            color: Color.fromARGB(0, 0, 0, 0),
            height: 0,
          ),
      itemCount: _todoItems.length,
      itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            margin: EdgeInsets.fromLTRB(6, 8, 6, 0),
            child: new ListTile(
                contentPadding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
                title: new Text("${_todoItems[index]}"),
                onTap: () => _promptRemoveTodoItem(index)),
          ),
    );
  }

  // Build a single todo item
  Widget _buildTodoItem(String todoText, int index) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo List'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.wb_sunny),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return GetLocationPage();
                    });
              }),
          new IconButton(
              icon: new Text('Help'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                            'To use this feature the GPS settings must be set to high precision.'), //Todo),
                      );
                    });
              }),
        ],
      ),
      body: _buildTodoList(),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              Theme.of(context).colorScheme.copyWith(secondary: Colors.cyan),
        ),
        child: FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Add a new task'),
          ),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context);
            },
            decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)),
          ));
    }));
  }
}
