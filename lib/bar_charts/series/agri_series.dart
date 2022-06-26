import 'package:charts_flutter/flutter.dart' as charts;

class AgriSeries {
  final String name;
  final int emissions;
  final charts.Color barColor;

  AgriSeries(
      {required this.name, required this.emissions, required this.barColor});
}
