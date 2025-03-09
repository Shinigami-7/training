import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService{
  final _auth = FirebaseAuth.instance;

  Future<User?> createUser(String email, String password) async {
    try{
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    }catch(e){
      debugPrint('Someting went wrong');
    }
    return null;
  }

  Future<User?> loginuser(String email, String password) async {
    try{
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    }catch(e){
      debugPrint('Someting went wrong');
    }
    return null;
  }

  Future<void> signout()async {
    try{
      await _auth.signOut();
    }catch(e){
      debugPrint('Someting went wrong');
    }
    return null;

  }
}