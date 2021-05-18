import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectmilk/Core/models/user.dart';

class Db {
  static final Firestore _db = Firestore.instance;
  static Future<DocumentReference> addUser(User user) {
    //adding of user details should be done during registration?
    CollectionReference userCollection = _db.collection("users");
    Future<DocumentReference> future = userCollection.add(user.convertToMap());
    return future;
  }

  static Future<QuerySnapshot> readAllRecords() {
    CollectionReference userCollection = _db.collection('users');
    Future<QuerySnapshot> querySnapShot = userCollection.getDocuments();
    return querySnapShot;
  }

  static Future<QuerySnapshot> getAllRecordsForFuture() {
    return _db.collection('users').getDocuments();
  }

  static Future<void> updateUser(String id, User user) {
    CollectionReference userCollection = _db.collection("users");
    Future<void> future =
        userCollection.document(id).updateData(user.convertToMap());
    return future;
  }
}
