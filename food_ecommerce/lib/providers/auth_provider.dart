import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Stream<User?> get userChanges => _auth.authStateChanges();

  Future<void> signUp(String email, String password, String name) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // Optionally update display name
    await _auth.currentUser?.updateDisplayName(name);
  }

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
