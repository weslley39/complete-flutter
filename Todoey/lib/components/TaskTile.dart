import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  bool isChecked = false;
  final String text;
  final Function onChecked;
  final Function onLongPress;

  TaskTile(this.text, {this.isChecked, this.onChecked, this.onLongPress});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: widget.onLongPress,
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
