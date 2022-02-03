import 'package:flutter/material.dart';

import 'package:todos_app/model/todos_model.dart';
import 'package:todos_app/widgets/todos_list_items.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final List<TodosModel> todo;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return 
    
    todo.map((todo) => Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: TodosListItems(todo: todo),
    )).toList();
  }
}
