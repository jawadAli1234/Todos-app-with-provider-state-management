// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/model/todos_model.dart';
import 'package:todos_app/providers/todos_provider.dart';
import 'package:todos_app/size_config.dart';

class AddTodos extends StatefulWidget {
  const AddTodos({Key? key}) : super(key: key);

  @override
  _AddTodosState createState() => _AddTodosState();
}

class _AddTodosState extends State<AddTodos> {
  DateTime selectedDate = DateTime.now();
  final todoTitleController = TextEditingController();
  final _dateController = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    todoTitleController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = todoTitleController.text;
    final String dateVal = _dateController.text;
    final bool completed = completedStatus;
    if (textVal.isNotEmpty) {
      final TodosModel todo = TodosModel(
        title: textVal,
        date: dateVal,
        completed: completed,
      );
      Provider.of<TodosProvider>(context, listen: false).addTodo(todo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Add Task',
          style: TextStyle(
            fontSize: 2.03 * SizeConfig.textMultiplier,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 27.37 * SizeConfig.heightMultiplier,
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4.16 * SizeConfig.widthMultiplier,
                  vertical: 2.03 * SizeConfig.heightMultiplier,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: todoTitleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                2.7 * SizeConfig.heightMultiplier),
                          ),
                          hintText: 'Title',
                        ),
                      ),
                      SizedBox(height: 2.7 * SizeConfig.heightMultiplier),
                      TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.map),
                            onPressed: () async {
                              _dateController.text = await _selectDate(context);
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                2.7 * SizeConfig.heightMultiplier),
                          ),
                          hintText: 'Choose date',
                        ),
                      ),
                      SizedBox(height: 1.35 * SizeConfig.heightMultiplier),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors.pink,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.6 * SizeConfig.widthMultiplier),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Completed?',
                                style: TextStyle(
                                  fontSize: 2.44 * SizeConfig.textMultiplier,
                                  color: Colors.grey,
                                ),
                              ),
                              Checkbox(
                                value: completedStatus,
                                activeColor: Colors.pink,
                                onChanged: (checked) => setState(
                                  () {
                                    completedStatus = checked!;
                                  },
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      0.67 * SizeConfig.heightMultiplier),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.0 * SizeConfig.heightMultiplier,
                          horizontal: 2.77 * SizeConfig.widthMultiplier,
                        ),
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
                            onPressed: onAdd,
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? selected;
    await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2010),
            lastDate: DateTime(2025),
            initialEntryMode: DatePickerEntryMode.input)
        .then((value) {
      selected = value;
      if (selected != null && selected != selectedDate) {
        setState(
          () {
            selectedDate = selected!;
          },
        );
      }
    });

    var date = DateTime.parse(selected.toString());
    var formattedDate = "${date.day}-${date.month}-${date.year}";

    return formattedDate;
  }
}
