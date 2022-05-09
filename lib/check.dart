import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:toiletmanage/components/input_container.dart';
import 'package:toiletmanage/setvalue.dart';
import 'package:toiletmanage/utils/colors_util.dart';

class Checkvalue extends StatefulWidget {
  @override
  State<Checkvalue> createState() => _CheckvalueState();
}

class _CheckvalueState extends State<Checkvalue> {
  double ran_mq2 = 0, ran_turb = 0;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      showAboutDialog(
        context: context,
        children: [
          Text("High MQ2 and NTU Value",
              style: TextStyle(color: Colors.purple[900])),
        ],
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      ran_mq2 = Random().nextDouble() * 5;
      ran_turb = Random().nextDouble() * 500;
      setState(() {});
      if (ran_mq2 > mq2_value) {
        FirebaseFirestore.instance
            .collection('notifs')
            .add({'time': DateTime.now()});
        sendNotif();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
    FirebaseMessaging.instance.unsubscribeFromTopic("system");
  }

  Future<void> sendNotif() async {
    Uri url = Uri.parse("https://fcm.googleapis.com/fcm/send");
    String? token = await FirebaseMessaging.instance.getToken();
    Map<String, dynamic> m = {
      "to": "/topics/system",
      "notification": {
        "body": "High MQ2 and NTU Value",
        "title": "Alert",
      },
      "body": "High MQ2 and NTU Value",
      "title": "Alert",
      "mutable_content": true,
      "sound": "Tri-tone"
    };
    var resp = await http.post(url, body: jsonEncode(m), headers: {
      "Authorization":
          "key=AAAARdz7dKg:APA91bG0IAkYFSjj-hkLyW89e5u8QJsHDE9cakXDrIbk1mb3O6DPccvgzj2YWNcs8If1k4DQQxzlKa8Row5VmUGZHxi8-S5UpRBil_oScZPJ6EHjt3lHsSQaFLdJcY6jDQ-fEQw19bcS",
      "Content-Type": "application/json"
    });
  }

  List<Timestamp> li = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringtocolor("CB2893"),
          hexStringtocolor("9546C4"),
          hexStringtocolor("5E61F4"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 0)),
            Text(
              "Current MQ2: \n" +
                  "\t\t\t\t" +
                  ran_mq2.toStringAsFixed(2) +
                  ' / ' +
                  mq2_value.toString(),
              style: TextStyle(
                color: Colors.blue[200],
                fontSize: 30,
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(20, 10, 30, 10)),
            Text(
              "Current   NTU: \n" +
                  "\t" +
                  ran_turb.toStringAsFixed(2) +
                  ' / ' +
                  turb.toString(),
              style: TextStyle(color: Colors.purple[100], fontSize: 30),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: li.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(li[i].toDate().toString()),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[900],
        onPressed: () async {
          Icons.panorama_fish_eye_sharp;
          var snap =
              await FirebaseFirestore.instance.collection('notifs').get();
          li.clear();
          for (int i = 0; i < snap.docs.length; i++) {
            li.add(snap.docs[i]['time']);
          }
          setState(() {});
        },
      ),
    );
  }
}
