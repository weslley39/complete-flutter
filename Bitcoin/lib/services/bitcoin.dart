import 'dart:convert';
import 'dart:io' show HttpStatus;
import 'package:http/http.dart' as http;

const BASE_URL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class BitcoinService {
  Future<double> getLastBid(String ticker, String currency) async {
    http.Response data = await http.get('$BASE_URL$ticker$currency');
    if (data.statusCode == HttpStatus.ok) {
      dynamic jsonData = jsonDecode(data.body);
      double lastBid = jsonData['bid'];
      return lastBid;
    }
    return null;
  }
}
