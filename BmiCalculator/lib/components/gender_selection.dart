import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderType {
  MALE,
  FEMALE,
}

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  GenderType selectedGender;

  void setGender(GenderType gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CustomCard(
              onPress: () {
                setState(() {
                  setGender(GenderType.MALE);
                });
              },
              color: selectedGender == GenderType.MALE
                  ? kActiveCardColor
                  : kInactiveCardColor,
              child: IconContent(
                icon: FontAwesomeIcons.mars,
                text: 'MALE',
              )),
          CustomCard(
              onPress: () {
                setState(() {
                  setGender(GenderType.FEMALE);
                });
              },
              color: selectedGender == GenderType.FEMALE
                  ? kActiveCardColor
                  : kInactiveCardColor,
              child: IconContent(
                icon: FontAwesomeIcons.mars,
                text: 'FEMALE',
              )),
        ],
      ),
    );
  }
}
