import 'package:flutter_ringtone_player_example/service/Service.dart';
import 'package:flutter_ringtone_player_example/model/Todo.dart';
import 'package:scoped_model/scoped_model.dart';

class TodoModel extends Model {
  TodoService _service;
  List<Todo> todoList = [];

  TodoModel(this._service) {
    getTodoList();
    getTodoListLength();
  }

  getTodoList() {
    _service.getAllTodos().then((_todos) {
      todoList = _todos;
    }).catchError((_) {
      todoList = [];
    }).whenComplete(() {});
  }

  getTodoListLength() {
    _service.getAllTodos().then((todos) {
      todoList = todos;
    }).catchError((_) {
      todoList = [];
    }).whenComplete(() {
      return todoList.length;
    });
  }

/*getAllTodos2() {

  }*/
}
