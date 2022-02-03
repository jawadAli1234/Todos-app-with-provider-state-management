import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/model/todos_model.dart';
import 'package:todos_app/providers/todos_provider.dart';
import 'package:todos_app/size_config.dart';

class TodosListItems extends StatelessWidget {
  const TodosListItems({
    Key? key,
    required this.todo,
  }) : super(key: key);
  final TodosModel todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69.44 * SizeConfig.widthMultiplier,
      height: 9.51 * SizeConfig.heightMultiplier,
      decoration: BoxDecoration(
        color: const Color(0xff21212B),
        borderRadius: BorderRadius.circular(2 * SizeConfig.heightMultiplier),
      ),
      child: ListTile(
        leading: Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.pink,
          ),
          child: Checkbox(
            value: todo.completed,
            activeColor: Colors.pink,
            onChanged: (checked) {
              Provider.of<TodosProvider>(context, listen: false)
                  .toggleTodo(todo);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                1 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ),
        title: Text(todo.title),
        subtitle: Text(todo.date),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            Provider.of<TodosProvider>(context, listen: false).deleteTodo(todo);
          },
        ),
      ),
    );
  }
}
