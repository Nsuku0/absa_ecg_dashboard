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
    'ANGLO AMERICAN (PTY) LTD',
    'Exarro SA',
    'PERNOD RICARD SOUTH AFRICA (PTY) LTD',
    'NESTLE (SOUTH AFRICA) (PTY) LTD',
    'ISUZU MOTORS(SOUTH AFRICA)(PTY)(LTD)',
    'COUNTRY BIRD HOLDINGS (PTY) LTD',
    'KARAN BEEF FEEDLOT',
    'AFGRI GRAIN MARKETING (PTY) LTD',
    'MTN',
    'TELKOM SA SOC LTD',
    'VODACOM(PTY) LTD',
    'WOOLWORTHS HOLDINGS LIMITED',
    'MR PRICE GROUP LTD',
    'SHOPRITE HOLDINGS',
    'IMPLATS',
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
                width: 100,
                child: ElevatedButton(
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/fnb.png"),
                          color: Colors.green,
                        ),
                        Text(
                          'FNB',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //Nedbank
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
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
                                    const ImageIcon(
                                      AssetImage("icons/nedbank.png"),
                                      color: Colors.green,
                                    ),
                                    const Text(
                                      'Nedbank',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                        height: 100,
                                        width: 500,
                                        child:
                                            Image.asset("icons/nedbank.jpg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/nedbank.jpg"),
                          color: Colors.green,
                        ),
                        Text(
                          'Nedbank',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //anglo american
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('ANGLO AMERICAN (PTY) LTD');
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
                                        child: Image.asset("icons/anglo.jpg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/anglo.jpg"),
                          color: Colors.green,
                        ),
                        Text(
                          'ANGLO AMERICAN (PTY) LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //pernod ricard
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary = getCompInfo(
                                'PERNOD RICARD SOUTH AFRICA (PTY) LTD');
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
                                        height: 370,
                                        width: 150,
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/pernod.png"),
                          color: Colors.green,
                        ),
                        Text(
                          'PERNOD RICARD SOUTH AFRICA (PTY) LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //nestle
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('NESTLE (SOUTH AFRICA) (PTY) LTD');
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/nestle.png"),
                          color: Colors.green,
                        ),
                        Text(
                          'NESTLE (SOUTH AFRICA) (PTY) LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //exxaro
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary = getCompInfo('Exarro SA');
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/exxaro.png"),
                          color: Colors.green,
                        ),
                        Text(
                          'Exarro SA',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //isuzu
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary = getCompInfo(
                                'ISUZU MOTORS(SOUTH AFRICA)(PTY)(LTD)');
                            return SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 60.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Isuzu Motors SA',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                        height: 100,
                                        width: 500,
                                        child: Image.asset("icons/isuzu.jpeg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/isuzu.jpeg"),
                          color: Colors.green,
                        ),
                        Text(
                          'ISUZU MOTORS(SOUTH AFRICA)(PTY)(LTD)',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //country bird
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('COUNTRY BIRD HOLDINGS (PTY) LTD');
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
                                        child: Image.asset(
                                            "icons/countrybird.png")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/countrybird.png"),
                          color: Colors.green,
                        ),
                        Text(
                          'COUNTRY BIRD HOLDINGS (PTY) LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              // karan beef
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('KARAN BEEF FEEDLOT');
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
                                        child: Image.asset(
                                            "icons/karan_beef.png")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/karan_beef.png"),
                          color: Colors.green,
                        ),
                        Text(
                          'KARAN BEEF FEEDLOT',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //afgri grain
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('AFGRI GRAIN MARKETING (PTY) LTD');
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
                                        child: Image.asset("icons/afgri.jpg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/afgri.jpg"),
                          color: Colors.green,
                        ),
                        Text(
                          'AFGRI GRAIN MARKETING (PTY) LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //implats
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary = getCompInfo('IMPLATS');
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
                                        child:
                                            Image.asset("icons/implats.png")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/implats.png"),
                          color: Colors.white,
                        ),
                        Text(
                          'IMPLATS',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //telkom
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('TELKOM SA SOC LTD');
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
                                        child: Image.asset("icons/telkom.jpg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/telkom.jpg"),
                          color: Colors.green,
                        ),
                        Text(
                          'TELKOM SA SOC LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('VODACOM(PTY) LTD');
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
                                        child:
                                            Image.asset("icons/vodacom.jpeg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/vodacom.jpeg"),
                          color: Colors.green,
                        ),
                        Text(
                          'VODACOM(PTY) LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //woolies
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('WOOLWORTHS HOLDINGS LIMITED');
                            return SingleChildScrollView(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 60.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Woolworths',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                        height: 100,
                                        width: 500,
                                        child: Image.asset(
                                            'icons/woolworths.jpeg')),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage('icons/woolworths.jpeg'),
                          color: Colors.green,
                        ),
                        Text(
                          'WOOLWORTHS HOLDINGS LIMITED',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //mr price
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('MR PRICE GROUP LTD');
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
                                        child:
                                            Image.asset("icons/mrprice.jpeg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/mrprice.jpeg"),
                          color: Colors.green,
                        ),
                        Text(
                          'MR PRICE GROUP LTD',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //shoprite
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            String compSummary =
                                getCompInfo('SHOPRITE HOLDINGS');
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
                                            "icons/shoprite_checkers.jpeg")),
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
                                            GaugeSegment('Over emitting', 20,
                                                Colors.red),
                                          ],
                                          valueWidget: Text(
                                            scopeValue2021.toStringAsFixed(1),
                                            style:
                                                const TextStyle(fontSize: 40),
                                          ),
                                          currentValue:
                                              scopeValue2021.toDouble(),
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
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("icons/shoprite_checkers.jpeg"),
                          color: Colors.green,
                        ),
                        Text(
                          'SHOPRITE HOLDINGS',
                          style: TextStyle(color: text_col),
                        ),
                      ],
                    )),
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
