//import 'package:bridgeup/piechart.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'constants/constants.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  gotoSecondActivity(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(// <-- STACK AS THE SCAFFOLD PARENT
        children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage("background/background.jpg"), // <-- BACKGROUND IMAGE
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              title: const Text(
                'ABSA Green Deals',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: green),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //const Center(child: Text('Welcome to ABSA Green Deal')),
              Container(
                  alignment: Alignment.center,
                  color: barchart[4],
                  padding: const EdgeInsets.all(30.0),
                  child: const SizedBox(
                      height: 100,
                      width: 700,
                      child: Text(
                        'By the year 2030 ABSA aims to transition into making more green deals as an attempt to uphold\n the Global Development Goals proposed by the United Nations and promoting Sustainability overall.',
                        style: TextStyle(
                          //fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ))),
              /* ElevatedButton(
            onPressed: () {},
            style: ButtonStyle (backgroundColor: MaterialStateProperty.all<Color>(Colors.red) ),
            //

            child: const Text('click me'),
          ),*/
            ],
          ),
          floatingActionButton: SizedBox(
            height: 100,
            width: 100,
            child: FloatingActionButton(
              splashColor: Colors.green,
              hoverColor: Colors.amber,
              backgroundColor: green,
              onPressed: () {
                gotoSecondActivity(context);
              },
              child: const Text('View Stats'),
            ),
          )),
    ]);
  }
}
