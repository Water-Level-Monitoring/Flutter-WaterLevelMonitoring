
import 'package:flutter/material.dart';
import 'package:flutter_waterlevel/controller/home_controller.dart';
import 'package:flutter_waterlevel/utils/snackbar.dart';
import 'package:flutter_waterlevel/view/login_screen.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController data = HomeController();
  void delUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text(
          'Water Level',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _showAlertDialog(context);
            },
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
                        child: StreamBuilder<int>(
                          stream: data.getSensor1(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasData) {
                              final data = snapshot.data! / 28 * 100;
                              return LiquidLinearProgressIndicator(
                                value: snapshot.data! / 28,
                                valueColor:
                                    const AlwaysStoppedAnimation(Colors.blueAccent),
                                backgroundColor: Colors.indigo,
                                borderRadius: 15,
                                borderWidth: 5.0,
                                borderColor: Colors.indigo,
                                direction: Axis.vertical,
                                center: Text(
                                  "${data.toStringAsFixed(1)}%",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        )),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Tangki A',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
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
                      child: StreamBuilder<int>(
                        stream: data.getSensor2(),
                        builder:
                            ((BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasData) {
                            final data = snapshot.data! / 28 * 100;
                            return LiquidLinearProgressIndicator(
                              value: snapshot.data! / 28,
                              valueColor:
                                  const AlwaysStoppedAnimation(Colors.blueAccent),
                              backgroundColor: Colors.indigo,
                              borderRadius: 15,
                              borderWidth: 5.0,
                              borderColor: Colors.indigo,
                              direction: Axis.vertical,
                              center: Text(
                                "${data.toStringAsFixed(1)}%",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40),
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Tangki B',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
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

  Future<dynamic> _showAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18)),
              title: const Text('Logout'),
              content: const Text('Apakah anda yakin ingin logout?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Tidak')),
                TextButton(
                    onPressed: () {
                      delUser();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (route) => false);
                      snackbar('Logout Succes', context);
                    },
                    child: const Text('Ya')),
              ],
            ));
  }
}
