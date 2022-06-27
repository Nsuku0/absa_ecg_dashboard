import 'package:absa_cib_ecg_dashboard/bar_charts/charts/retail_chart.dart';
import 'package:absa_cib_ecg_dashboard/bar_charts/charts/tmt_chart.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'agri_chart.dart';
import 'banking_chart.dart';
import 'manufacturing_chart.dart';
import 'mining_chart.dart';

class BarHome extends StatelessWidget {
  const BarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text("Detailed Sector Information"),
        backgroundColor: reds[2],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            SizedBox(
                height: 500,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: AgriChart(),
                )),

            const SizedBox(
              height: 50,
            ),

            SizedBox(
                height: 500,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: BankingChart(),
                )),

            const SizedBox(
              height: 50,
            ),

            SizedBox(
                height: 500,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ManufacturingChart(),
                )),

            const SizedBox(
              height: 50,
            ),

            SizedBox(
                height: 500,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: MiningChart(),
                )),

            const SizedBox(
              height: 50,
            ),

            SizedBox(
                height: 500,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: RetailChart(),
                )),

            const SizedBox(
              height: 50,
            ),

            SizedBox(
                height: 500,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TMTChart(),
                )), //
          ],
        ),
      ),
    );
  }
}
