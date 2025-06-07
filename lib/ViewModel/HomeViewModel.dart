import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  List<String> todoList = [];
  int updatedIndex = -1;

  void addTask() {
    final task = controller.text.trim();
    if (task.isEmpty) return;

    todoList.add(task);
    controller.clear();
    notifyListeners();
  }

  void editTask(int index) {
    controller.text = todoList[index];
    updatedIndex = index;
    notifyListeners();
  }

  void updateTask() {
    final task = controller.text.trim();
    if (task.isEmpty || updatedIndex == -1) return;

    todoList[updatedIndex] = task;
    updatedIndex = -1;
    controller.clear();
    notifyListeners();
  }

  void deleteTask(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }

  bool get isUpdating => updatedIndex != -1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
