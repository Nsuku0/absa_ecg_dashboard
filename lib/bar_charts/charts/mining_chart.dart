import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class MiningChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  MiningChart({Key? key}) : super(key: key);

  factory MiningChart.withSampleData() {
    return MiningChart();
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList = _createSampleData(),
      animate: animate,
      //barGroupingType: charts.BarGroupingType.stacked,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      //behaviors: [charts.SeriesLegend()],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<Emissions, String>> _createSampleData() {
    final anglo_2020 = [
      Emissions('Anglo American', 875714), //1 2020
      Emissions('Anglo American', 1428571), //2 2020
    ];

    final anglo_2021 = [
      Emissions('Anglo American', 875714), //1 2021
      Emissions('Anglo American', 1428571), //2 2021
    ];

    final exxaro_2020 = [
      Emissions('Exxaro', 385000), //1 2020
      Emissions('Exxaro', 650000), //2 2020
    ];

    final exxaro_2021 = [
      Emissions('Exxaro', 345000), //1 2021
      Emissions('Exxaro', 650000), //2 2021
    ];

    final implats_2020 = [
      Emissions('Implats', 380114), //1 2020
      Emissions('Implats', 2925700), //2 2020
    ];

    final implats_2021 = [
      Emissions('Implats', 447247), //1 2021
      Emissions('Implats', 3307630), //2 2021
    ];

    return [
      charts.Series<Emissions, String>(
        id: 'Anglo (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: anglo_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Anglo (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: anglo_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Exxaro (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: exxaro_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Exxaro (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: exxaro_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Implats (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: implats_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Implats (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: implats_2021,
      ),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}
