import 'package:flutter/material.dart';
import 'package:myapp/companies.dart';
import 'package:myapp/hotel.dart';
import 'package:myapp/main.dart';
import 'package:myapp/page1.dart';
import 'package:myapp/page2.dart';
import 'package:myapp/profile.dart';
import 'package:myapp/services/user-data-model.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
   int _currentIndex = 0;
  static const List<Widget> _options = <Widget>[
    Companies(), Page1(),Profile()];
  void _onItemTap(int index) {
    setState(() {
      int _currentIndex = 0;
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _options.elementAt(_selectedIndex),
        ),
      bottomNavigationBar: Container(
        width: 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.white, spreadRadius: 15, blurRadius: 8),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: Colors.blueAccent,
              currentIndex: _currentIndex,
              selectedIconTheme: IconThemeData(
                color: Colors.blue[900],
                size: 40,
              ),
              unselectedIconTheme:
              const IconThemeData(color: Colors.white, size: 35),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  title: Text(" History"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Emails"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile"),
                )
              ],
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.white,
              onTap: _onItemTap,
            ),
          )),

    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      selectedItemColor: Colors.blue;
    });
  }
}

