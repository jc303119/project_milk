import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectmilk/Core/models/user.dart';
import 'package:projectmilk/Core/services/db.dart';
import 'package:projectmilk/UI/utils/convertdbtouser.dart';

class ProfileCRUD extends StatefulWidget {
  User userObject;
  // Function function;
//  ProfileCRUD(User userObject, Function fn) {
//    this.userObject = userObject;
//    this.function = fn;
//  }

  @override
  _ProfileCRUDState createState() => _ProfileCRUDState();
}

class _ProfileCRUDState extends State<ProfileCRUD> {
  BuildContext builtCtx;
  TextEditingController userNameCtrl =
      TextEditingController(); //TextEditingController userNameCtrl = TextEditingController();
  TextEditingController userEmailCtrl = TextEditingController();
  TextEditingController userAddress1Ctrl = TextEditingController();
  TextEditingController userAddress2Ctrl = TextEditingController();
  TextEditingController userPhoneCtrl = TextEditingController();
  //TextEditingController userPasswordCtrl = TextEditingController();

  _showDialog() {
    var media = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text('Add/ Update'),
      backgroundColor: Colors.greenAccent,
      elevation: 5,
      content: Container(
        height: media.height / 3,
        child: Column(
          children: <Widget>[
            Text(
              'Record updated Successfully',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Icon(
            Icons.close,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(builtCtx).pop();
            // widget.function();
          },
        )
      ],
    );
  }

  updateToDb(id) {
    User user = new User(
      userNameCtrl.text,
      userEmailCtrl.text,
      userAddress1Ctrl.text,
      userAddress2Ctrl.text,
      int.parse(userPhoneCtrl.text),
    );
    user.id = id;
    Future<void> future = Db.updateUser(id, user);
    future
        .then((value) => {
              showDialog(context: builtCtx, builder: (ctx) => _showDialog()),
              ConvertDbToUser.setUsers(null),
            })
        .catchError((err) {
      print('Error in User is $err');
    });
  }

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    userNameCtrl.text = widget.userObject.name;
//    userEmailCtrl.text = widget.userObject.userId;
//    userAddress1Ctrl.text = widget.userObject.address1;
//    userAddress2Ctrl.text = widget.userObject.address2;
//    userPhoneCtrl.text = widget.userObject.phone.toString();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vendor Add/ Update',
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(top: 2),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Vendor Name:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: userNameCtrl,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.blue,
                        ),
                        hintText: 'Vendor Name',
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(top: 2),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Vendor EmailId:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: userEmailCtrl,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          size: 25,
                          color: Colors.blue,
                        ),
                        hintText: 'Vendor EmailId',
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(top: 2),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Vendor Address 1:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: userAddress1Ctrl,
                      maxLines: 2,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.add_location,
                          size: 25,
                          color: Colors.blue,
                        ),
                        hintText: 'Vendor Address 1',
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(top: 2),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Vendor Address 2:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: userAddress2Ctrl,
                      maxLines: 2,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.add_location,
                          size: 25,
                          color: Colors.blue,
                        ),
                        hintText: 'Vendor Address 2',
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.only(top: 2),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Vendor Mobile No:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: userPhoneCtrl,
                      decoration: InputDecoration(
                        // enabledBorder: OutlineInputBorder(
                        //borderSide: BorderSide(color: Colors.red, width: 3.0),
                        // ),
                        icon: Icon(
                          Icons.phone_android,
                          size: 25,
                          color: Colors.blue,
                        ),
                        hintText: 'Vendor  Mobile No',
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateToDb(widget.userObject.id);
          //add();
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
