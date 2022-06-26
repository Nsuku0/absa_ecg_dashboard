import 'package:charts_flutter/flutter.dart' as charts;

class TMTSeries {
  final String name;
  final int emissions;
  final charts.Color barColor;

  TMTSeries(
      {required this.name, required this.emissions, required this.barColor});
}
