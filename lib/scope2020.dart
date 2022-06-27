//import 'package:charts_flutter/flutter.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'constants/constants.dart';

class Scope2020 extends StatelessWidget {
  Scope2020({Key? key}) : super(key: key);

  final List<RevDat> chartData = [
    RevDat("Retail", 487172.33, const Color.fromRGBO(135, 19, 60, 1)),
    RevDat("Mining", 1049766.5, const Color.fromRGBO(175, 20, 75, 1)),
    RevDat("Banking", 306420.2096, const Color.fromRGBO(240, 50, 90, 1)),
    RevDat("Manufactoring", 74415.33, const Color.fromRGBO(240, 90, 120, 1)),
    RevDat("Agriculture", 130558.67, const Color.fromRGBO(225, 120, 15, 1)),
    RevDat("TMT", 386540.5, const Color.fromRGBO(250, 85, 30, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
                title: ChartTitle(
                  text: "Combined Emissions 2020", //returns titlte on piechart
                  alignment: ChartAlignment.near,
                  textStyle: TextStyle(
                    color: oranges[2], //colour of title
                    fontFamily: 'Calibri', // Sets title font
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold, //Make Title bold
                    fontSize: 18,
                  ), // Size of title),  //returns titlte on piechart
                ),
                legend: Legend(
                    position: LegendPosition.left, // positioning of key
                    isVisible: true,
                    isResponsive: false,
                    overflowMode: LegendItemOverflowMode
                        .wrap), //returns key/legend on piechart
                series: <CircularSeries>[
          PieSeries<RevDat, String>(
              dataSource: chartData,
              xValueMapper: (RevDat chartData, _) => chartData.sector,
              yValueMapper: (RevDat chartData, _) => chartData.emission,
              pointColorMapper: (RevDat chartData, _) => chartData.color,
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]))); // returns chart in usable area
  }
}

class RevDat {
  RevDat(this.sector, this.emission, this.color);
  final String sector;
  final double emission;
  final Color color;
}
