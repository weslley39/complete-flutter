import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  bool isChecked = false;
  final String text;
  final Function onChecked;

  TaskTile(this.text, {this.isChecked, this.onChecked});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: TextStyle(
          decoration: widget.isChecked
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: widget.isChecked,
        onChanged: (value) {
          setState(() {
            widget.isChecked = !widget.isChecked;
          });
          widget.onChecked(value);
        },
      ),
    );
  }
}
