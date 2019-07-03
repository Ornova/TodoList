import 'package:cookie_of_the_day/model/TodoList.dart';
import 'package:flutter/material.dart';

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    // Only add the task if the user actually entered something
    if (task.length > 0) {
      // Putting our code inside "setState" tells the app that our state has changed, and
      // it will automatically re-render the list
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
            color: Colors.white,
          ),
      itemCount: _todoItems.length,
      itemBuilder: (context, index) => Container(
            color: Colors.black,
            child: new ListTile(
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
      appBar: new AppBar(title: new Text('Todo List')),
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
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () {
//              showDialog(
//                  context: context,
//                  builder: (context) {
//                    Future.delayed(Duration(seconds: 5), () {
//                      Navigator.of(context).pop(true);
//                    });
//                    return AlertDialog(
//                      title: Text('Not yet implrmented'), //Todo),
//                    );
//                  });
                },
              ),
              new IconButton(
                  icon: new Icon(Icons.menu),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 5), () {
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            title: Text('Not yet implrmented'), //Todo),
                          );
                        });
                  }),
            ],
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
