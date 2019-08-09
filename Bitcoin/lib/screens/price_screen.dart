import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/components/coin_price.dart';
import 'package:bitcoin_ticker/components/currency_selector.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currencySelected = 'BRL';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoList
                .map((item) => CoinPrice(
                      name: item,
                      currency: currencySelected,
                    ))
                .toList(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CurrencySelector(
              value: currencySelected,
              onChange: (value) {
                setState(() {
                  currencySelected = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
