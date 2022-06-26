import 'package:charts_flutter/flutter.dart' as charts;

class ManufacturingSeries {
  final String name;
  final int emissions;
  final charts.Color barColor;

  ManufacturingSeries(
      {required this.name, required this.emissions, required this.barColor});
}
