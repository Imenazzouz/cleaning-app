import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late PickedFile _imageFile = PickedFile("g");
  final ImagePicker picker= ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      backgroundColor: Colors.white,
      body:

      Container(

        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            )),

           child:
            
              Column(
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: imageProfile()
                  ),
                  SizedBox(height: 10),
                  Text('Username',
                    style: TextStyle(fontFamily: 'poppins',fontSize: 15,color: Colors.blue,fontWeight: FontWeight.w600),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top :10.0),
                    child: Container(
                      height: 70,


          child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('users').snapshots(),
                    builder:
                        (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Scaffold(

                          body:




                                  ListView(
                                  ),




                        );
                      }
                      return ListView(
                        children: snapshot.data!.docs.map((document) {
                          var username = document['username'];
                          var email = document['email'];

                          return Padding(
                            padding: const EdgeInsets.only(top : 0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  ),

                              child: Column(
                                children: <Widget>[
                                  Text(document['username'],style: TextStyle(fontFamily: 'poppins',fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600),
                                  ),
                                  Text('Email',style: TextStyle(fontFamily: 'poppins',fontSize: 15,color: Colors.blue,fontWeight: FontWeight.w600),),
                                  Text(document['email'],
                                    style: TextStyle(fontFamily: 'poppins',fontSize: 17,color: Colors.black,fontWeight: FontWeight.w600),

                                  ),

],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
        ),
                  ),
        SizedBox(height: 20),

        FlatButton(
          
          child: Text('Logout'),
          color: Colors.blueAccent,
          textColor: Colors.white,
          onPressed: () {},
        ),
                  SizedBox(height: 20),

                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                     Radius.circular(30.0)),

                  ),
                  child:
                      Column(
                        children: [
                          Text('About',style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              color: Colors.white),),
                          Text('2nd year ICT',style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              color: Colors.black),),
                          Text('Engineerinf student',style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                              color: Colors.black),),
                        ],
                      ),
                    ),
                  

                ],
              ),

      ),
    );
  }
Widget imageProfile(){
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("assets/profile.jpeg")
              : FileImage(File(_imageFile.path)) as ImageProvider,
        ),
        Positioned(
          bottom: 20,
            right: 20,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );

              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 25,
              ),
            ),
        )

      ],
    );
}

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}











