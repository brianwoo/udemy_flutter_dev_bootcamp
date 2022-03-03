import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const coinBaseUrl = 'https://rest.coinapi.io/v1/exchangerate';
// const coinApiKey = '707F62E5-49C5-4009-8945-21D486F61BA9';
const coinApiKey = '8DE05974-F3AE-4D15-9F55-72C5BDB8D010';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

void delay() {
  Future.delayed(const Duration(milliseconds: 700), () {});
}

class CoinData {
  static Future<dynamic> getCoinData(String crypto, String toCurrency) async {
    print('$coinBaseUrl/$crypto/$toCurrency');

    var url = Uri.parse('$coinBaseUrl/$crypto/$toCurrency');
    Map<String, String> headers = {'X-CoinAPI-Key': coinApiKey};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('Response body: ${jsonResponse["rate"]}');
      return jsonResponse;
    } else {
      print(
          'Response status: ${response.statusCode} $crypto $toCurrency ${response.reasonPhrase}');
      return Future.error('Unable to get exchange rate!');
    }
  }
}
