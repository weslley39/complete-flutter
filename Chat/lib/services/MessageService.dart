import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  static const collectionName = 'messages';

  static void add({String message, String sender}) async {
    var data = await Firestore.instance.collection(collectionName).add({
      'text': message,
      'sender': sender,
    });
  }

  static Stream<QuerySnapshot> stream() {
    return Firestore.instance.collection(collectionName).snapshots();
  }
}