import 'package:flutter/material.dart';
import 'package:todos_app/screens/add_todos.dart';
import 'package:todos_app/size_config.dart';
import 'package:todos_app/widgets/all_todos_list.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: 
        
        const AllTodosList(),
        floatingActionButton: FloatingActionButton(
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
