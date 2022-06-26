import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class RetailChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  RetailChart({Key? key}) : super(key: key);

  factory RetailChart.withSampleData() {
    return RetailChart();
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
    final woolies_2020 = [
      Emissions('Woolworths', 44886), //1 2020
      Emissions('Woolworths', 441875), //2 2020
    ];

    final woolies_2021 = [
      Emissions('Woolworths', 449819), //1 2021
      Emissions('Woolworths', 40675226), //2 2021
    ];

    final mr_price_2020 = [
      Emissions('Mr Price', 52535), //1 2020
      Emissions('Mr Price', 52535), //2 2020
    ];

    final mr_price_2021 = [
      Emissions('Mr Price', 46034), //1 2021

      Emissions('Mr Price', 46034), //2 2021
    ];

    final shoprite_2020 = [
      Emissions('Shoprite', 528889), //1 2020
      Emissions('Shoprite', 1802314), //2 2020
    ];

    final shoprite_2021 = [
      Emissions('Shoprite', 511067), //1 2021
      Emissions('Shoprite', 1694193), //2 2021
    ];

    return [
      charts.Series<Emissions, String>(
        id: 'Woolworths (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: woolies_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Woolworths (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: woolies_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'MrPrice (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: mr_price_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'MrPrice (2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: mr_price_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Shoprite (2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: shoprite_2020,
      ),
      charts.Series<Emissions, String>(
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