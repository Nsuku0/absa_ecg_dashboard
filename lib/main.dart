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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(30.0),
                  child: const SizedBox(
                      height: 120,
                      width: 700,
                      child: Text(
                        'Absa CIB Carbon Emissions Dashboard',
                        style: TextStyle(
                          //fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ))),
              SizedBox(
                height: 175,
                width: 600,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    color: Colors.white70,
                    padding: const EdgeInsets.all(20.0),
                    child: const SizedBox(
                      width: 550,
                      height: 200,
                      child: Text(
                        'By the year 2030, Absa aims to transition into making more sustainable deals as an attempt to uphold the Global Development Goals proposed by the United Nations and play a part in securing our future.\nThis project aims to encourage analysis of publically-available data to create a green standard for lending practices.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(240, 90, 120, 1),
                        ),
                      ),
                    )),
              )
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
