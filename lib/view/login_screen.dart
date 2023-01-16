//test

import 'package:flutter/material.dart';
import 'package:flutter_waterlevel/utils/snackbar.dart';
import 'package:flutter_waterlevel/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _isObscure = ValueNotifier<bool>(true);
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  final adminUser = 'admin';
  final adminPass = 'admin123';

  void saveUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
  }

  void checkLogin(String user, String pass) {
    if (user == adminUser && pass == adminPass) {
      saveUser(user);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      snackbar('Login Success', context);
    } else {
      snackbar('Username or Password is incorrect', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 35, top: 130),
            child: const Text(
              'Welcome to\nWatery',
              style: TextStyle(fontSize: 34),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextField(
                          controller: _userController,
                          decoration: InputDecoration(
                              hintText: "Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ValueListenableBuilder(
                          valueListenable: _isObscure,
                          builder: (BuildContext context, dynamic value,
                              Widget? child) {
                            return TextField(
                              controller: _passController,
                              obscureText: value,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      _isObscure.value = !_isObscure.value;
                                    },
                                  ),
                                  // fillColor: Colors.grey.shade100,
                                  // filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.indigo),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              checkLogin(_userController.text.trim(),
                                  _passController.text.trim());
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
