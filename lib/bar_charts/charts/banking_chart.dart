import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class BankingChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  BankingChart({Key? key}) : super(key: key);

  factory BankingChart.withSampleData() {
    return BankingChart();
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
    final fnb_2020 = [
      Emissions('FNB', 8301), //1 2020
      Emissions('FNB', 171), // 2 2020
    ];

    final fnb_2021 = [
      Emissions('FNB', 6507), // 1 2021
      Emissions('FNB', 153), //2 2021
    ];

    final nedbank_2020 = [
      Emissions('Nedbank ', 1265), // 1 2020
      Emissions('Nedbank ', 118050), //2 2020
    ];

    final nedbank_2021 = [
      Emissions('Nedbank ', 1541), // 1 2021
      Emissions('Nedbank', 110529), //2 2021
    ];
    return [
      charts.Series<Emissions, String>(
        id: 'FNB (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: fnb_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'FNB (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: fnb_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Nedbank (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: nedbank_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Nedbank (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: nedbank_2021,
      ),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}