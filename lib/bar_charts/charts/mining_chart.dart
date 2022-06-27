import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class MiningChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  MiningChart();

  factory MiningChart.withSampleData() {
    return MiningChart();
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList = _createSampleData(),
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(2)),

      behaviors: [
        charts.SeriesLegend(),
        charts.ChartTitle(
            'Combined Scope Emissions for the Mining sector in 2020(left bar) and 2021(right bar)',
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
      Emissions('Anglo American', 2304286), //Scope 1, 2020
      Emissions('Exxaro SA', 1035000), //scope 2 2020
      Emissions('Implats', 3305814),
    ];
    final total_2021 = [
      Emissions('Anglo American', 2304286),
      Emissions('Exxaro SA', 995000),
      Emissions('Implats', 3754877),
    ];

    return [
      charts.Series<Emissions, String>(
        id: '2020',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(barchart[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: total_2020,
      ),
      charts.Series<Emissions, String>(
        id: '2021',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(barchart[4]),
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
