import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import '../constants/constants.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initial Selected Value
  double scopeValue2021 = 0;
  double scopeValue2020 = 0;

  // List of items in our dropdown menu
  var companyList = [
    'FNB',
    'Nedbank',
    'Anglo American',
    'Exxaro SA',
    'Pernod Ricard SA',
    'Nestle SA',
    'Isuzu Motors SA',
    'Country Bird Holdings',
    'Karan Beef Feedlot',
    'Afgri Grain Marketing',
    'MTN',
    'Telkom SA',
    'Vodacom',
    'Woolworths Holdings',
    'Mr Price',
    'Shoprite',
    'Implats',
  ];

  //The combined scope emmissions for 2021 (scope 1 + scope 2)
  var combinedScope2021 = [
    0.07,
    1.12,
    23.04,
    9.95,
    0.01,
    0.02,
    4.32,
    0.68,
    9.77,
    6.57,
    11.34,
    1.09,
    6.10,
    411.25,
    0.92,
    22.05,
    37.55,
  ];

  //The combined scope emissions for 2020 (scope 1 + scope 2)

  var combinedScope2020 = [
    0.08,
    1.19,
    23.04,
    10.35,
    0.01,
    0.02,
    4.43,
    0.77,
    0.50,
    6.56,
    11.12,
    5.96,
    6.11,
    4.87,
    1.05,
    23.31,
    33.06,
  ];

  var rev2020 = [
    22,
    24,
    96286,
    28924,
    4818,
    7240,
    2515,
    2685,
    1767,
    22963,
    179361,
    43,
    91,
    74058,
    22963,
    158310,
    69851,
  ];
  var rev2021 = [
    24,
    25,
    4414,
    32771,
    3424,
    7241,
    2257,
    2359,
    33973,
    22827,
    181646,
    43,
    98,
    80942,
    22306,
    171188,
    129575,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: reds[2],
        title: const Text(
          "Company Information",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              //FNB
              SizedBox(
                height: 50,
                width: 120,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('FNB');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'FNB',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/fnb.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/fnb.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Nedbank
              SizedBox(
                height: 50,
                width: 80,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Nedbank');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Nedbank',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/nedbank.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/nedbank.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //anglo american
              SizedBox(
                height: 50,
                width: 120,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Anglo American');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Anglo American',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/anglo.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/anglo.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //pernod ricard
              SizedBox(
                height: 50,
                width: 150,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Pernod Ricard SA');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Pernod Ricard SA',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/pernod.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/pernod.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //nestle
              SizedBox(
                height: 50,
                width: 90,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Nestle SA');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Nestle SA',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/nestle.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/nestle.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //exxaro
              SizedBox(
                height: 50,
                width: 120,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Exxaro SA');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Exxaro SA',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/exxaro.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/exxaro.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //isuzu
              SizedBox(
                height: 50,
                width: 100,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Isuzu Motors SA');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Nedbank',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/isuzu.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/isuzu.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //country bird
              SizedBox(
                height: 50,
                width: 230,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary =
                              getCompInfo('Country Bird Holdings');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Country Bird Holdings',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/country.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/country.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // karan beef
              SizedBox(
                height: 50,
                width: 100,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary =
                              getCompInfo('Karan Beef Feedlot');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Karan Beef Feedlot',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child:
                                          Image.asset("icons/karan_beef.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/karan_beef.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //afgri grain
              SizedBox(
                height: 50,
                width: 140,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary =
                              getCompInfo('Afgri Grain Marketing');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Afgri Grain Marketing',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/afgri.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/afgri.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Implats
              SizedBox(
                height: 50,
                width: 100,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Implats');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Implats',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/implats.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/implats.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //telkom
              SizedBox(
                height: 50,
                width: 120,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Telkom SA');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Telkom SA',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/telkom.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/telkom.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
//vodacom
              SizedBox(
                height: 50,
                width: 100,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Vodacom');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Vodacom',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/vodacom.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/vodacom.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //woolies
              SizedBox(
                height: 50,
                width: 170,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary =
                              getCompInfo('Woolworths Holdings');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Woolworths Holdings Limited',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child:
                                          Image.asset("icons/woolworths.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/woolworths.png'),
                  label: const Text(
                    'Woolworths',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //mr price
              SizedBox(
                height: 50,
                width: 110,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Mr Price');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Mr Price Group',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset("icons/mrprice.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/mrprice.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //shoprite
              SizedBox(
                height: 50,
                width: 130,
                child: TextButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          String compSummary = getCompInfo('Shoprite');
                          return SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 60.0),
                              child: Column(
                                children: [
                                  const Text(
                                    'Shoprite',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                      height: 100,
                                      width: 500,
                                      child: Image.asset(
                                          "icons/shoprite_checkers.png")),
                                  Text(compSummary),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Scope Emission Scale in 100k Metric Tons CO2'),
                                  SizedBox(
                                    height: 300,
                                    width: 500,
                                    child: Center(
                                      child: PrettyGauge(
                                        gaugeSize: 300,
                                        minValue: 0,
                                        maxValue: 40,
                                        segments: [
                                          GaugeSegment(
                                              'Normal', 6.67, Colors.green),
                                          GaugeSegment('Concerning', 13.33,
                                              Colors.yellowAccent),
                                          GaugeSegment(
                                              'Over emitting', 20, Colors.red),
                                        ],
                                        valueWidget: Text(
                                          scopeValue2021.toStringAsFixed(1),
                                          style: const TextStyle(fontSize: 40),
                                        ),
                                        currentValue: scopeValue2021.toDouble(),
                                        needleColor: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  icon: Image.asset('icons/shoprite_checkers.png'),
                  label: const Text(
                    '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getCompInfo(String compName) {
    String summary = "";
    var profit = "";

    //getting the company's 2021 revenue

    var revenue2021 = rev2021[companyList.indexOf(compName, 0)];

    //2020 revenue
    var revenue2020 = rev2020[companyList.indexOf(compName, 0)];

    //Comparing the revenue
    var difference = revenue2021 - revenue2020;

    //Check if the difference is a loss or profit
    if (difference < 0) {
      profit = "loss ";
    } else {
      profit = "profit";
    }
    scopeValue2021 =
        combinedScope2021[companyList.indexOf(compName, 0)].toDouble();
    scopeValue2020 =
        combinedScope2020[companyList.indexOf(compName, 0)].toDouble();

    summary = "\n2021 Revenue = R$revenue2021 million\n "
        "\n2020 Revenue = R$revenue2020 million \n"
        "\nThe company made a $profit of R$difference million";

    return summary;
  }
}
