import 'package:flutter/material.dart';
import 'package:myapp/services/auth.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/Services.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  void _showRatingDialog() {
    // actual store listing review & rating
    void _rateAndReviewApp() async {
      // refer to: https://pub.dev/packages/in_app_review
      final _inAppReview = InAppReview.instance;

      if (await _inAppReview.isAvailable()) {
        print('request actual review from store');
        _inAppReview.requestReview();
      } else {
        print('open actual store listing');
        // TODO: use your own store ids
        _inAppReview.openStoreListing(
          appStoreId: '<your app store id>',
          microsoftStoreId: '<your microsoft store id>',
        );
      }
    }

    final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        _firestore.collection('ratings').add({
          'uid': loggedInUser.uid,
          'rating': '${response.rating}',
          'comment': '${response.comment}'
        });
        print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }

  final _firestore = FirebaseFirestore.instance;

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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'poppins',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'poppins',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/page1')},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'poppins',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
            onTap: () => {Navigator.of(context).pushNamed('/profile')},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text(
              'Feedback',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'poppins',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
            onTap: () => {_showRatingDialog()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'poppins',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
            onTap: () {
              AuthenticationHelper().signOut();
              Navigator.of(context).pushNamed('/signin');
            },
          ),
        ],
      ),
    );
  }
}
