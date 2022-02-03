

class TodosModel {
  String title;
  String date;
  bool completed;

  TodosModel({required this.title, this.completed = false, required this.date});

  void toggleCompleted() {
    completed = !completed;
  }
}