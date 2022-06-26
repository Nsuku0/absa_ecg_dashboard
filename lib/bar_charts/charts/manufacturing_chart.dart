import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class ManufacturingChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  ManufacturingChart({Key? key}) : super(key: key);

  factory ManufacturingChart.withSampleData() {
    return ManufacturingChart();
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
    final pernod_ricard_2020 = [
      Emissions('Pernod Ricard SA',
          385), // 1 2020      new Emissions('Pernod Ricard SA', 1035), // 2 2020
    ];

    final pernod_ricard_2021 = [
      Emissions('Pernod', 345), // 1 2021
      Emissions('Pernod', 650), // 2 2021
    ];

    final nestle_2020 = [
      Emissions('Nestle', 579), // 1 2020
      Emissions('Nestle', 1555), // 2 2020
    ];

    final nestle_2021 = [
      Emissions('Nestle', 730), // 1 2021
      Emissions('Nestle', 1375), // 2 2021
    ];

    final isuzu_2020 = [
      Emissions('Isuzu', 71598), // 1 2020
      Emissions('Isuzu', 371340), // 2 2020
    ];

    final isuzu_2021 = [
      Emissions('Isuzu', 78709), // 1 2021
      Emissions('Isuzu', 353716), // 2 2021
    ];

    return [
      charts.Series<Emissions, String>(
        id: 'Nestle (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: nestle_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Nestle (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: nestle_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Pernod (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: pernod_ricard_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Pernod (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: pernod_ricard_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Isuzu Motors (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: isuzu_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Isuzu (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: isuzu_2021,
      ),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}