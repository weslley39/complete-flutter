import 'package:flutter/material.dart';
import 'package:todoey/models/Task.dart';

class AddTaskModal {
  static Widget _getBuilder(BuildContext context, Function onNewTask) {
    String name;

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  var newTask = Task(name: name);
                  onNewTask(newTask);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  static void show({BuildContext context, Function onNewTask}) {
    showModalBottomSheet(
        context: context,
        builder: (context) => _getBuilder(context, onNewTask));
  }
}
