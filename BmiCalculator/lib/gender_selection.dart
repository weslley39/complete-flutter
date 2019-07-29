import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const inactiveCardColor = Color(0xFF111328);
const activeCardColor = Color(0xFF1D1E33);

enum GenderType {
  MALE,
  FEMALE,
}

class GenderSelection extends StatefulWidget {
  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;

  void update(GenderType selectedGender) {
    if (selectedGender == GenderType.MALE) {
      if (maleColor == inactiveCardColor) {
        maleColor = activeCardColor;
        femaleColor = inactiveCardColor;
      } else {
        maleColor = inactiveCardColor;
      }
    }
    if (selectedGender == GenderType.FEMALE) {
      if (femaleColor == inactiveCardColor) {
        femaleColor = activeCardColor;
        maleColor = inactiveCardColor;
      } else {
        femaleColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CustomCard(
              onPress: () {
                setState(() {
                  update(GenderType.MALE);
                });
              },
              color: maleColor,
              child: IconContent(
                icon: FontAwesomeIcons.mars,
                text: 'MALE',
              )),
          CustomCard(
              onPress: () {
                setState(() {
                  update(GenderType.FEMALE);
                });
              },
              color: femaleColor,
              child: IconContent(
                icon: FontAwesomeIcons.mars,
                text: 'FEMALE',
              )),
        ],
      ),
    );
  }
}
