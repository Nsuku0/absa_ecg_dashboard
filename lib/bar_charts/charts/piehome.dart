import 'package:flutter/material.dart';

import '../../avgrev.dart';
import '../../constants/constants.dart';
import '../../scope2020.dart';
import '../../scope2021.dart';

class PieHome extends StatelessWidget {
  const PieHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: const Text("Sector Information"),
        backgroundColor: reds[2],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 260,
              width: 350,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Average(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 260,
              width: 350,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Scope2021(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 260,
              width: 350,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Scope2020(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
