import 'package:flutter/material.dart';

import '../../avgrev.dart';
import '../../constants/constants.dart';
import '../../scope2020.dart';
import '../../scope2021.dart';

class PieHome extends StatelessWidget {
  const PieHome ({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sector Information"),
        backgroundColor: headings_orange,
        automaticallyImplyLeading: false,
        centerTitle: true,

      ),

      body:
        Column(
          children:  [
            const Expanded(child: Average()),
            const Expanded(child: Scope2021()),
            Expanded(child: Scope2020()),
          ],
        ),




    );
  }
}