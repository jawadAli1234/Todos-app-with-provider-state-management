import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/providers/todos_provider.dart';
import 'package:todos_app/widgets/all_todos.dart';

class AllTodosList extends StatelessWidget {
  const AllTodosList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosProvider>(
        builder: (context, todos, child) => TodosList(
              todo: todos.allTodos,
            ),
      ),
    );
  }
}
