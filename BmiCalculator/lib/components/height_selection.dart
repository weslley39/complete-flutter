import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class HeightSelection extends StatefulWidget {
  HeightSelection({this.onChange});

  final Function onChange;

  @override
  _HeightSelectionState createState() => _HeightSelectionState();
}

class _HeightSelectionState extends State<HeightSelection> {
  int value = 180;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('HEIGHT', style: kLabelTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                value.toString(),
                style: kNumberTextStyle,
              ),
              Text('cm', style: kLabelTextStyle),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: kSliderInactiveColor,
                thumbColor: kSliderActiveColor,
                overlayColor: kSliderActiveColor.withAlpha(0x29),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
            child: Slider(
              value: value.toDouble(),
              min: 100.0,
              max: 250.0,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue.round();
                });
                widget.onChange(value);
              },
            ),
          )
        ],
      ),
    );
  }
}
