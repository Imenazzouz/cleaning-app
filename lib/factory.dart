import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Factory extends StatefulWidget {
  const Factory({Key? key}) : super(key: key);

  @override
  _FactoryState createState() => _FactoryState();
}

class _FactoryState extends State<Factory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ServicePick(),
      ),
      bottomNavigationBar: Bottombar(),
    );
  }
}

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 15, blurRadius: 9,)
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
            currentIndex: this.selectedIndex,
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
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ));
  }
}

class ServicePick extends StatefulWidget {
  const ServicePick({Key? key}) : super(key: key);

  @override
  _ServicePickState createState() => _ServicePickState();
}

class _ServicePickState extends State<ServicePick> {
  @override
  bool _hasBeenPressedLH = false;
  bool _hasBeenPressedWind = false;
  bool _hasBeenPressedFloor = false;
  bool _hasBeenPressedFurn = false;
  bool _hasBeenPressedMaid = false;
  bool _hasBeenPressedStaff = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Cleaning master',
          style: TextStyle(
              fontSize: 17.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'pick your services',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey,
                              fontFamily: 'Poppins'),
                        ),
                        Image.asset(
                          'assets/3.jpg',
                          height: 140,
                          width: 170,
                        )
                      ]),
                  FlatButton(
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _hasBeenPressedMaid = !_hasBeenPressedMaid;
                      });
                    },
                    child: Container(
                      child: Row(children: <Widget>[
                        Text(
                          "Disinfection",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                              _hasBeenPressedMaid
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              color: _hasBeenPressedMaid
                                  ? Colors.green
                                  : Colors.blueGrey),
                        )
                      ]),
                      margin: const EdgeInsets.only(bottom: 10.0),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _hasBeenPressedStaff = !_hasBeenPressedStaff;
                      });
                    },
                    child: Container(
                      child: Row(children: <Widget>[
                        Text(
                          "staff",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins'),
                        ),
                        Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(
                                _hasBeenPressedStaff
                                    ? Icons.check_circle_rounded
                                    : Icons.check_circle_outline_rounded,
                                color: _hasBeenPressedStaff
                                    ? Colors.green
                                    : Colors.blueGrey))
                      ]),
                      margin: EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  FlatButton(
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/stall.png',
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            'Rooms',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(width: 140),
                          Icon(
                              _hasBeenPressedLH
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              color: _hasBeenPressedLH
                                  ? Colors.green
                                  : Colors.blueGrey)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[100],
                          border: Border.all(color: Colors.blue)),
                    ),
                    onPressed: () {
                      setState(() {
                        _hasBeenPressedLH = !_hasBeenPressedLH;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/windows.png',
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            'Windows',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(width: 120),
                          Icon(
                              _hasBeenPressedWind
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              color: _hasBeenPressedWind
                                  ? Colors.green
                                  : Colors.blueGrey)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[100],
                          border: Border.all(color: Colors.blue)),
                    ),
                    onPressed: () {
                      setState(() {
                        _hasBeenPressedWind = !_hasBeenPressedWind;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/floor.png',
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            'Floor',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(width: 165),
                          Icon(
                              _hasBeenPressedFloor
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              color: _hasBeenPressedFloor
                                  ? Colors.green
                                  : Colors.blueGrey)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[100],
                          border: Border.all(color: Colors.blue)),
                    ),
                    onPressed: () {
                      setState(() {
                        _hasBeenPressedFloor = !_hasBeenPressedFloor;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    child: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'images/furniture.png',
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            'Furniture',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Poppins'),
                          ),
                          SizedBox(width: 120),
                          Icon(
                              _hasBeenPressedFurn
                                  ? Icons.check_circle_rounded
                                  : Icons.check_circle_outline_rounded,
                              color: _hasBeenPressedFurn
                                  ? Colors.green
                                  : Colors.blueGrey)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue[100],
                          border: Border.all(color: Colors.blue)),
                    ),
                    onPressed: () {
                      setState(() {
                        _hasBeenPressedFurn = !_hasBeenPressedFurn;
                      });
                    },
                  ),
                  SizedBox(
                    height: 0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}