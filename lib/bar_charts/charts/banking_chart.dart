import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class BankingChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  BankingChart();

  factory BankingChart.withSampleData() {
    return BankingChart();
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList = _createSampleData(),
      animate: animate,
      barGroupingType: charts.BarGroupingType.groupedStacked,
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(2)),

      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [
        charts.SeriesLegend(),
        charts.ChartTitle(
            'Combined Scope Emissions for the Banking sector in 2020 and 2021',
            behaviorPosition: charts.BehaviorPosition.top,
            titleStyleSpec: const charts.TextStyleSpec(
              fontSize: 14,
            ),
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
      ],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<Emissions, String>> _createSampleData() {
    final total_2020 = [
      Emissions('FNB', 8472), //Scope 1, 2020
      Emissions('Nedbank', 119315), //scope 2 2020
    ];
    final total_2021 = [
      Emissions('FNB', 6660),
      Emissions('Nedbank', 112070),
    ];
    return [
      charts.Series<Emissions, String>(
        id: '2020',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(barchart[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: total_2020,
      ),
      charts.Series<Emissions, String>(
        id: '2021',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(barchart[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: total_2021,
      ),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}
