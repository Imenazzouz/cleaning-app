import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
CompanyItem choosenCompany = CompanyItem(title: 'none', image: '', id: 0);

class ChooseCompany extends StatefulWidget {
  const ChooseCompany({Key? key}) : super(key: key);

  @override
  _ChooseCompanyState createState() => _ChooseCompanyState();
}

class _ChooseCompanyState extends State<ChooseCompany> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('This service is provided by',
                      textStyle: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0,
                          color: Colors.blue),
                      speed: Duration(milliseconds: 200)),
                ],
                isRepeatingAnimation: false,
                displayFullTextOnTap: true,
              ),
              CompaniesStream(),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                child: ElevatedButton(
                  onPressed: () {
                    print(choosenCompany.title);
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
            ],
          ),
        ),
      ),
    );
  }
}

class CompaniesStream extends StatefulWidget {
  const CompaniesStream({Key? key}) : super(key: key);

  @override
  State<CompaniesStream> createState() => _CompaniesStreamState();
}

class _CompaniesStreamState extends State<CompaniesStream> {
  @override
  int selectedIndex = 0;
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('companies').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final companies = snapshot.data!.docs;
            List<CompanyItem> companyItems = [];
            for (var company in companies) {
              final companyText = company.get('name');
              final companyImage = company.get('image');
              final companyId = company.get('id');
              final companyItem = CompanyItem(
                title: companyText,
                image: companyImage,
                id: companyId,
              );
              companyItems.add(companyItem);
            }
            return Expanded(
                child: ListView.builder(
              itemCount: companyItems.length,
              itemBuilder: (context, index) {
                return (InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        choosenCompany = companyItems[selectedIndex];
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  companyItems[index],
                                  Icon(Icons.check_circle_outlined,
                                      color: selectedIndex == index
                                          ? Colors.green
                                          : Colors.grey),
                                ],
                              ),
                            )))));
              },
            ));
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        });
  }
}

class CompanyItem extends StatefulWidget {
  const CompanyItem({
    required this.title,
    required this.image,
    this.description = '',
    required this.id,
  });
  final String image;
  final String title;
  final String description;
  final int id;

  @override
  State<CompanyItem> createState() => _CompanyItemState();
}

class _CompanyItemState extends State<CompanyItem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    int selectedIndex = 1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                '${widget.image}',
                height: screenSize.height * 0.2,
                width: screenSize.width * 0.7,
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.005),
                child: Text(
                  widget.title,
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
