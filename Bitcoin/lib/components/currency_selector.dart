import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class CurrencySelector extends StatefulWidget {
  CurrencySelector({this.value, this.onChange});

  final Function onChange;
  final String value;

  @override
  _CurrencySelectorState createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<CurrencySelector> {
  String selectedCurrency;

  Widget renderForAndroid() {
    return DropdownButton<String>(
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        widget.onChange(selectedCurrency);
      },
      items: currenciesList
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
    );
  }

  Widget renderForiOS() {
    return CupertinoPicker(
      scrollController: FixedExtentScrollController(
          initialItem: currenciesList.indexOf(selectedCurrency)),
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = currenciesList[index];
          widget.onChange(selectedCurrency);
        });
      },
      children: currenciesList.map((item) => Text(item)).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedCurrency = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? renderForiOS() : renderForAndroid();
  }
}
