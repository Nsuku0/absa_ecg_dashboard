import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class RetailChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  RetailChart();

  factory RetailChart.withSampleData() {
    return RetailChart();
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
            'Combined Scope Emissions for the Retail sector in 2020 and 2021',
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
      Emissions('Woolworths Holdings LTD', 486761), //1 2020
      Emissions('Mr Price Group', 105070),
      Emissions('Shoprite', 2331203) //2 2020
    ];
    final total_2021 = [
      Emissions('Woolworths Holdings LTD', 41125045),
      Emissions('Mr Price Group', 92068),
      Emissions('Shoprite', 2205260)
    ];

    return [
      charts.Series<Emissions, String>(
        id: '2020',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: total_2020,
      ),
      charts.Series<Emissions, String>(
        id: '2021',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
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
