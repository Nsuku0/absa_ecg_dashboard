import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import '../constants/constants.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo ({Key? key}): super(key:key);

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
/*

void readExcelFile() {
  ByteData data = await rootBundle.load("assets/companyData.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  var excel = Excel.decodeBytes(bytes);
  int j =0;
  int row = 18;
  int col = 2;
  var listVar = List.generate(row, (i) => List(col), growable:false);
  for (var table in excel.tables.keys) {
    //TODO: add excel code
  }
}
 */

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Initial Selected Value
  double scopeValue2021 =0;
  double scopeValue2020 =0;

  // List of items in our dropdown menu
  var companyList = [
    'SOUTH AFRICAN RUGBY UNION',
    'CORPORATE LIQUIDATORS (PTY) LTD',
    'CHEMWES (PTY) LTD',
    'RICHARDS BAY TITANIUM (PTY) LTD',
    'AFMETCO (PTY) LTD',
    'PERNOD RICARD SOUTH AFRICA (PTY) LTD',
    'NESTLE (SOUTH AFRICA) (PTY) LTD',
    'WORLD HARDWOOD (PTY) LTD',
    'ISUZU MOTORS(SOUTH AFRICA)(PTY)(LTD)',
    'COUNTRY BIRD HOLDINGS (PTY) LTD',
    'KARAN BEEF FEEDLOT',
    'AFGRI GRAIN MARKETING (PTY) LTD',
    'HOMECHOICE (PTY)LTD',
    'TELKOM SA SOC LTD',
    'VODACOM(PTY) LTD',
    'WOOLWORTHS GROUP',
    'MR PRICE GROUP LTD',
    'SHOPRITE CHECKERS (PTY)LTD',

  ];

  //The combined scope emmissions for 2021 (scope 1 + scope 2)
  var combinedScope2021 = [
    6660,
    112070,
    2304286,
    995000,
    995,
    2105,
    432425,
    67847,
    977093,
    656524,
    1133570,
    108520,
    609739,
    41125045,
    92068,
    2205260,
    3754877,
  ];

  //The combined scope emissions for 2020 (scope 1 + scope 2)

  var combinedScope2020 = [
    8472,
    119315,
    2304286,
    1035000,
    1420,
    2134,
    442938,
    76721,
    50489,
    656142,
    1112250,
    596101,
    610892,
    486761,
    105070,
    2331203,
    3305814,

  ];

  var rev2020 = [
    813,
    90700,
    318164,
    5652,
    90850,
    28924,
    50882,
    23984,
    1267,
    51400,
    31839,
    22963,
    0,
    0,
    0,
    919.751,
    22963,
    155409,
  ];
  var rev2021 = [
    500,
    98300,
    282536,
    4953,
    86590,
    32771,
    107078,
    26.278,
    1368,
    53400,
    33974,
    22827,
    3.432,
    43.222,
    98.30,
    790.84,
    22306,
    168030,
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: headings_orange,
        title: const Text("Company Information",),
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

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('SOUTH AFRICAN RUGBY UNION');
                    return SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('SOUTH AFRICAN RUGBY UNION', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/sarugby.png")),
                            Text(compSummary),

                            const SizedBox(height: 20,),

                            const Text('Scope Emission Scale in Metric Tons CO2'),

                            SizedBox(
                              height: 300,
                              width: 500,
                              child: Center(
                                child: PrettyGauge(
                                  gaugeSize: 300,
                                  minValue: 0,
                                  maxValue: 40,
                                  segments: [
                                    GaugeSegment('Normal', 6.67, Colors.green),
                                    GaugeSegment('Concerning', 13.33, Colors.yellowAccent),
                                    GaugeSegment('Over emitting', 20, Colors.red),

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
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/sarugby.png"),
                          color: Colors.green,
                        ),
                        Text('SOUTH AFRICAN RUGBY UNION', style: TextStyle(color: text_col),),

                      ],
                    )
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('CORPORATE LIQUIDATORS (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('CORPORATE LIQUIDATORS (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/corpliqidator.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/corpliqidator.png"),
                          color: Colors.green,
                        ),
                        Text('CORPORATE LIQUIDATORS (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('CHEMWES (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('CHEMWES (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/chemwes.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/chemwes.png"),
                          color: Colors.green,
                        ),
                        Text('CHEMWES (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('RICHARDS BAY TITANIUM (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('RICHARDS BAY TITANIUM (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/richardsbay.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/richardsbay.png"),
                          color: Colors.green,
                        ),
                        Text('RICHARDS BAY TITANIUM (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('AFMETCO (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('AFMETCO (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/afmetco.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/afmetco.png"),
                          color: Colors.green,
                        ),
                        Text('AFMETCO (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('PERNOD RICARD SOUTH AFRICA (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('PERNOD RICARD SOUTH AFRICA (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/pernod.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/pernod.png"),
                          color: Colors.green,
                        ),
                        Text('PERNOD RICARD SOUTH AFRICA (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('NESTLE (SOUTH AFRICA) (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('NESTLE (SOUTH AFRICA) (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/nestle.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/nestle.png"),
                          color: Colors.green,
                        ),
                        Text('NESTLE (SOUTH AFRICA) (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('WORLD HARDWOOD (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('WORLD HARDWOOD (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/worldhardwood.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/worldhardwood.png"),
                          color: Colors.green,
                        ),
                        Text('WORLD HARDWOOD (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('ISUZU MOTORS(SOUTH AFRICA)(PTY)(LTD)');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('ISUZU MOTORS(SOUTH AFRICA)(PTY)(LTD)', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/isuzu.jpeg")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/isuzu.jpeg"),
                          color: Colors.green,
                        ),
                        Text('ISUZU MOTORS(SOUTH AFRICA)(PTY)(LTD)', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('COUNTRY BIRD HOLDINGS (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('COUNTRY BIRD HOLDINGS (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/countrybird.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/countrybird.png"),
                          color: Colors.green,
                        ),
                        Text('COUNTRY BIRD HOLDINGS (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),



              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('KARAN BEEF FEEDLOT');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('KARAN BEEF FEEDLOT', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/karan_beef.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/karan_beef.png"),
                          color: Colors.green,
                        ),
                        Text('KARAN BEEF FEEDLOT', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('AFGRI GRAIN MARKETING (PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('AFGRI GRAIN MARKETING (PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/afgri.jpg")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/afgri.jpg"),
                          color: Colors.green,
                        ),
                        Text('AFGRI GRAIN MARKETING (PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('HOMECHOICE (PTY)LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('HOMECHOICE (PTY)LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/homechoice.png")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/homechoice.png"),
                          color: Colors.green,
                        ),
                        Text('HOMECHOICE (PTY)LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),



              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('TELKOM SA SOC LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('TELKOM SA SOC LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/telkom.jpg")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/telkom.jpg"),
                          color: Colors.green,
                        ),
                        Text('TELKOM SA SOC LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('VODACOM(PTY) LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('VODACOM(PTY) LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/vodacom.jpeg")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/vodacom.jpeg"),
                          color: Colors.green,
                        ),
                        Text('VODACOM(PTY) LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('WOOLWORTHS GROUP');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('WOOLWORTHS GROUP', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset('icons/woolworths.jpeg')),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage('icons/woolworths.jpeg'),
                          color: Colors.green,
                        ),
                        Text('WOOLWORTHS GROUP', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('MR PRICE GROUP LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('MR PRICE GROUP LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/mrprice.jpeg")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/mrprice.jpeg"),
                          color: Colors.green,
                        ),
                        Text('MR PRICE GROUP LTD', style: TextStyle(color: text_col),),

                      ],
                    )),
              ),


              const SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 50,
                width: 500,

                child: ElevatedButton(onPressed: (){
                  showModalBottomSheet(context: context, builder: (context) {

                    String compSummary = getCompInfo('SHOPRITE CHECKERS (PTY)LTD');
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                        child:Column(
                          children:  [
                            const Text('SHOPRITE CHECKERS (PTY)LTD', style: TextStyle(fontSize: 20, ),),
                            SizedBox(
                                height: 100,
                                width: 500,
                                child: Image.asset("icons/shoprite_checkers.jpeg")),
                            Text(compSummary),
                          ],
                        ) ,

                      ),
                    );
                  });
                },
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Row(
                      children:  const [
                        ImageIcon(
                          AssetImage("icons/shoprite_checkers.jpeg"),
                          color: Colors.green,
                        ),
                        Text('SHOPRITE CHECKERS (PTY)LTD', style: TextStyle(color: text_col),),

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

    var revenue2021 = rev2021[companyList.indexOf(compName,0)];

    //2020 revenue
    var revenue2020 = rev2020[companyList.indexOf(compName,0)];

    //Comparing the revenue
    var difference = revenue2021 - revenue2020;

    //Check if the difference is a loss or profit
    if (difference <0) {
      profit = "loss ";
    }
    else {
      profit = "profit";
    }
    scopeValue2021 = combinedScope2021[companyList.indexOf(compName,0)].toDouble();
    scopeValue2020 = combinedScope2020[companyList.indexOf(compName,0)].toDouble();

    summary = "\n2021 Revenue = R$revenue2021 million\n "
        "\n2020 Revenue = R$revenue2020 million \n"
        "\nThe company made a $profit of R$difference million";

    return summary;
  }
}