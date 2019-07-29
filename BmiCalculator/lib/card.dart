import 'package:flutter/material.dart';

const defaultColor = Color(0xFF1D1E33);

class CustomCard extends StatelessWidget {
  CustomCard({this.child, this.onPress, this.color = defaultColor});

  final Color color;
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
