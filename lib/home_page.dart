import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TextEditingController user type value Store karne k liya
  TextEditingController userController = TextEditingController();
// globle key
  String NAME_KEY = "name";
  // SharedPreferences object
  SharedPreferences? prefs;
// value Store String name variable
  String? name;

  @override
  // use function getvalueFromePrefs build karne k liya Scaffold call hone se phale
  void initState() {
    //  self function
    getvalueFromePrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Function

    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Column(
        children: [
          //get value
          Text(
            'Welcome, your last name saved was : ${name ?? "Default"}',
            style: TextStyle(fontSize: 20),
          ),
          TextField(controller: userController),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(
              onPressed: () {
                //set value
                prefs!.setString(NAME_KEY, userController.text);
              },
              child: Text("Save")),
        ],
      ),
    );
  }

// initilize function
  void getvalueFromePrefs() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString(NAME_KEY);
    // setState data set karne k liya
    // print(name); run me data show karne k liya
    setState(() {});
  }
}
