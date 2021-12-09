import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
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
          title: Text('Companies list ', style : TextStyle(
              fontSize: 17.0,fontFamily: 'Poppins', fontWeight: FontWeight.w600,letterSpacing: 1.0,color: Colors.white),),
          centerTitle: true,

          actions: <Widget>[
            IconButton(
              icon:
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.blueAccent,
          elevation: 0.0,

        ),
        body:
        Container(
               decoration:  const BoxDecoration(
                         color: Colors.white,
                          borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                         topRight: Radius.circular(40.0),),),
          child:
             Column(
               children: [
                 CarouselSlider(
                   options: CarouselOptions(
                     height: 200,
                     aspectRatio: 16/9,
                     viewportFraction: 0.8,
                     initialPage: 0,
                     enableInfiniteScroll: true,
                     reverse: false,
                     autoPlay: false,
                     autoPlayInterval: Duration(seconds: 3),
                     autoPlayAnimationDuration: Duration(milliseconds: 800),
                     autoPlayCurve: Curves.fastOutSlowIn,
                     enlargeCenterPage: true,
                     scrollDirection: Axis.horizontal,),
                   items: _listImages.map((i) {
                     return Builder(
                       builder: (BuildContext context) {
                         return Container(

                             width: MediaQuery.of(context).size.width,
                             margin: EdgeInsets.symmetric(horizontal: 5.0),
                             decoration: BoxDecoration(
                                 color: Colors.amber
                             ),

                         );
                       },
                     );
                   }).toList(),
                 ),



                 Text('choose the age of the maid'),

                 TextField(
                   decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         ),
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.blue,
                         ),
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                       hintText: 'Enter number'),
                 ),



               ],
             ),
        ),
    );
  }
}

