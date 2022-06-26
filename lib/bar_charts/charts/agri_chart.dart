import 'package:absa_cib_ecg_dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../../constants/constants.dart';

class AgriChart extends StatelessWidget {
  List<charts.Series> seriesList = _createSampleData();
  final bool animate = true;

  AgriChart({Key? key}) : super(key: key);

  factory AgriChart.withSampleData() {
    return AgriChart();
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
    final country_bird_2020 = [
      Emissions('Country Bird', 19221), //Scope 1, 2020
      Emissions('Country Bird', 57500), //scope 2 2020
    ];

    final country_bird_2021 = [
      Emissions('Country Bird', 15837), //scope 1 2021
      Emissions('Country Bird', 52010), //scope 2 2021
    ];

    final karan_beef_2020 = [
      Emissions('Karan Beef', 12649), //Scope 1, 2020
      Emissions('Karan Beef', 37840), //scope 2 2020
    ];

    final karan_beef_2021 = [
      Emissions('Karan Beef', 228075), //scope 1 2021
      Emissions('Karan Beef', 749018), //scope 2 2021
    ];

    final afgri_2020 = [
      Emissions('Afgri', 164384), //Scope 1, 2020
      Emissions('Afgri', 491758), //scope 2 2020
    ];

    final afgri_2021 = [
      Emissions('Afgri', 153247), //scope 1 2021
      Emissions('Afgri', 503277), //scope 2 2021
    ];
    return [
      charts.Series<Emissions, String>(
        id: 'Country(2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: country_bird_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Country(2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: country_bird_2021,
      ),
      charts.Series<Emissions, String>(
        id: 'Karan(2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[1]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: karan_beef_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Karan(2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[0]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: karan_beef_2021,
      ),
       charts.Series<Emissions, String>(
        id: 'Afgri(2020)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[3]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: afgri_2020,
      ),
      charts.Series<Emissions, String>(
        id: 'Afgri(2021)',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(pinks[2]),
        domainFn: (Emissions emission, _) => emission.name,
        measureFn: (Emissions emission, _) => emission.emissions,
        data: afgri_2021,
      ),
    ];
  }
}

class Emissions {
  final String name;
  final int emissions;

  Emissions(this.name, this.emissions);
}