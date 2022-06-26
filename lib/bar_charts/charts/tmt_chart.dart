import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class TMTChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  TMTChart({Key? key}) : super(key: key);

  factory TMTChart.withSampleData() {
    return TMTChart();
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
    final mtn_2020 = [
      Emissions('MTN', 247385), //1 2020
      Emissions('MTN', 864865), //2 2020
    ];

    final mtn_2021 = [
      Emissions('MTN', 566785), //1 2021
      Emissions('MTN', 566785), //2 2021
    ];

    final telkom_2020 = [
      Emissions('Telkom SA SOC LTD', 50101), //1 2020
      Emissions('Telkom SA SOC LTD', 546000), //2 2020
    ];

    final telkom_2021 = [
      Emissions('Telkom SA SOC LTD', 57825), //1 2021
      Emissions('Telkom SA SOC LTD', 50695), //2 2021
    ];

    final vodacom_2020 = [
      Emissions('Vodacom (PTY) LTD', 54070), //1 2020
      Emissions('Vodacom (PTY) LTD', 556822), //2 2020
    ];

    final vodacom_2021 = [
      Emissions('Vodacom (PTY) LTD', 553982), //1 2021
      Emissions('Vodacom (PTY) LTD', 55757), //2 2021
    ];

    return [
      charts.Series<Emissions, String>(
        id: 'MTN (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: mtn_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'MTN (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: mtn_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Telkom (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: telkom_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Telkom (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: telkom_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Vodacom (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: vodacom_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Vodacom (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: vodacom_2021,
      ),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}