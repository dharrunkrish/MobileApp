

import 'package:atoz/main.dart';
import 'package:flutter/material.dart';


  class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage>createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {


  bool isChecked = false;
  String login = '';
  String password = '';

  String adminUsername = 'Dharrun';
  String adminPassword = 'abcd';

  void checkCredentials(String enteredUsername, String enteredPassword) {
    if (enteredUsername == adminUsername && enteredPassword == adminPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Adminpage(adminUsername: enteredUsername),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
             Navigator.of(context).pushNamedAndRemoveUntil('/MyHomePage', (route) => false);
          },
        ),
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
      body: Container(
        decoration: const BoxDecoration(
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    hintText: 'login',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      login = value;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    hintText: 'password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'confirm',
                        style: TextStyle(fontSize: 20.0),
                      ),

                    ]),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20.0),
                  backgroundColor: Colors.green,
                ),
                onPressed: ()  {
                  // Handle search button press
                  print('yes');
                  checkCredentials(login,password);
                  },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 50.0,
                  ),
                  child: Text('login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Adminpage extends StatelessWidget {
  final String adminUsername;

  const Adminpage({Key? key, required this.adminUsername}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Welcome, $adminUsername'),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(120.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Secondpage()),
                    );
                  },
                  child: Text('Create Pass'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  const bool passCreated = true;
  runApp(MaterialApp(
    routes: {
      '/': (context) => const MyHomePage(passCreated: passCreated),
      '/Adminpage': (context) => const Adminpage(adminUsername: '',),
    },
  ));
}

