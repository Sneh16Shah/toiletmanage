import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toiletmanage/signup.dart';
import 'package:toiletmanage/update.dart';
import 'package:toiletmanage/utils/colors_util.dart';
import 'Admin.dart';
import 'check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

double mq2_value = 0, turb = 0;

class SetValue extends StatefulWidget {
  const SetValue({Key? key}) : super(key: key);

  @override
  State<SetValue> createState() => _SetValueState();
}

class _SetValueState extends State<SetValue> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple[900],
        title: Text('Threshold Value'),
        elevation: 0,
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple[200],
            ),
            onPressed: () {
              Icons.update;
              Navigator.push(
                  context, (MaterialPageRoute(builder: (context) => Update())));
            },
            child: Icon(Icons.edit),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringtocolor("CB2B93"),
          hexStringtocolor("9546C4"),
          hexStringtocolor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 200, 20, 0),
          child: Column(
            children: [
              //  Text("Welcome",style: TextStyle(fontSize: 30, color: Colors.black)),
              Text("Hygiene Configuration",
                  style:
                      TextStyle(fontSize: 30, color: Colors.purpleAccent[100])),
              // Center(
              //   child: Image.asset('assets/images/sign-up.png',
              //     width: 200,
              //     height: 200,),
              // ),
              // SizedBox(height: 15,),
              // TextField(
              //   decoration: InputDecoration(
              //       labelText: "Name",
              //       labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade800),
              //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              //   ),
              // ),
              // SizedBox(height: 15,),
              // TextField(
              //   decoration: InputDecoration(
              //       labelText: "Id",
              //       labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade800),
              //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              //   ),
              //
              // ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter Gas Sensor Value",
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white70),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    )),
                cursorColor: Colors.black,
                onChanged: (var value) {
                  setState(() {
                    if (value != '') mq2_value = double.parse(value);
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                // obscureText: true,
                onChanged: (var value) {
                  setState(() {
                    if (value != '') turb = double.parse(value);
                  });
                },
                decoration: InputDecoration(
                    labelText: "Enter Turbidity Sensor Value",
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white70),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.pinkAccent),
                    )),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  await FirebaseMessaging.instance.subscribeToTopic('system');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkvalue(),
                    ),
                  );
                },
                child: Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Set ",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // SizedBox(height: 15,),
              // Container(
              //   height: size.height / 14,
              //   width: size.width,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(color: Colors.red,
              //       borderRadius: BorderRadius.circular(5)),
              //   child: Text("Cancel ",
              //     style: TextStyle(color: Colors.white,
              //         fontWeight: FontWeight.bold),),
              // ),

              TextButton(
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);

                  //   ctxt,
                  //   new MaterialPageRoute(builder: (ctxt) => const MyApp()),
                },

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MyApp()),
                // );
                // Navigator.of(context).popUntil((route) => route.isFirst);
                // Hygiene obj= new Hygiene();

                //Hygiene screen
              )
            ],
          ),
        ),
      ),
    );
  }
}
