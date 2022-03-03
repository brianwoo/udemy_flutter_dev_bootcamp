import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<Ticker> tickers = [];

  @override
  void initState() {
    super.initState();
    buildTickers();
  }

  Future<String> getExchangeRate(String crypto) async {
    dynamic coinData = await CoinData.getCoinData(crypto, selectedCurrency);
    return coinData['rate'].toStringAsFixed(2);
  }

  CupertinoPicker getIOSPicker() {
    return CupertinoPicker(
      onSelectedItemChanged: (int selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          buildTickers();
        });
      },
      itemExtent: 32.0,
      children: getPickerItems(),
    );
  }

  DropdownButton<String> getAndroidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getDropdownItems(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          buildTickers();
        });
      },
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return getIOSPicker();
    } else if (Platform.isAndroid) {
      return getAndroidDropdown();
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return currenciesList
        .map((currency) => DropdownMenuItem<String>(
              child: Text(currency),
              value: currency,
            ))
        .toList();
  }

  List<Text> getPickerItems() {
    return currenciesList.map((currency) => Text(currency)).toList();
  }

  void buildTickers() async {
    List<Ticker> tickers = [];
    for (String crypto in cryptoList) {
      String exchangeRate = await getExchangeRate(crypto);
      tickers.add(Ticker(
        crypto: crypto,
        currency: selectedCurrency,
        exchangeRate: exchangeRate,
      ));
    }
    setState(() {
      this.tickers = tickers;
    });
  }

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
          ...tickers,
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
