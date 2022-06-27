import 'package:absa_cib_ecg_dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class AgriChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  AgriChart();

  factory AgriChart.withSampleData() {
    return new AgriChart();
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList = _createSampleData(),
        animate: animate,
        barGroupingType: charts.BarGroupingType.stacked,
        defaultRenderer: charts.BarRendererConfig(
            cornerStrategy: const charts.ConstCornerStrategy(2)),

        // Add the series legend behavior to the chart to turn on series legends.
        // By default the legend will display above the chart.
        behaviors: [
          //charts.SeriesLegend(),
          charts.ChartTitle(
              'Scope Emissions for the Agriculture sector in 2020(left bar) and 2021(right bar)',
              behaviorPosition: charts.BehaviorPosition.bottom,
              titleStyleSpec:   const charts.TextStyleSpec(fontSize: 14,),
              titleOutsideJustification:
              charts.OutsideJustification.middleDrawArea),
          
        ],);
  }

  /// Create series list with multiple series
  static List<charts.Series<Emissions, String>> _createSampleData() {
    final country_bird_2020 = [
      new Emissions('Country Bird Holdings (PTY)', 19221), //Scope 1, 2020
      new Emissions('Country Bird Holdings (PTY)', 57500), //scope 2 2020
    ];

    final country_bird_2021 = [
      new Emissions('Country Bird Holdings (PTY)', 15837), //scope 1 2021
      new Emissions('Country Bird Holdings (PTY)', 52010), //scope 2 2021
    ];

    final karan_beef_2020 = [
      new Emissions('Karan Beef Feedlot ', 12649), //Scope 1, 2020
      new Emissions('Karan Beef Feedlot ', 37840), //scope 2 2020
    ];

    final karan_beef_2021 = [
      new Emissions('Karan Beef Feedlot ', 228075), //scope 1 2021
      new Emissions('Karan Beef Feedlot ', 749018), //scope 2 2021
    ];

    final afgri_2020 = [
      new Emissions('Afgri Grain Marketing (PTY) LTD', 164384), //Scope 1, 2020
      new Emissions('Afgri Grain Marketing (PTY) LTD', 491758), //scope 2 2020
    ];

    final afgri_2021 = [
      new Emissions('Afgri Grain Marketing (PTY) LTD', 153247), //scope 1 2021
      new Emissions('Afgri Grain Marketing (PTY) LTD', 503277), //scope 2 2021
    ];

    final revenues = [
      new Emissions('Country Bird Holdings', 2685),
      new Emissions('Country Bird Holdings', 2359),
      new Emissions('Karan Beef Feedlot', 1767),
      new Emissions('Karan Beef Feedlot', 33973),
      new Emissions('Afgri Grain Marketing', 22963),
      new Emissions('Afgri Grain Marketing', 22827),
    ];

    return [
      new charts.Series<Emissions, String>(
        id: 'Country Bird \nHoldings (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: country_bird_2020,
      ),
      new charts.Series<Emissions, String>(
        id: 'Country Bird \nHoldings (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: country_bird_2021,
      ),
      new charts.Series<Emissions, String>(
        id: 'Karan Beef \nFeedlot (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: karan_beef_2020,
      ),
      new charts.Series<Emissions, String>(
        id: 'Karan Beef \nFeedlot (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: karan_beef_2021,
      ),
      new charts.Series<Emissions, String>(
        id: 'Afgri Grain \nMarketing (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: afgri_2020,
      ),
      new charts.Series<Emissions, String>(
        id: 'Afgri Grain \nMarketing (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: afgri_2021,
      ),
      new charts.Series<Emissions, String>(
        id: 'Revenues',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(oranges[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: revenues,
      )..setAttribute(charts.rendererIdKey, 'customLine'),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}

class Revenues {
  final String name;
  final double revenue;
  Revenues(this.name, this.revenue);
}
