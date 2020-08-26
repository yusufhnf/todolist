import 'package:flutter/material.dart';
import 'package:todolist/src/pages/empty.dart';
import 'package:todolist/src/utils/util.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/login.png'),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.blueAccent,
                        Colors.blue,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        blurRadius: 15.0,
                        spreadRadius: 7.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: const Text(
                      'Login with Google',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
