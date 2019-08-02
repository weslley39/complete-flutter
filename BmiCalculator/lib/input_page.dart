import 'package:bmi_calculator/card_input.dart';
import 'package:bmi_calculator/gender_selection.dart';
import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/height_selection.dart';
import 'package:flutter/material.dart';

const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GenderSelection(),
            HeightSelection(),
            Expanded(
              child: Row(
                children: <Widget>[
                  CardInput(),
                  CardInput(),
                ],
              ),
            ),
            Container(
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            )
          ],
        ));
  }
}
