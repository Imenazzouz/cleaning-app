import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
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
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height * 0.81,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: [
              Text(
                'Last Name',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your last name'),
              ),
              Text(
                'First Name',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your first name'),
              ),
              Text(
                'Phone number',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                ),
              ),
              Text(
                'Address',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              TextField(
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your address',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.lightBlue,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
              ),
              TextField(
                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enabled decoration text ...",
              )),
              Text(
                'Region',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Region'),
              ),
              Text(
                'City',
                style: TextStyle(
                    fontFamily: 'Poppins', fontWeight: FontWeight.w600),
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your last city'),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueAccent),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('Confirm Order'),
                ),
              )
            ],
          ),
        ),
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
            BoxShadow(
              color: Colors.white,
              spreadRadius: 15,
              blurRadius: 9,
            )
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
