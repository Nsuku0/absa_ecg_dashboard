import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class ManufacturingChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  ManufacturingChart();

  factory ManufacturingChart.withSampleData() {
    return ManufacturingChart();
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList = _createSampleData(),
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(2)),

      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [
        charts.SeriesLegend(),
        charts.ChartTitle(
            'Combined Scope Emissions for the Manufacturing sector in 2020(left bar) and 2021(right bar)',
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
      Emissions('Pernod Ricard SA', 1420), //Scope 1, 2020
      Emissions('Nestle SA', 2134), //scope 2 2020
      Emissions('Isuzu Motors SA', 442938),
    ];
    final total_2021 = [
      Emissions('Pernod Ricard SA', 995),
      Emissions('Nestle SA', 2105),
      Emissions('Isuzu Motors SA', 432425),
    ];
    return [
      charts.Series<Emissions, String>(
        id: '2020',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(barchart[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: total_2020,
      ),
      charts.Series<Emissions, String>(
        id: '2021',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(barchart[1]),
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
