import 'package:flutter/material.dart';

const defaultColor = Color(0xFF1D1E33);
const flexBAse = 1;

class CustomCard extends StatelessWidget {
  CustomCard(
      {this.child,
      this.onPress,
      this.color = defaultColor,
      this.flex = flexBAse});

  final Color color;
  final Widget child;
  final Function onPress;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: this.flex,
      child: GestureDetector(
        onTap: () => this.onPress(),
        child: Container(
          child: child,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: this.color, borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
