import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:musicpad/widget/drumkit.dart';
import 'package:musicpad/widget/elec_drum.dart';
import 'package:musicpad/widget/tabla.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Musicblogs extends StatefulWidget {
  const Musicblogs({super.key});

  @override
  State<Musicblogs> createState() => _CarousalState();
}

class _CarousalState extends State<Musicblogs> {
  int currentindex = 0;

  List cont = [
    {
      "txt":
          "The drum is a member of the percussion group of musical instruments. In the Hornbostel-Sachs classification system, it is a membranophone. Drums consist of at least one membrane, called a drumhead or drum skin, that is stretched over a shell and struck, either directly with the player's hands, or with a percussion mallet, to produce sound. There is usually a resonant head on the underside of the drum.Drums are the world's oldest and most ubiquitous musical instruments, and the basic design has remained virtually unchanged for thousands of years."
    },
    {
      "txt":
          "A tabla is a pair of hand drums from the Indian subcontinent, that is somewhat similar in shape to the bongos. Since the 18th century, it has been the principal percussion instrument in Hindustani classical music, where it may be played solo, as an accompaniment with other instruments and vocals, and as a part of larger ensembles. It is frequently played in popular and folk music performances in India, Bangladesh, Afghanistan, Pakistan, Nepal and Sri Lanka. Tabla is a rhythmic instrument. The name tabla likely comes from tabl, the Arabic word for drum."
    },
    {
      "txt":
          "A DJ turntable is an indispensable tool for DJs, particularly prominent in hip-hop, electronic dance music (EDM), and turntablism. Central to its design is the platter, a rotating surface where vinyl records rest, allowing for precise control over playback speed. The choice between direct-drive and belt-drive motors is pivotal, with direct-drive favored for quick start-ups crucial in scratching and performance techniques. The tonearm, holding the stylus, tracks the vinyl grooves, and adjustments can be made for tracking force and height. Pitch control is pivotal for beatmatching, while features like start/stop buttons, cueing mechanisms, and pitch bend contribute to the DJ's command over playback. Some turntables boast reverse play capabilities, and torque settings, especially in direct-drive models, can be tailored to a DJ's preferences."
    },
    {"txt": ""},
    {"txt": ""},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
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
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 35, 60, 80),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              CarouselSlider(
                items: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        image: const DecorationImage(
                            image: AssetImage("assets/1.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DrumKit(),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        image: const DecorationImage(
                            image: AssetImage("assets/tabla.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Tabla(),
                          ));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        image: const DecorationImage(
                            image: AssetImage("assets/3.jpg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Elec_drum(),
                          ));
                    },
                  ),
                ],
                options: CarouselOptions(
                  autoPlayCurve: Curves.fastOutSlowIn,
                  height: 360.0,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  aspectRatio: 5.0,
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        currentindex = index;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedSmoothIndicator(
                activeIndex: currentindex,
                count: 3,
                curve: Curves.easeInOut,
                effect: const WormEffect(
                  dotHeight: 8.0,
                  dotWidth: 60.0,
                  dotColor: Colors.white,
                  activeDotColor: Colors.blue,
                  radius: 40,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: SingleChildScrollView(
                  child: ReadMoreText(
                    cont[currentindex]["txt"],
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
