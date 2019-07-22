import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.color = Color(0xFF1D1E33), this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: this.color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
