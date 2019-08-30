import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<FirebaseUser> getUser() async {
    try {
      final user = await FirebaseAuth.instance.currentUser();
      if (user != null) {
        return user;
      }
      return null;
    } catch (e) {
      print(e);
    }
  }

  static signOut() {
    FirebaseAuth.instance.signOut();
  }
}
