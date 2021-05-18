import 'package:flutter/material.dart';
import 'package:projectmilk/UI/views/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  register() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'Login Here',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email Address',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(500)),
              child: RaisedButton(
                color: Colors.orangeAccent,
                onPressed: () {},
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'OR',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: RaisedButton(
                color: Colors.grey,
                onPressed: () {
                  register();
                },
                padding: EdgeInsets.all(10),
                child: Text(
                  'Create your Account',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
