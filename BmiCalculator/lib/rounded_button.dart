import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.onPress, this.icon});

  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: this.onPress,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        this.icon,
        color: Colors.white,
      ),
    );
  }
}
