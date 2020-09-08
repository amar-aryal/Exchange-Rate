import 'package:http/http.dart' as http;
import 'package:exchange_rate/models/Rate.dart';

final String url = 'https://api.ratesapi.io/api/latest';

List<String> currencies = [
  "GBP",
  "HKD",
  "IDR",
  "ILS",
  "DKK",
  "INR",
  "CHF",
  "MXN",
  "CZK",
  "SGD",
  "THB",
  "HRK",
  "MYR",
  "NOK",
  "CNY",
  "BGN",
  "PHP",
  "SEK",
  "PLN",
  "ZAR",
  "CAD",
  "ISK",
  "BRL",
  "RON",
  "NZD",
  "TRY",
  "JPY",
  "RUB",
  "KRW",
  "USD",
  "HUF",
  "AUD"
];

class Data {
  Future<Rate> getdata() async {
    http.Response response = await http.get(url);
    final fetcheddata = rateFromJson(response.body);
    return fetcheddata;
  }
}
