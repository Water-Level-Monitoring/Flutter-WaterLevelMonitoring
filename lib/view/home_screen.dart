//home_screen
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double percentTangki1;
    double percentTangki2;
    percentTangki1 = 90;
    percentTangki2 = 70;

    double visual1 = percentTangki1 / 100;
    double visual2 = percentTangki2 / 100;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Water Level',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout_sharp),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 35,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            // CARD ATAS
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: LiquidLinearProgressIndicator(
                        value: visual1,
                        valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                        backgroundColor: Colors.indigo,
                        borderRadius: 15,
                        borderWidth: 5.0,
                        borderColor: Colors.indigo,
                        direction: Axis.vertical,
                        center: Text(
                          "${percentTangki1}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('TANGKI 1',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            //CARD BAWAH
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: LiquidLinearProgressIndicator(
                        value: visual2,
                        valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                        backgroundColor: Colors.indigo,
                        borderRadius: 15,
                        borderWidth: 5.0,
                        borderColor: Colors.indigo,
                        direction: Axis.vertical,
                        center: Text(
                          "${percentTangki2}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('TANGKI 1',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
