import 'package:charts_flutter/flutter.dart' as charts;

class MiningSeries {
  final String name;
  final int emissions;
  final charts.Color barColor;

  MiningSeries(
      {required this.name, required this.emissions, required this.barColor});
}
