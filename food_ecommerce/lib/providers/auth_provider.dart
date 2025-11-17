import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream for listening to auth changes
  Stream<User?> get userChanges => _auth.userChanges();

  // User login
  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // User signup
  Future<void> signUp(String email, String password, String name) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user!.updateDisplayName(name);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // Optional logout method
  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }
}
