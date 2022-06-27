import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class BankingChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  BankingChart();

  factory BankingChart.withSampleData() {
    return new BankingChart();
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList = _createSampleData(),
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(2)),

      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [
        charts.ChartTitle(
            'Scope Emissions for the Banking sector in 2020(left bar) and 2021(right bar)',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleStyleSpec:   const charts.TextStyleSpec(fontSize: 14,),
            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea),
      ],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<Emissions, String>> _createSampleData() {
    final fnb_2020 = [
      new Emissions('FNB', 8301), //1 2020
      new Emissions('FNB', 171), // 2 2020
    ];

    final fnb_2021 = [
      new Emissions('FNB', 6507), // 1 2021
      new Emissions('FNB', 153), //2 2021
    ];

    final nedbank_2020 = [
      new Emissions('Nedbank ', 1265), // 1 2020
      new Emissions('Nedbank ', 118050), //2 2020
    ];

    final nedbank_2021 = [
      new Emissions('Nedbank ', 1541), // 1 2021
      new Emissions('Nedbank', 110529), //2 2021
    ];
    return [
      new charts.Series<Emissions, String>(
        id: 'FNB (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: fnb_2020,
      ),
      new charts.Series<Emissions, String>(
        id: 'FNB (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: fnb_2021,
      ),
      new charts.Series<Emissions, String>(
        id: 'Nedbank (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: nedbank_2020,
      ),
      new charts.Series<Emissions, String>(
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
