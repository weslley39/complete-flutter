import 'package:bitcoin_ticker/services/bitcoin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CoinPrice extends StatefulWidget {
  CoinPrice({this.name, this.currency});

  final String name;
  final String currency;

  @override
  _CoinPriceState createState() => _CoinPriceState();
}

class _CoinPriceState extends State<CoinPrice> {
  double price;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchPrice();
  }

  @override
  void didUpdateWidget(CoinPrice oldWidget) {
    super.didUpdateWidget(oldWidget);
    fetchPrice();
  }

  void fetchPrice() async {
    setState(() {
      isLoading = true;
    });
    double lastBid =
        await BitcoinService().getLastBid(widget.name, widget.currency);
    setState(() {
      price = lastBid;
      isLoading = false;
    });
  }

  Widget renderPrice() {
    if (isLoading)
      return SpinKitWave(
        color: Colors.white,
        size: 24.0,
      );
    return Text(
      '1 ${widget.name} = $price ${widget.currency}',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // fetchPrice();
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: renderPrice(),
        ),
      ),
    );
  }
}
