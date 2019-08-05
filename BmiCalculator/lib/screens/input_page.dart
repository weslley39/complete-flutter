import 'package:bmi_calculator/components/card_input.dart';
import 'package:bmi_calculator/components/gender_selection.dart';
import 'package:bmi_calculator/components/height_selection.dart';
import 'package:bmi_calculator/components/primary_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 20;
  int age;

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
            HeightSelection(
              onChange: (int newValue) {
                setState(() {
                  height = newValue;
                });
              },
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CardInput(
                    name: 'WEIGHT',
                    onChange: (int newValue) {
                      setState(() {
                        weight = newValue;
                      });
                    },
                  ),
                  CardInput(
                    name: 'AGE',
                    onChange: (int newValue) {
                      setState(() {
                        age = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            PrimaryButton(
                text: 'CALCULATE',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(
                                height: this.height,
                                weight: this.weight,
                              )));
                })
          ],
        ));
  }
}
