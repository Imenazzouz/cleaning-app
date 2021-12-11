import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    );
  }
}
