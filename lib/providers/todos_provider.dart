import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todos_app/model/todos_model.dart';




class TodosProvider extends ChangeNotifier {
  final List<TodosModel> _todos = [];

  UnmodifiableListView<TodosModel> get allTodos => UnmodifiableListView(_todos);
  
  

  void addTodo(TodosModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggleTodo(TodosModel todo) {
    final todoIndex = _todos.indexOf(todo);
    
    _todos[todoIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(TodosModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}