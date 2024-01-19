import 'package:flutter/material.dart';

class Musicrecord extends StatefulWidget {
  const Musicrecord({super.key});

  @override
  State<Musicrecord> createState() => _MusicState();
}

class _MusicState extends State<Musicrecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Row(
          children: [
            Text(
              'Musical',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            Text(
              '_Pad',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'greatvibes'),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 35, 60, 80),
      ),
    );
  }
}
