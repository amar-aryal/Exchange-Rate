import 'dart:convert';

Rate rateFromJson(String str) => Rate.fromJson(json.decode(str));

class Rate {
  String base;
  Map<String, double> rates;
  DateTime date;

  Rate({
    this.base,
    this.rates,
    this.date,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        base: json["base"],
        rates: Map.from(json["rates"]).map(
            (key, value) => MapEntry<String, double>(key, value.toDouble())),
        date: DateTime.parse(json["date"]),
      );
}
