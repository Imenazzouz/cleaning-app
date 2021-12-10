import 'package:flutter/material.dart';
import 'package:myapp/Location.dart';

class ChooseCompany extends StatefulWidget {
  const ChooseCompany({Key? key}) : super(key: key);

  @override
  _ChooseCompanyState createState() => _ChooseCompanyState();
}

class _ChooseCompanyState extends State<ChooseCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/page1');
          },
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
      body: SingleChildScrollView(child: ProvidedBy()),
    );
  }
}

class ProvidedBy extends StatefulWidget {
  const ProvidedBy({Key? key}) : super(key: key);

  @override
  _ProvidedByState createState() => _ProvidedByState();
}

class _ProvidedByState extends State<ProvidedBy> {
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
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(children: [
        Text(
          'This service is provided by:',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenSize.height * 0.025,
              fontWeight: FontWeight.w500,
              color: Colors.blue[700]),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: _listImages.length,
          itemBuilder: (BuildContext Context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.15,
                  vertical: screenSize.height * 0.015),
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(30)),
                  height: screenSize.height * 0.25,
                  child: Column(
                    children: [
                      Image.asset(
                        _listImages[index]['image'],
                        height: screenSize.height * 0.2,
                        width: screenSize.width * 0.7,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: screenSize.height * 0.005),
                        child: Text(
                          _listImages[index]['text'],
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            child: Text('Confirm'),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                primary: Colors.blue[500],
                padding: EdgeInsets.symmetric(
                    vertical: screenSize.height * 0.02,
                    horizontal: screenSize.width * 0.15),
                textStyle: TextStyle(fontFamily: 'Poppins')),
          ),
        )
      ]),
    );
  }
}
