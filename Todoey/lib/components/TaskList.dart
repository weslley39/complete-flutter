import 'package:flutter/material.dart';
import 'package:todoey/components/TaskTile.dart';
import 'package:todoey/models/Task.dart';

class TasksList extends StatelessWidget {
  TasksList(this.tasks);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var task = tasks[index];
        return TaskTile(
          task.name,
          isChecked: task.isDone,
          onChecked: (value) {
            tasks[index].toggle();
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
