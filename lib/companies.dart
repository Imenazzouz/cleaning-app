import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  List _listImages = [
    {
      'image': "assets/lg.png",
      'text': 'Cleaning services tn',
    },
    {
      'image': "assets/logo.png",
      'text': 'General Service Company',
    },
    {'image': "assets/logo1.png", 'text': 'ZNH', 'description': ''},
    {
      'image': "assets/logo-carthago-nettoyage.png",
      'text': 'Carthago Nettoyage',
    },
    {
      'image': "assets/logo-h2s-final-2-.png",
      'text': 'Hygiene Surfaces and services',
    }
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'Companies list ',
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
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: screenSize.height * 0.8,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: _listImages
                  .map((item) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width * 0.08),
                        child: Container(
                          child: Center(
                              child: Column(
                            children: [
                              Image.asset(
                                item['image'],
                                fit: BoxFit.fitWidth,
                                width: screenSize.width,
                                height: screenSize.height * 0.3,
                              ),
                              Text(
                                item['text'],
                                style: TextStyle(
                                    fontSize: screenSize.height * 0.02,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue[900]),
                              ),
                            ],
                          )),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
