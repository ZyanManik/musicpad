import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class Elec_drum extends StatefulWidget {
  const Elec_drum({super.key});

  @override
  State<Elec_drum> createState() => _Elec_drumState();
}

class _Elec_drumState extends State<Elec_drum> {
  bool isclicked = false;

  List clrlist = [
    {
      "color": const Color.fromARGB(255, 209, 18, 4),
    },
    {
      "color": const Color.fromARGB(255, 3, 93, 166),
    },
    {
      "color": const Color.fromARGB(255, 3, 238, 11),
    },
    {
      "color": const Color.fromARGB(255, 250, 188, 0),
    },
    {
      "color": const Color.fromARGB(255, 3, 241, 126),
    },
    {
      "color": const Color.fromARGB(255, 167, 136, 25),
    },
    {
      "color": const Color.fromARGB(255, 217, 2, 255),
    },
    {
      "color": const Color.fromARGB(255, 243, 37, 37),
    },
    {
      "color": const Color.fromARGB(255, 82, 3, 96),
    },
    {
      "color": const Color.fromARGB(255, 135, 33, 33),
    },
    {
      "color": const Color.fromARGB(255, 45, 59, 142),
    },
    {
      "color": const Color.fromARGB(255, 8, 127, 143),
    },
  ];

  List record = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          children: [
            Text(
              'Elec_drum',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              '_Drum',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 17, 1),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 182, 181, 181),
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                record.add(3);
                print(record);
                isclicked = !isclicked;
              });
            },
            icon: const Icon(Icons.circle),
            color: isclicked ? Colors.red : Colors.white,
          )
        ],
      ),
      body: GridView.builder(
        itemCount: clrlist.length,
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1.0),
        itemBuilder: (context, index) => SizedBox(
          child: MaterialButton(
            onPressed: () async {
              final player = AudioPlayer();
              await player.play(AssetSource("DubstepClub${index + 1}.wav"));
            },
            splashColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  color: clrlist[index]["color"],
                  //  gradient: clrlist[index]['color'],
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                constraints: const BoxConstraints(
                    minWidth: 88.0,
                    minHeight: 36.0), // min sizes for Material buttons
                alignment: Alignment.center,
                child: null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
