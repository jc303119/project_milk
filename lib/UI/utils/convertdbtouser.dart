import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectmilk/Core/models/user.dart';
import 'package:projectmilk/Core/services/db.dart';

class ConvertDbToUser {
  static List<User> userList;

  static List<User> getUsers() {
    return userList;
  }

  static void setUsers(List<User> users) {
    userList = users;
  }

  static Future<List<User>> convertDBToUser() async {
    if (userList != null) {
      return userList;
    }
    QuerySnapshot obj = await Db.getAllRecordsForFuture();
    List<User> users = [];
    obj.documents.forEach((doc) {
      User user = new User(doc['name'], doc['email'], doc['address1'],
          doc['address2'], doc['phone']);
      //user.id = doc.documentID;
      users.add(user);
    });
    userList = users;
    return userList;
  }
}
