import 'dart:typed_data';
import 'package:atoz/Adminpanel.dart';
import 'package:atoz/notification.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:atoz/img.dart';
import 'package:atoz/Studentdata.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MyHomePage(passCreated: true),
        '/Adminpage': (context) => const Adminpage(adminUsername: '',), // Define the Adminpage route here
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  final bool passCreated;

  const MyHomePage({Key? key, required this.passCreated}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? image;
  void selectImage() async {
    final pickedImage = await pickImage(ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  Widget Adminpanel(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => loginpage()),
    );
    // You can return a placeholder widget if needed, or null
    return  loginpage(); // Example placeholder widget
  }
  Widget notification(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ntify()),
    );
    // You can return a placeholder widget if needed, or null
    return  ntify(); // Example placeholder widget
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr, // Adjust as needed
        child: Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   onPressed: () {
            //     print('welcome'); // Handle menu button press
            //   },
            // ),
            title: const Center(child: Text('AAA Gatepass',style:TextStyle(color: Colors.black), )),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Center(
                child: Text('Welcome to the Gate Pass Application'),
              ),
              ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigate to the second page and pass the image
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Secondpage(image: image)),
              );
            },
            child: Icon(Icons.person_add),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          drawer:  Drawer(
            elevation: 16.0,
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green, // Change the background color here
                  ),
                  accountName: Text('user name'),
                  accountEmail: Text('example@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        selectImage();
                      },
                      icon: Icon(Icons.add_a_photo),
                    ),

                  ),
                ),
                ListTile(
                  title: Text('Admin Panel'),
                  leading: Icon(Icons.admin_panel_settings),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Adminpanel(context);
                    });
                  },
                ),

                Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: Text('Notification '),
                  leading: Icon(Icons.notifications),
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      notification(context);
                    });
                  },
                ),
                Divider(
                  height: 0.1,
                )
              ],
            ),
          ),
          /*persistentFooterButtons: <Widget>[
            ElevatedButton( // Replace RaisedButton with ElevatedButton
              onPressed: () {
                // Handle button press
                print('Button pressed');
              },
              child: Text('Press Me'), // Button text
            ),
          ],*/
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            fixedColor: Colors.green,
            items: const [
              BottomNavigationBarItem(
                  label:'home',
                  icon:Icon(Icons.home)
              ),

              BottomNavigationBarItem(
                  label:'user',
                  icon:Icon(Icons.person_2_sharp)
              )
            ],
            onTap: (int index){
              print(index.toString());
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Secondpage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
class Secondpage extends StatefulWidget {
  final Uint8List? image;
  const Secondpage({Key? key, this.image}) : super(key: key);

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  Uint8List? _image;
  void selectImage() async {
    final pickedImage = await pickImage(ImageSource.camera);
    if (pickedImage != null) {
      // final bytes = await pickedImage.readAsBytes();
      setState(() {
        _image = pickedImage;
      });
    }
  }

  TextEditingController namecontroller=new TextEditingController();
  TextEditingController regnocontroller=new TextEditingController();
  TextEditingController deptcontroller=new TextEditingController();
  TextEditingController yearcontroller=new TextEditingController();
  TextEditingController reasoncontroller=new TextEditingController();
  TextEditingController timecontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CREATE PASS', style: TextStyle(color: Colors.black)),
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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async{    //camera click event
                    selectImage();
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    backgroundImage: _image != null ? MemoryImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.add_a_photo, color: Colors.white)
                        : null,
                  ),

                ),
                SizedBox(height: 20),
                TextFormField(
                  controller:namecontroller ,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: regnocontroller,
                  decoration: InputDecoration(
                    labelText: 'Reg No',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: deptcontroller,
                  decoration: InputDecoration(
                    labelText: 'Dept (eg:CSE)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: yearcontroller,
                  decoration: InputDecoration(
                    labelText: 'Year(eg:first)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: reasoncontroller,
                  decoration: InputDecoration(
                    labelText: 'Reason',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: timecontroller,
                  decoration: InputDecoration(
                    labelText: 'Time(eg:11:30 AM)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: ()async{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Studentdata(
                      image:_image,
                      name: namecontroller.text,
                      regno: regnocontroller.text,
                      dept: deptcontroller.text,
                      year: yearcontroller.text,
                      reason: reasoncontroller.text,
                      time: timecontroller.text,
                    )));

                    // await DatabaseMethods().addStudentDetails(studentInfoMap, Id).then((value){
                    //   Fluttertoast.showToast(
                    //       msg: "Gatepass created",
                    //       toastLength: Toast.LENGTH_SHORT,
                    //       gravity: ToastGravity.CENTER,
                    //       timeInSecForIosWeb: 1,
                    //       backgroundColor: Colors.red,
                    //       textColor: Colors.white,
                    //       fontSize: 16.0
                    //   );
                    // });
                    // Handle form submission
                    // saveProfile();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Studentdata(
                          image:_image,
                          name: namecontroller.text,
                          regno: regnocontroller.text,
                          dept: deptcontroller.text,
                          year: yearcontroller.text,
                          reason: reasoncontroller.text,
                          time: timecontroller.text,
                        ),
                      ),
                    );
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
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        fixedColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              label:'home',
              icon:Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label:'user',
              icon:Icon(Icons.person_2_sharp)
          )
        ],
        onTap: (int index){
          print(index.toString());
        },
      ),
    );
  }
}

