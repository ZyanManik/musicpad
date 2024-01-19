//import 'package:adaptive_theme/src/adaptive_theme_mode.dart';
//import 'dart:html';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:musicpad/screen/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, AdaptiveThemeMode? savedThemeMode});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 60, 80),
      body: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/12.jpg"),
                          fit: BoxFit.cover),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 9, spreadRadius: 2, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Music_Pad",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "greatvibes"),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 300),
                  child: SpinKitSpinningLines(
                    size: 60,
                    color: Colors.white,
                    duration: Duration(milliseconds: 1000),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
