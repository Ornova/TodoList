import 'package:cookie_of_the_day/service/Service.dart';
import 'package:cookie_of_the_day/model/Todo.dart';
import 'package:scoped_model/scoped_model.dart';

class TodoModel extends Model {
  TodoService _service;
  List<Todo> todoList = [];

  TodoModel(this._service) {
    getTodoList();
    getTodoListLength();
  }

  getTodoList() {
    _service.getAllTodos().then((todos) {
      todoList = todos;
    }).catchError((_) {
      todoList = [];
    }).whenComplete(() {
      return todoList;
    });
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
