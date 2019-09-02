import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/Task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Coconut'),
  ];

  int get count {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void add(Task newTask) {
    this._tasks.add(newTask);
    notifyListeners();
  }

  void delete(Task task) {
    this._tasks.remove(task);
    notifyListeners();
  }
}
