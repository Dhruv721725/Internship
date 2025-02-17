import 'package:cloud_firestore/cloud_firestore.dart';
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
      throw Exception(e.code);
    }
  }

  Future<UserCredential> register(String email, String password, String userName)async{
    try {
      UserCredential _user= await 
        _firebaseAuth.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );

      // saving user data in cloud firestore
      FirebaseFirestore _firestore=FirebaseFirestore.instance;
      _firestore.collection("Users").doc(_user.user!.uid).set({
        "userName": userName,
        "email":email,
        "type":"consumer"
      });

      print("data saved");
      // data saved
      return _user;
    
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> logOut()async{
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser()=>_firebaseAuth.currentUser;
}