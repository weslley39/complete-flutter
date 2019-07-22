import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(
                      child: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  )),
                  CustomCard(
                      child: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'FEMALE',
                  )),
                ],
              ),
            ),
            CustomCard(),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomCard(),
                  CustomCard(),
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
