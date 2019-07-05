import 'package:cookie_of_the_day/model/TodoList.dart';
import 'package:flutter/material.dart';
import 'package:cookie_of_the_day/service/GeoDataService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];
  GetLocationPage glp = new GetLocationPage();

  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if (task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
      _incrementCounter(task);
      setState(() => _todoItems.add(task));
    }
  }
  _incrementCounter(String i) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String string ='';
    string = string +"";
    print(string);
    await prefs.setString('string', string);
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

              //todo monentary weather

              icon: new Icon(Icons.location_on),

              onPressed: () {

                showDialog(

                    context: context,

                    builder: (context) {

                      return GetLocationPage();

                    });

              }),
          new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 4), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        title: Text('Not yet implemented'), //Todo),
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
    // Push this page onto the stack
    Navigator.of(context).push(
        // MaterialPageRoute will automatically animate the screen entry, as well as adding
        // a back button to close it
        new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Add a new task'),
          ),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context); // Close the add todo screen
            },
            decoration: new InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: const EdgeInsets.all(16.0)),
          ));
    }));
  }
}
