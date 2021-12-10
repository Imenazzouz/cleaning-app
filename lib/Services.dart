import 'package:flutter/material.dart';
import 'package:myapp/Profile.dart';
import 'package:myapp/companies.dart';
import 'package:myapp/nard.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Colors.blue,
      appBar: AppBar(
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
              Icons.notifications,
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
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height * 0.85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Text(
                  'Heyy  !',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 150.0, 50.0),
                child: Container(
                  child: Text(
                    'Pick a service please',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                        color: Colors.grey),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/6.jpg',
                            fit: BoxFit.fill,
                            width: 220.0,
                            height: 115.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/company');
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/5.jpg',
                            fit: BoxFit.fill,
                            width: 250.0,
                            height: 115.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/hospital');
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 10.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.009),
                        child: Text(
                          'Company',
                          style:
                              TextStyle(fontSize: 15.0, fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.35,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.009),
                          child: Text(
                            'Hospital',
                            style: TextStyle(
                                fontSize: 15.0, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/4.jpg',
                            fit: BoxFit.fill,
                            width: 250.0,
                            height: 115.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/page2');
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/3.jpg',
                            fit: BoxFit.fill,
                            width: 250.0,
                            height: 115.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/factory');
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 10.0, 0.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.06,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.009),
                      child: Text(
                        'Home',
                        style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.38,
                    ),
                    Text(
                      'Factory',
                      style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/2.jpg',
                            fit: BoxFit.fill,
                            width: 250.0,
                            height: 115.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/restaurant');
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.blueAccent,
                              width: 1,
                            )),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/1.jpg',
                            fit: BoxFit.fill,
                            width: 250.0,
                            height: 115.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/hotel');
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 0.0, 10.0, .0),
                child: Row(
                  children: [
                    SizedBox(width: screenSize.width * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.009),
                      child: Text(
                        'Restaurant',
                        style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.35,
                    ),
                    Text(
                      'Hotel',
                      style: TextStyle(fontSize: 15.0, fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}