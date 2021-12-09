
import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/signin.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  FirebaseAuth auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: 'poppins',letterSpacing: 1,fontWeight: FontWeight.w600),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                ),

          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome',
              style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'poppins',letterSpacing: 1,fontWeight: FontWeight.w600),

            ),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile',              style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'poppins',letterSpacing: 1,fontWeight: FontWeight.w600),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',              style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'poppins',letterSpacing: 1,fontWeight: FontWeight.w600),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback',              style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'poppins',letterSpacing: 1,fontWeight: FontWeight.w600),
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout',              style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'poppins',letterSpacing: 1,fontWeight: FontWeight.w600),
            ),
            onTap: () => {
            AuthenticationHelper().signOut()

    },
          ),
        ],
      ),
    );
  }
}