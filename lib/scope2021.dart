import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'constants/constants.dart';

class Scope2021 extends StatefulWidget {
  const Scope2021({Key? key}) : super(key: key);
  @override
  State createState() => App();
}

class App extends State<Scope2021> {
  late List<RevDat> _chartData; // initializes chart data field

  @override
  void initState() {
    _chartData = getSectorInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
                title: ChartTitle(
                  text: 'Combined Emissions 2021', //returns titlte on piechart
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.near,
                  textStyle: TextStyle(
                    color: oranges[2], //colour of title
                    fontFamily: '', // Sets title font
                    fontWeight: FontWeight.bold, //Make Title bold
                    fontSize: 18,
                  ), // Size of title
                ),
                legend: Legend(
                    position: LegendPosition.left, // positioning of key
                    isVisible: true,
                    isResponsive: false, // makes key interactive
                    overflowMode: LegendItemOverflowMode
                        .wrap), //returns key/legend on piechart
                series: <CircularSeries>[
          PieSeries<RevDat, String>(
            dataLabelSettings: const DataLabelSettings(isVisible: true),

            ///labels sector on chart
            dataSource: _chartData,
            xValueMapper: (RevDat data, _) => data.sector,
            yValueMapper: (RevDat data, _) => data.emission,
            pointColorMapper: (RevDat chartData, _) => chartData.color,
          )
        ]))); // returns chart in usable area
  }

  //}

  List<RevDat> getSectorInfo() {
    final List<RevDat> chartData = [
      RevDat("Retail", 7237062.17, const Color.fromRGBO(135, 19, 60, 1)),
      RevDat("Mining", 1175693.667, const Color.fromRGBO(175, 20, 75, 1)),
      RevDat("Banking", 28020.30315, const Color.fromRGBO(240, 50, 90, 1)),
      RevDat("Manufactoring", 72587.5, const Color.fromRGBO(240, 90, 120, 1)),
      RevDat("Agriculture", 283577.33, const Color.fromRGBO(225, 120, 15, 1)),
      RevDat("TMT", 308638.17, const Color.fromRGBO(250, 85, 30, 1)),
    ];
    return chartData;
  }
}

class RevDat {
  RevDat(this.sector, this.emission, this.color);
  final String sector;
  final double emission;
  final Color color; //variable to allow specifiation of colour
}
