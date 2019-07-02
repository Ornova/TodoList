import 'package:cookie_of_the_day/service/Service.dart';
import 'package:cookie_of_the_day/model/Todo.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:math';

class TodoModel extends Model {

  static final Random rnd = Random();
  TodoService _service;
//  Todo _actualTodo;
  List<Todo> _todoList = [];

  TodoModel(this._service) {
    _getTodoList();
  }

/*  get actualTodo =>
      _actualTodo != null
          ? _actualTodo
          : Todo(-1, 'Help', 'me.')
  ;*/

/*  Todo chooseRandomTodo() {
    _actualTodo = _todoList.isEmpty
        ? _todoList = null
        : _actualTodo = _todoList[rnd.nextInt(_todoList.length)];
    notifyListeners();
  }*/


  _getTodoList() {
    _service.getAllTodos().then((todos) {
      _todoList = todos;
    }).catchError((_) {
      _todoList = [];
    }
    ).whenComplete(() {
      //chooseRandomTodo();

      notifyListeners();
      return _todoList;
    }
    );
  }

}