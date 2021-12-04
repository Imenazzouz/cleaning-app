import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int selectedIndex = 0;
  int _count = 0;
  List<String> _listImages = [
    "assets/a.jpg",
    "assets/b.jpg",
    "assets/c.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text('Cleaning master', style : TextStyle(
            fontSize: 17.0,fontFamily: 'Poppins', fontWeight: FontWeight.w600,letterSpacing: 1.0,color: Colors.white),),
        centerTitle: true,

        actions: <Widget>[
          IconButton(
            icon:

            Icon(

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
      body:


      Container(

        decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius:  BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
          child: Column(


            children: [

                        Padding(
                          padding: const EdgeInsets.only( top: 10.0),
                          child: Text('heyy  !',
                           style : TextStyle(
                               fontSize: 17.0,fontFamily: 'Poppins', fontWeight: FontWeight.w600,letterSpacing: 1.0,color: Colors.black),
                   ),
                        ),

              Padding(

                padding: const EdgeInsets.fromLTRB(0.0,0.0,150.0,50.0),
                child: Container(

                  child: Text('Pick a service please',
                  style : TextStyle(
                      fontSize: 15.0,fontFamily: 'Poppins', fontWeight: FontWeight.w600,letterSpacing: 1.0,color: Colors.grey),
                  ),
                ),

              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex:1,
                    child: FlatButton(
                 child:
                Container(
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
                      child:
                      Container(
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
              SizedBox(height: 10.0 ,),
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0,0.0,10.0,5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company',style : TextStyle(
                fontSize: 15.0,fontFamily: 'Poppins'),
                ),
                SizedBox(width: 120,),
                Text('Hospital',style : TextStyle(
                    fontSize: 15.0,fontFamily: 'Poppins'),
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
                  child:
                  Container(
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
                  child:

                  Container(
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
              SizedBox(height: 7.0 ,),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,0.0,10.0,0.0),
                child: Row(
                  children: [
                    Text('Home',style : TextStyle(
                    fontSize: 15.0,fontFamily: 'Poppins'),
                    ),
                    SizedBox(width: 143),
                    Text('Factory',style : TextStyle(
                        fontSize: 15.0,fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 7.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: FlatButton(
                      child:

                      Container(
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
                      child:
                      Container(
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
                        Navigator.pushNamed(context, '/hotel' );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0 ,),
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,0.0,10.0,.0),
                child: Row(
                  children: [
                    Text('Restaurant',style : TextStyle(
                    fontSize: 15.0,fontFamily: 'Poppins'),
                    ),
                    SizedBox(width: 120,),
                    Text('Hotel',style : TextStyle(
                        fontSize: 15.0,fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
            ],


          ),
        ),
      ),








        bottomNavigationBar: Container(
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
                backgroundColor : Colors.blueAccent,
                currentIndex: this.selectedIndex,
                selectedIconTheme: IconThemeData (
                  color: Colors.blue[900],

                  size: 40,
                ),
                unselectedIconTheme: const IconThemeData (
                    color: Colors.white,
                    size: 35
                ),
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
            )
        ),
    );

  }
}