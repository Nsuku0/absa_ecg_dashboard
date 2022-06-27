import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class RetailChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  RetailChart();

  factory RetailChart.withSampleData() {
    return new RetailChart();
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList = _createSampleData(),
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      defaultRenderer: charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(2)),

      behaviors: [
        charts.ChartTitle(
            'Scope Emissions for the Retail sector in 2020(left bar) and 2021(right bar)',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleStyleSpec:   const charts.TextStyleSpec(fontSize: 14,),
            titleOutsideJustification:
            charts.OutsideJustification.middleDrawArea),
      ],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<Emissions, String>> _createSampleData() {
    final woolies_2020 = [
      new Emissions('Woolworths Holdings Limited', 44886), //1 2020
      new Emissions('Woolworths Holdings Limited', 441875), //2 2020
    ];

    final woolies_2021 = [
      new Emissions('Woolworths Holdings Limited', 449819), //1 2021
      new Emissions('Woolworths Holdings Limited', 40675226), //2 2021
    ];

    final mr_price_2020 = [
      new Emissions('Mr Price Group LTD', 52535), //1 2020
      new Emissions('Mr Price Group LTD', 52535), //2 2020
    ];

    final mr_price_2021 = [
      new Emissions('Mr Price Group LTD', 46034), //1 2021

      new Emissions('Mr Price Group LTD', 46034), //2 2021
    ];

    final shoprite_2020 = [
      new Emissions('Shoprite Holdings', 528889), //1 2020
      new Emissions('Shoprite Holdings', 1802314), //2 2020
    ];

    final shoprite_2021 = [
      new Emissions('Shoprite Holdings', 511067), //1 2021
      new Emissions('Shoprite Holdings', 1694193), //2 2021
    ];

    return [
      new charts.Series<Emissions, String>(
        id: 'Woolworths (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: woolies_2020,
      ),
      new charts.Series<Emissions, String>(
        id: 'Woolworths (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: woolies_2021,
      ),
      new charts.Series<Emissions, String>(
        id: 'Mr Price (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: mr_price_2020,
      ),
      new charts.Series<Emissions, String>(
        id: 'Mr Price (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: mr_price_2021,
      ),
      new charts.Series<Emissions, String>(
        id: 'Shoprite (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: shoprite_2020,
      ),
      new charts.Series<Emissions, String>(
        id: 'Shoprite (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: shoprite_2021,
      ),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}
