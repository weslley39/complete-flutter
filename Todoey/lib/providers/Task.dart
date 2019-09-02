import 'package:flutter/foundation.dart';
import 'package:todoey/models/Task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Coconut'),
  ];

  int get count {
    return tasks.length;
  }
}
