import 'package:flutter/material.dart';
import '../model/TodoModel.dart';

class AllTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int x = 0; x < todoModel.getTodoListLength() - 1 8; x++)
          Container(
            height: 50,
            color: Colors.amber[500],
            child:
                const Center(child: Text (todoList.getAllTodos();),
          ),
      ],
    );
  }
}

buildContainers() {
  for (int x = 0; x < /*todoModel.getTodoListLength() - 1*/ 8; x++)
    Container(
      height: 50,
      color: Colors.amber[500],
      child: const Center(child: Text('1')), //(todoList.getAllTodos2();)),
    );
}
