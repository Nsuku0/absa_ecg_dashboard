import 'package:flutter/material.dart';
import 'bar_charts/charts/barhome.dart';
import 'bar_charts/charts/piehome.dart';
import 'companyinfo.dart';
import 'constants/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bg,
        appBar: AppBar(
          title: const Text("ABSA ECG Dashboard"),
          centerTitle: true,
          backgroundColor: pinks[2],
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
               flex: 2,
              child: PieHome(),
            ),

            const Expanded(
              flex: 4,
              child: BarHome(),
            ),

            Expanded(
              flex: 2,
              child: Container(color: Colors.white, child: const CompanyInfo()),
            )
          ],
        ));
  }
}

