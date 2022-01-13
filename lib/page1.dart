import 'package:flutter/material.dart';
import 'package:myapp/Location.dart';
import 'package:myapp/Profile.dart';
import 'package:myapp/Services.dart';
import 'package:myapp/edit_profile.dart';
import 'package:myapp/home_screen1.dart';
import 'package:myapp/nard.dart';
import 'ProvidingCompanies.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int currentIndex = 0;
  final screens = [Services(), ProfilePage(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Colors.blue,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        iconSize: screenSize.height * 0.04,
        selectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Colors.blue[500],
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'history'),
        ],
      ),
    );
  }
}
