import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toiletmanage/components/rounded_button.dart';

import 'components/rounded_input.dart';
import 'components/rounded_password.dart';

class Staffmember extends StatefulWidget {
  const Staffmember({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Staffmember> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInset = MediaQuery.of(context)
        .viewInsets
        .bottom; // we are using this to determine Keyboard is opened or not
    double defaultLoginsize = size.height - (size.height * 0.2);
    double defaultRegistersize = size.height - (size.height * 0.1);
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: size.width,
              height: size.height * 0.1,
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: defaultLoginsize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Staffmember",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    SizedBox(height: 40),
                    RoundedInput(icon: Icons.email),
                    RoundedPasswordInput(hint: 'Password'),
                    Roundedbutton(title: 'LOGIN'),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                  color: Colors.blueGrey[200]),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
