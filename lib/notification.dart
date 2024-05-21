
import 'package:flutter/material.dart';

class ntify extends StatefulWidget {
  const ntify({Key? key}) : super(key: key);

  @override
  State<ntify> createState() => _ntifyState();
}

class _ntifyState extends State<ntify> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to indicate that you've handled the back button press
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification'),
          // Add a leading widget for the back button
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Pop the current route off the navigation stack
              Navigator.popUntil(context, ModalRoute.withName('/MyHomePage'));
            },
          ),
        ),
        body: Center(
          child: Text('Here there is no notification'),
        ),
      ),
    );
  }
}
