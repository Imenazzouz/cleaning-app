import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/bottomnav.dart';
import 'package:myapp/company.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ServicePick(),
      ),
      bottomNavigationBar:Navbar(),
    );
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
    var screenSize = MediaQuery.of(context).size;
    Column ServiceType(
        image1, image2, image3, image4, name1, name2, name3, name4) {
      return Column(
        children: <Widget>[
          FlatButton(
            child: Container(
              width: screenSize.width,
              child: Row(
                children: [
                  Container(
                    width: screenSize.width * 0.4,
                    child: Row(
                      children: [
                        Image.asset(
                          'images/$image1.png',
                          width: screenSize.height * 0.08,
                          height: screenSize.height * 0.08,
                        ),
                        Text(
                          '$name1',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.4),
                  Icon(
                      _hasBeenPressedLH
                          ? Icons.check_circle_rounded
                          : Icons.check_circle_outline_rounded,
                      color: _hasBeenPressedLH ? Colors.green : Colors.blueGrey)
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
            height: screenSize.height * 0.02,
          ),
          FlatButton(
            child: Container(
              child: Row(
                children: [
                  Container(
                    width: screenSize.width * 0.4,
                    child: Row(
                      children: [
                        Image.asset(
                          'images/$image2.png',
                          width: screenSize.height * 0.08,
                          height: screenSize.height * 0.08,
                        ),
                        Text(
                          '$name2',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.4),
                  Icon(
                      _hasBeenPressedWind
                          ? Icons.check_circle_rounded
                          : Icons.check_circle_outline_rounded,
                      color:
                          _hasBeenPressedWind ? Colors.green : Colors.blueGrey)
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
                  Container(
                    width: screenSize.width * 0.4,
                    child: Row(
                      children: [
                        Container(
                          width: screenSize.width * 0.35,
                          child: Row(
                            children: [
                              Image.asset(
                                'images/$image3.png',
                                width: screenSize.height * 0.08,
                                height: screenSize.height * 0.08,
                              ),
                              Text(
                                '$name3',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.4),
                  Icon(
                      _hasBeenPressedFloor
                          ? Icons.check_circle_rounded
                          : Icons.check_circle_outline_rounded,
                      color:
                          _hasBeenPressedFloor ? Colors.green : Colors.blueGrey)
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
                  Container(
                    width: screenSize.width * 0.4,
                    child: Row(
                      children: [
                        Image.asset(
                          'images/$image4.png',
                          width: screenSize.height * 0.08,
                          height: screenSize.height * 0.08,
                        ),
                        Text(
                          '$name4',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.4),
                  Icon(
                      _hasBeenPressedFurn
                          ? Icons.check_circle_rounded
                          : Icons.check_circle_outline_rounded,
                      color:
                          _hasBeenPressedFurn ? Colors.green : Colors.blueGrey)
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
      );
    }

    Row ServiceStaff(name1, name2) {
      return Row(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              setState(() {
                _hasBeenPressedMaid = !_hasBeenPressedMaid;
              });
            },
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '$name1',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          screenSize.width * 0.2,
                          screenSize.height * 0.01,
                          0,
                          screenSize.height * 0.01),
                      child: Icon(
                        _hasBeenPressedMaid
                            ? Icons.check_circle_rounded
                            : Icons.check_circle_outline_rounded,
                        color: _hasBeenPressedMaid
                            ? Colors.green
                            : Colors.blueGrey,
                      ),
                    )
                  ]),
              margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
          SizedBox(width: screenSize.width * 0.09),
          FlatButton(
            onPressed: () {
              setState(() {
                _hasBeenPressedStaff = !_hasBeenPressedStaff;
              });
            },
            child: Container(
              width: screenSize.width * 0.35,
              child: Row(children: <Widget>[
                Text(
                  "$name2",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins'),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(screenSize.width * 0.2,
                        screenSize.height * 0.01, 0, screenSize.height * 0.01),
                    child: Icon(
                        _hasBeenPressedStaff
                            ? Icons.check_circle_rounded
                            : Icons.check_circle_outline_rounded,
                        color: _hasBeenPressedStaff
                            ? Colors.green
                            : Colors.blueGrey))
              ]),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(30)),
            ),
          )
        ],
      );
    }

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
                          'assets/4.jpg',
                          height: 100,
                          width: 150,
                        )
                      ]),
                  FlatButton(
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                  )
                ],
              ),
              ServiceStaff('Maid', 'Staff'),
              ServiceType('stall', 'windows', 'floor', 'furniture', 'Rooms',
                  'Windows', 'floor', 'furniture')
            ],
          ),
        ),
      ),
    );
  }
}
