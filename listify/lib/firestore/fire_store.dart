import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:listify/auth/auth_service.dart';
import 'package:listify/models/task.dart';

class FireStore {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  
  // Save user details
  Future <void> addUser(String name, String email, String pass)async{
    User? _user= _firebaseAuth.currentUser;
    try {
      await _firestore.collection("Tasks")
      .doc(_user!.uid).collection("User Details")
      .add({
        "name":name,
        "email":email,
        "pass":pass,
        "time":Timestamp.now(),
      });

    } catch (e) {
      print(e);
      throw Exception("Exception during creating tasks.");
    }
  }

  // create task 
  Future <void> addTask(String text, String category)async{
    Map <String,dynamic> task=Task(
      text: text,
      category: category, 
      timestamp: Timestamp.now(),
    ).toMap();
    
    User? _user= _firebaseAuth.currentUser;
    
    try {
      await _firestore.collection("Tasks")
      .doc(_user!.uid).collection("tasks")
      .add(task);

    } catch (e) {
      print(e);
      throw Exception("Exception during creating tasks.");
    }
  }

  // read task
  Stream<QuerySnapshot<Map<String,dynamic>>> getTasks(String category){
    User? _user =  _firebaseAuth.currentUser;
    try {
      return  _firestore.collection("Tasks")
      .doc(_user!.uid).collection("tasks")
      .orderBy("time",descending: true)
      .snapshots();

    } catch (e) {
      print(e);
      throw Exception("Exception during reading tasks.");
    }
  }

  Future <void> delTask(String TaskId)async{
    User? _user= _firebaseAuth.currentUser;
    
    try {
      await _firestore.collection("Tasks")
      .doc(_user!.uid).collection("tasks")
      .doc(TaskId).delete();

    } catch (e) {
      print(e);
      throw Exception("Exception during creating tasks.");
    }
  }

  Future <void> editTask(String text, String category, String taskid)async{
    User? _user= _firebaseAuth.currentUser;
    try {
      await _firestore.collection("Tasks")
      .doc(_user!.uid).collection("tasks")
      .doc(taskid).update({
        "task":text,
        "category":category,
      });

    } catch (e) {
      print(e);
      throw Exception("Exception during creating tasks.");
    }
  }
}