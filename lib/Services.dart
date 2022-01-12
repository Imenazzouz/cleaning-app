import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:myapp/nard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

late String docId = _firestore.collection('reservation').id;
late User loggedInUser;

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    getCurrentData();
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  void getCurrentData() async {
    var test = false;
    final data = await _firestore.collection('reservation').get();
    for (var reservation in data.docs) {
      if ((reservation.data()['uid'] == loggedInUser.uid) &
          (reservation.data()['payed'] == false)) {
        docId = reservation.id;
        test = true;
      }
    }
    if (test == false) {
      _firestore.collection('reservation').add({
        'uid': loggedInUser.uid,
        'Disinfection': false,
        'Service to': '',
        'company': '',
        'companyImage': '',
        'date': '',
        "firstName": '',
        'floor': '',
        'furniture': '',
        'lastName': '',
        'payed': false,
        'phoneNumber': '',
        'region': '',
        'rooms': '',
        'staff': '',
        'windows': ''
      }).then((docRef) {
        docId = docRef.id;
      });
      print(test);
    }
  }

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Clean master',
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
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Welcome to Clean Master',
                        textStyle: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                            color: Colors.black),
                        speed: const Duration(milliseconds: 200)),
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 150.0, 50.0),
                child: Container(
                  child: AnimatedTextKit(animatedTexts: [
                    TypewriterAnimatedText('Pick a service please',
                        textStyle: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                            color: Colors.grey),
                        speed: const Duration(milliseconds: 200)),
                  ]),
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
                          child: Hero(
                            tag: 'company',
                            child: Image.asset(
                              'assets/6.jpg',
                              fit: BoxFit.fill,
                              width: 220.0,
                              height: 115.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _firestore.collection('reservation').doc(docId).set(
                            {'Service to': 'company'}, SetOptions(merge: true));

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
                          child: Hero(
                            tag: 'hospital',
                            child: Image.asset(
                              'assets/5.jpg',
                              fit: BoxFit.fill,
                              width: 250.0,
                              height: 115.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _firestore.collection('reservation').doc(docId).set({
                          'uid': '${loggedInUser.uid}',
                          'serviceTo': 'hospital'
                        }, SetOptions(merge: true));
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
                          child: Hero(
                            tag: 'home',
                            child: Image.asset(
                              'assets/4.jpg',
                              fit: BoxFit.fill,
                              width: 250.0,
                              height: 115.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _firestore.collection('reservation').doc(docId).set(
                            {'uid': '${loggedInUser.uid}', 'serviceTo': 'home'},
                            SetOptions(merge: true));
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
                          child: Hero(
                            tag: 'factory',
                            child: Image.asset(
                              'assets/3.jpg',
                              fit: BoxFit.fill,
                              width: 250.0,
                              height: 115.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _firestore.collection('reservation').doc(docId).set({
                          'uid': '${loggedInUser.uid}',
                          'serviceTo': 'factory'
                        }, SetOptions(merge: true));
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
                          child: Hero(
                            tag: 'restaurant',
                            child: Image.asset(
                              'assets/2.jpg',
                              fit: BoxFit.fill,
                              width: 250.0,
                              height: 115.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _firestore.collection('reservation').doc(docId).set({
                          'uid': '${loggedInUser.uid}',
                          'serviceTo': 'restaurant'
                        }, SetOptions(merge: true));
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
                          child: Hero(
                            tag: 'hotel',
                            child: Image.asset(
                              'assets/1.jpg',
                              fit: BoxFit.fill,
                              width: 250.0,
                              height: 115.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _firestore.collection('reservation').doc(docId).set({
                          'uid': '${loggedInUser.uid}',
                          'serviceTo': 'hotel'
                        }, SetOptions(merge: true));
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
