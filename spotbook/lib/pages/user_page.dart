import 'package:flutter/material.dart';
import 'package:spotbook/auth/auth_services.dart';

class UserPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Page"),
        actions: [
          IconButton(
            onPressed: ()=>AuthServices().logOut(),
            icon: Icon(Icons.logout_outlined)
          )
        ],
      ),
    );
  }
}