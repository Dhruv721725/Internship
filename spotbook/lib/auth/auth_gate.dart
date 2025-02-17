import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotbook/pages/admin_page.dart';
import 'package:spotbook/pages/authPages/logor_reg.dart';
import 'package:spotbook/pages/user_page.dart';

class AuthGate extends StatelessWidget{
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future<Widget> getPage()async{
    DocumentSnapshot _doc=await _firestore.collection("Users").doc(_auth.currentUser!.uid).get();
    String type=await _doc.get("type");
    
    if (type=="admin") {
      return AdminPage();
    }else{
      return UserPage();
    }
  } 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return FutureBuilder(
              future: getPage(),
              builder: (context, snapshot){
                if (snapshot.connectionState==ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }else{
                  return snapshot.data??LogorReg();
                }
              }
            );
          }else{
            return LogorReg();
          }
        }
      ),
    );
  }
}