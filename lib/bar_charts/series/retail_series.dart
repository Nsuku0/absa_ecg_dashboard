import 'package:charts_flutter/flutter.dart' as charts;

class RetailSeries {
  final String name;
  final int emissions;
  final charts.Color barColor;

  RetailSeries(
      {required this.name, required this.emissions, required this.barColor});
}
