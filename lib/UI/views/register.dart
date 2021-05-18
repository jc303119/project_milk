import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectmilk/Core/models/user.dart';
import 'package:projectmilk/Core/services/db.dart';
import 'package:projectmilk/UI/utils/convertdbtouser.dart';
import 'package:projectmilk/UI/views/login.dart';
import 'package:projectmilk/UI/views/profileCRUD.dart';

class Register extends StatefulWidget {
  String msg = '';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//  BuildContext builtCtx;
//  String msg = '';
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userAddress1Ctrl = TextEditingController();
  TextEditingController userAddress2Ctrl = TextEditingController();
  TextEditingController userPhoneCtrl = TextEditingController();
  TextEditingController userPasswordCtrl = TextEditingController();

//  var currentId;
  _register() {
    User user = new User(
        userNameCtrl.text,
        userEmailCtrl.text,
        userAddress1Ctrl.text,
        userAddress2Ctrl.text,
        int.parse(userPhoneCtrl.text),
        userPasswordCtrl.text);
    Future<DocumentReference> docRef = Db.addUser(user);
  }

  login() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Milk Shopping'),
        actions: <Widget>[
          RaisedButton(
            color: Colors.greenAccent,
            onPressed: () {
              // edit(id);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 27),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.only(top: 2),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Name:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: userNameCtrl,
                decoration: InputDecoration(
                  hintText: 'Enter your full name',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              padding: EdgeInsets.only(top: 2),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Email ID:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(2),
              child: TextField(
                controller: userEmailCtrl,
                decoration: InputDecoration(
                  hintText: 'Enter your Email Address',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              padding: EdgeInsets.only(top: 2),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Address 1 :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(2),
              child: TextField(
                controller: userAddress1Ctrl,
                decoration: InputDecoration(
                  hintText: 'Enter your Address 1',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              padding: EdgeInsets.only(top: 2),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Address 2:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(2),
              child: TextField(
                controller: userAddress2Ctrl,
                decoration: InputDecoration(
                  hintText: 'Enter your Address 2',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              padding: EdgeInsets.only(top: 2),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Contact:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(2),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your contact number',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.contacts),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Protect your information with a password',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 2),
              padding: EdgeInsets.only(top: 2),
              child: Align(
                alignment: Alignment.bottomLeft,
                //padding: EdgeInsets.all(5),
                child: Text(
                  'Password:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(2),
              child: TextField(
                controller: userPasswordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      _register();
                    },
                    child: Text(
                      'Create new Account',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Text('Or'),
                Container(
                  padding: EdgeInsets.all(12),
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      login();
                    },
                    child: Text('Sign In'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
