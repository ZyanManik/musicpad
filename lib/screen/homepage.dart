import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:musicpad/page/musicrecord.dart';
import 'package:musicpad/page/settings.dart';
import 'package:musicpad/screen/musicblogs.dart';
import 'package:musicpad/screen/splash.dart';

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scaffoldkey = GlobalKey<ScaffoldMessengerState>();
  
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: const Splash(),
        builder: EasyLoading.init(),
        scaffoldMessengerKey: _scaffoldkey,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, AdaptiveThemeMode? savedThemeMode});

  @override
  State<HomePage> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Musicblogs(),
    Musicrecord(),
    Settings()
  ];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0), topRight: Radius.circular(0)),
          color: Color.fromARGB(255, 35, 60, 80),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 35, 60, 80),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(255, 7, 106, 187),
            padding: const EdgeInsets.all(10),
            onTabChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            tabs: const [
              GButton(
                //rippleColor: Color.fromARGB(255, 255, 17, 1),
                //hoverColor: Color.fromARGB(255, 255, 17, 1),
                gap: 8,
                icon: Icons.home,
                iconSize: 25,
                text: 'Home',
                textColor: Colors.white,
                textSize: 18,
              ),
              GButton(
                //rippleColor: Color.fromARGB(255, 255, 17, 1),
                //hoverColor: Color.fromARGB(255, 255, 17, 1),
                gap: 8,
                iconSize: 25,
                icon: Icons.audio_file_outlined,
                text: 'Audio',
                textColor: Colors.white,
                textSize: 18,
              ),
              GButton(
                // rippleColor: Color.fromARGB(255, 255, 17, 1),
                // hoverColor: Color.fromARGB(255, 255, 17, 1),
                gap: 8,
                iconSize: 25,
                icon: Icons.settings,
                text: 'Settings',
                textColor: Colors.white,
                textSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
