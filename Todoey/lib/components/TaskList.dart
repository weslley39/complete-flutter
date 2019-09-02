import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/TaskTile.dart';
import 'package:todoey/providers/Task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var tasks = taskProvider.tasks;
            var task = tasks[index];
            return TaskTile(
              task.name,
              isChecked: task.isDone,
              onChecked: (value) {
                tasks[index].toggle();
              },
              onLongPress: () {
                taskProvider.delete(task);
              },
            );
          },
          itemCount: taskProvider.count,
        );
      },
    );
  }
}
