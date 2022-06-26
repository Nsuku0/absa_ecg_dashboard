import 'package:charts_flutter/flutter.dart' as charts;

class BankingSeries {
  final String name;
  final int emissions;
  final charts.Color barColor;

  BankingSeries(
      {required this.name, required this.emissions, required this.barColor});
}
