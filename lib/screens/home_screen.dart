import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/providers/todos_provider.dart';

import 'package:todos_app/screens/add_todos.dart';
import 'package:todos_app/size_config.dart';

import 'package:todos_app/widgets/all_todos_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodosProvider> todos = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TodosProvider todosProvider = Provider.of<TodosProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
            'Todos',
            style: TextStyle(fontSize: 2.03 * SizeConfig.textMultiplier),
          ),
        ),
        body: todosProvider.allTodos.isEmpty
            ? Center(
                child: SizedBox(
                  width: 55 * SizeConfig.widthMultiplier,
                  height: 6.79 * SizeConfig.heightMultiplier,
                  child: ElevatedButton(
                    child: Text(
                      "Add a Todo",
                      style: TextStyle(
                        fontSize: 2.00 * SizeConfig.textMultiplier,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTodos(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          4.34 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const AllTodosList(),
        floatingActionButton: todosProvider.allTodos.isEmpty ? Container() : 
        FloatingActionButton(
          backgroundColor: Colors.yellow,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(2.7 * SizeConfig.heightMultiplier)),
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 7 * SizeConfig.imageSizeMultiplier,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTodos(),
              ),
            );
          },
        ),
      ),
    );
  }
}
