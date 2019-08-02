import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardInput extends StatefulWidget {
  @override
  _CardInputState createState() => _CardInputState();
}

class _CardInputState extends State<CardInput> {
  int value = 80;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('WEIGHT', style: kLabelTextStyle),
          Text(value.toString(), style: kNumberTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedButton(
                icon: FontAwesomeIcons.minus,
                onPress: () {
                  setState(() {
                    value -= 1;
                  });
                },
              ),
              SizedBox(width: 10.0),
              RoundedButton(
                icon: FontAwesomeIcons.plus,
                onPress: () {
                  setState(() {
                    value += 1;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
