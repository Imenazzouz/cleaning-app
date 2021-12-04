import 'package:flutter/material.dart';
import 'package:myapp/Restaurant.dart';
import 'package:myapp/company.dart';
import 'package:myapp/factory.dart';
import 'package:myapp/hospital.dart';
import 'package:myapp/hotel.dart';
import 'package:myapp/items.dart';
import 'package:myapp/page1.dart';
import 'package:myapp/page2.dart';
import 'package:myapp/pay.dart';
import 'package:myapp/signin.dart';
import 'package:myapp/signup.dart';
import 'package:myapp/splash.dart';
import 'package:myapp/Location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Signin(),
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      title: 'Welcome Screen',
      routes: {
        '/home': (context) => WelcomeScreen(),
        '/signin': (context) => Signin(),
        '/signup': (context) => SignUp(),
        '/page2': (context) => Page2(),
        '/hospital': (context) => Hospital(),
        '/hotel': (context) => Hotel(),
        '/restaurant': (context) => Restaurant(),
        '/factory': (context) => Factory(),
        '/company': (context) => Company(),
        '/page1': (context) => Page1(),
        '/pay': (context) => Pay(),
        '/location': (context) => Location(),
      },
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map((item) => Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Flexible(
                flex: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    item['image'],
                    fit: BoxFit.fitWidth,
                    width: 300.0,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Flexible(
                flex: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: <Widget>[
                      Text(item['header'],
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              letterSpacing: 2.0,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black45,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                              height: 2.0)),
                      Text(
                        item['description'],
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            letterSpacing: 1.2,
                            fontSize: 16.0,
                            height: 1.3),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              )
            ],
          )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Color(0XFF256075)
                    : Color(0X0066FF).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0)),
          ));

  double currentPage = 0.0;
  final _pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                return slides[index];
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 600.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Center(
                child: FlatButton(
                  child: Text(
                    'Get Started !',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  textColor: Colors.black,
                  height: 45.0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
