
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Studentdata extends StatelessWidget {
  final String name,regno,dept,year,reason,time;
  final Uint8List? image;

  Studentdata({ Key? key,
    required this.image,
    required this.name,
    required this.regno,
    required this.dept,
    required this.year,
    required this.reason,
    required this.time}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('STUDENT DATA', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Handle search button press
              print('Search');
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            if (image != null && image!.isNotEmpty)
            Container(height: 250, // Set the desired height for the image
                      width: 250, // Set the desired width for the image
                      child: Image.memory(image!),
                    )
            else
              Container(),
            Text('Name: ${name}'),
            Text('RegNo: ${regno}'),
            Text('Department: ${dept}'),
            Text('Year: ${year}'),
            Text('Reason: ${reason}'),
            Text('Time: ${time}'),
            ElevatedButton(onPressed: (){

            },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Change the button's background color
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Change the button's text color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 65, vertical: 15)), // Change the button's padding
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder( // Change the button's border shape
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              child: Text(
                'CONFIRM',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
