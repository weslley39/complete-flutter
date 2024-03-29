import 'package:flutter/material.dart';

class InputRounded extends StatelessWidget {
  const InputRounded({
    this.hint,
    this.onChange,
    this.controller,
    this.isObscure = false,
    this.type = TextInputType.text,
  });

  final String hint;
  final Function onChange;
  final bool isObscure;
  final TextInputType type;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      onChanged: this.onChange,
      textAlign: TextAlign.center,
      obscureText: this.isObscure,
      keyboardType: this.type,
      decoration: InputDecoration(
        hintText: this.hint,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
