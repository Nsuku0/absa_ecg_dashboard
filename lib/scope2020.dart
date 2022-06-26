//import 'package:charts_flutter/flutter.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'constants/constants.dart';


class Scope2020 extends StatelessWidget{

   Scope2020 ({Key? key}) : super(key: key);

  final List<RevDat> chartData = [
    RevDat("Retail", 487172,pinks[0]),
    RevDat("Mining", 1049767,headings_orange),
    RevDat("Manu", 74415, pinks[2]),
    RevDat("Agri", 130559,oranges[0]),
    RevDat("TMT", 386541, lightText),
  ];

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
                title:
                ChartTitle(text:"Scope Emissions 2020" ,//returns titlte on piechart

                  textStyle: TextStyle(
                    color: oranges[2], //colour of title
                    fontFamily: 'Calibri',    // Sets title font
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold, //Make Title bold
                    fontSize: 18,), // Size of title),  //returns titlte on piechart
                ),
                legend:
                Legend(
                    position: LegendPosition.left, // positioning of key
                    isVisible: true,
                    isResponsive: false,
                    overflowMode: LegendItemOverflowMode.wrap),  //returns key/legend on piechart
                series: <CircularSeries>[
                  PieSeries<RevDat, String>(
                      dataSource: chartData,
                      xValueMapper: (RevDat chartData,_) => chartData.sector,
                      yValueMapper: (RevDat chartData,_) => chartData.emission,
                      pointColorMapper:(RevDat chartData,  _) => chartData.color,
                      dataLabelSettings: const DataLabelSettings(isVisible: true))
                ])));         // returns chart in usable area
  }

}

class RevDat{
  RevDat(this.sector, this.emission, this.color);
  final String sector;
  final double emission;
  final Color color;
}

