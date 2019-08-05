import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/primary_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/service/calculator_service.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.height, @required this.weight}) {
    CalculatorService calc = CalculatorService(weight, height);
    this.bmi = calc.getBMI();
    this.title = calc.getResult();
    this.description = calc.getInterpretation();
  }

  final int height;
  final int weight;
  String bmi;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle),
              ),
            ),
            CustomCard(
              flex: 5,
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(this.title.toUpperCase(), style: kResultTextStyle),
                  Text(this.bmi, style: kBMITextStyle),
                  Text(
                    this.description,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
            PrimaryButton(
              text: 'RE-CALCULATE',
              onPress: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
