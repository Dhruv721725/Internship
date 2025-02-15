import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotbook/pages/authPages/logor_reg.dart';
import 'package:spotbook/pages/user_page.dart';

class AuthGate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if (snapshot.hasData) {
            print(snapshot.toString());
            return UserPage();
          }else{
            return LogorReg();
          }
        }
      ),
    );
  }
}