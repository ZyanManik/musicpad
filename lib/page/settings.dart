import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key, AdaptiveThemeMode? savedThemeMode});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String values = '';
  var item = ['English'];
  List listitem = [
    {'English'}
  ];
  // ignore: non_constant_identifier_names
  final TextEditingController_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 60, 80),
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
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 18, right: 18),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Language'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // DropdownButton(items: listitem.map((e) => null), onChanged: onChanged)
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 104, 104),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(Icons.language_outlined,
                        color: Colors.white, size: 25),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Language',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 65,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 109, 104, 104),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dark_mode_outlined,
                          color: Colors.white, size: 25),
                    ],
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Dark Mode',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(width: 110),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        value: AdaptiveTheme.of(context).mode.isDark,
                        onChanged: (value) {
                          if (value) {
                            AdaptiveTheme.of(context).setDark();
                          } else {
                            AdaptiveTheme.of(context).setLight();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Rate My App'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RatingBar.builder(
                            minRating: 1,
                            itemBuilder: (context, i) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (value) {},
                          )
                        ],
                      ),
                      actions: [
                        TextButton(
                            style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge),
                            onPressed: () {
                              EasyLoading.show(status: 'Loading...');
                              EasyLoading.showSuccess('Thank you');

                              Navigator.of(context).pop();
                              EasyLoading.dismiss();
                            },
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 104, 104),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(Icons.thumb_up_alt_outlined,
                        color: Colors.white, size: 25),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Rate App',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Feedback'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [TextFormField()],
                      ),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle:
                                  Theme.of(context).textTheme.labelLarge),
                          onPressed: () async {
                            EasyLoading.show(status: 'Loading...');
                            EasyLoading.showSuccess('Thank you');
                            // EasyLoading.showSuccess('Thank You for your time!');
                            Navigator.of(context).pop();
                            EasyLoading.dismiss();
                          },
                          child: const Text(
                            'Done',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 104, 104),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(Icons.feedback_outlined,
                        color: Colors.white, size: 25),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Feedback',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 104, 104),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(Icons.feed_sharp, color: Colors.white, size: 25),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 109, 104, 104),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(Icons.error_outline, color: Colors.white, size: 25),
                    SizedBox(
                      width: 9,
                    ),
                    Text(
                      'Version',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
