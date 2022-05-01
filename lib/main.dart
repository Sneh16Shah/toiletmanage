import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toiletmanage/utils/colors_util.dart';
import 'Admin.dart';
import 'Staffmember.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Admin());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringtocolor("CB2893"),
          hexStringtocolor("9546C4"),
          hexStringtocolor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Admin()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[200],
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                child: Text("Admin"),
              )),
              Container(
                margin: EdgeInsets.only(left: 10),
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Staffmember()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[200],
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                child: Text("Staffmember"),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
