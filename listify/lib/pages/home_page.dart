import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listify/auth/auth_service.dart';

class HomePage extends StatelessWidget{
  AuthService _auth=AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon:Icon(Icons.logout_rounded) ,
            onPressed: _auth.logout,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page")
          ],
        ),
      ),
    );
  }
}