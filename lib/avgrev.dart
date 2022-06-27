import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'constants/constants.dart';

class Average extends StatefulWidget {
  const Average({Key? key}) : super(key: key);
  @override
  State createState() => App();
}

class App extends State<Average> {
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
                  text: "Average Revenue Per Sector",
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.near,
                  textStyle: TextStyle(
                    color: oranges[2], //colour of title
                    fontFamily: 'Calibri', // Sets title font
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold, //Make Title bold
                    fontSize: 18,
                  ), // Size of title
                ), //returns titlte on piechart
                legend: Legend(
                    position: LegendPosition.left, // positioning of key
                    isVisible: true,
                    isResponsive: false,

                    ///makes key interactive
                    overflowMode: LegendItemOverflowMode
                        .wrap), //returns key/legend on piechart
                series: <CircularSeries>[
          PieSeries<RevDat, String>(
              dataSource: _chartData,
              xValueMapper: (RevDat data, _) => data.sector,
              yValueMapper: (RevDat data, _) => data.revenue,
              pointColorMapper: (RevDat chartData, _) => chartData.color,
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ]))); // returns chart in usable area
  }

  List<RevDat> getSectorInfo() {
    final List<RevDat> chartData = [
      RevDat(
        "Retail",
        123472.9,
        Color.fromRGBO(135, 19, 60, 1),
      ),
      RevDat("Mining", 262915, Color.fromRGBO(175, 20, 75, 1)),
      RevDat("Banking", 95156.5, Color.fromRGBO(240, 50, 90, 1)),
      RevDat("Manufactoring", 81221.76, Color.fromRGBO(240, 90, 120, 1)),
      RevDat("Agriculture", 72134.04, Color.fromRGBO(225, 120, 15, 1)),
      RevDat("TMT", 45733.32, Color.fromRGBO(250, 85, 30, 1)),
    ];
    return chartData;
  }
}

class RevDat {
  RevDat(this.sector, this.revenue, this.color);
  final String sector;
  final double revenue;
  final Color color; //variable to allow specifiation of colour
}
