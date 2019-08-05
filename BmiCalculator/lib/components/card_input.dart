import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardInput extends StatefulWidget {
  CardInput({@required this.name, this.onChange});

  final String name;
  final Function onChange;

  @override
  _CardInputState createState() => _CardInputState();
}

class _CardInputState extends State<CardInput> {
  int value = 20;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.name, style: kLabelTextStyle),
          Text(value.toString(), style: kNumberTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedButton(
                icon: FontAwesomeIcons.minus,
                onPress: () {
                  setState(() {
                    if (value > 0) value -= 1;
                  });
                  widget.onChange(value);
                },
              ),
              SizedBox(width: 10.0),
              RoundedButton(
                icon: FontAwesomeIcons.plus,
                onPress: () {
                  setState(() {
                    value += 1;
                  });
                  widget.onChange(value);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
