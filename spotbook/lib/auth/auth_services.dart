import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

  Future<UserCredential> login(String email, String password)async{
    try {
      UserCredential _user= await 
        _firebaseAuth.signInWithEmailAndPassword(
          email: email, 
          password: password
        );
      return _user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      throw(e);
    }
  }

  Future<UserCredential> register(String email, String password)async{
    try {
      UserCredential _user= await 
        _firebaseAuth.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );
      return _user;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      throw(e);
    }
  }

  Future<void> logOut()async{
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser()=>_firebaseAuth.currentUser;
}