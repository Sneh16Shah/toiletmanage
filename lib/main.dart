import 'package:flutter/material.dart';
import 'Admin.dart';
import 'Staffmember.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
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
                    primary: Colors.blue[900],
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Staffmember()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20)),
                      child: Text("Staffmember"))),
            ],
          ),
        ),
      ),
    );
  }
}
