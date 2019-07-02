import 'package:cookie_of_the_day/model/Todo.dart';

class TodoService {
  Future<List<Todo>> getAllTodos() async {
    //http.get('myServer.com/cookies')
    return Future<List<Todo>>.value(_todos);
  }

  Future<Todo> getTodo(int id) async {
    return Future<Todo>.value(_todos.firstWhere((element) => element.id == id));
  }

  Future<Null> deleteTodo(int id) async {
    _todos.removeWhere((element) => element.id == id);
    return Future<Null>.value(null);
  }

  Future<Todo> addTodo(String wisdom) async {
    return Future<Todo>.value(_insertTodo(wisdom));
  }

  TodoService() {
    _insertTodo(
        'Frage dich nicht, was dein Land für dich tun kann, frage dich, was du für dein Land tun kannst.');
    _insertTodo(
        'Ich wollte diesen Körper, und mir war egal was ich dafür tun musste');
    _insertTodo('How much is the fish?');
    _insertTodo('Mailand oder Madrid, hauptsache Italien');
    _insertTodo('Vicktor Ullate');
  }

  _insertTodo(String text) {
    Todo todo = (Todo(nextId, text));
    _todos.add(todo);
    return todo;
  }

  List<Todo> _todos = [];
  static int _nextId = 1;

  static get nextId => _nextId++;
}
