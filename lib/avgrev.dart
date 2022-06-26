import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'constants/constants.dart';


class Average extends StatefulWidget{

  const Average({Key? key}) : super(key: key);
  @override
  State createState() => App();

}
class App extends State<Average>{
  late List<RevDat> _chartData;  // initializes chart data field
  @override
  void initState(){
    _chartData = getSectorInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
                title:
                ChartTitle(text:"Average Revenue Per Sector",
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  borderWidth: 2,
                  // Aligns the chart title to left
                  alignment: ChartAlignment.near,
                  textStyle: TextStyle(
                    color: oranges[2], //colour of title
                    fontFamily: 'Calibri',    // Sets title font
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold, //Make Title bold
                    fontSize: 18,), // Size of title
                ),  //returns titlte on piechart
                legend:
                Legend(
                    position:LegendPosition.left, // positioning of key
                    isVisible: true,
                    isResponsive: false, ///makes key interactive
                    overflowMode: LegendItemOverflowMode.wrap), //returns key/legend on piechart
                series: <CircularSeries>[
                  PieSeries<RevDat, String>(
                    dataSource: _chartData,
                    xValueMapper: (RevDat data,_) => data.sector,
                    yValueMapper: (RevDat data,_) => data.revenue,
                      pointColorMapper:(RevDat chartData,  _) => chartData.color,
                      dataLabelSettings: const DataLabelSettings(isVisible: true)
                  )
                ])));        // returns chart in usable area
  }



  List<RevDat> getSectorInfo(){
    final List<RevDat> chartData = [
      RevDat("Retail",123473, pinks[0]),
      RevDat("Mining", 262915,headings_orange),
      RevDat("Manu",81222,pinks[2]),
      RevDat("Agri", 72134,oranges[0]),
      RevDat("TMT",45733,lightText),
    ];
    return chartData;
  }
}

class RevDat{
  RevDat(this.sector, this.revenue, this.color);
  final String sector;
  final double revenue;
  final Color color; //variable to allow specifiation of colour
}