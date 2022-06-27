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
      RevDat("Agri", 283577, oranges[0]),
      RevDat("TMT", 308638, lightText),
      RevDat("Retail", 7237062, pinks[0]),
      RevDat("Mining", 1175694, headings_orange),
      RevDat("Manu", 72588, pinks[2]),
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
