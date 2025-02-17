import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotbook/auth/auth_services.dart';

class UserPage extends StatelessWidget{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<DocumentSnapshot> getData()async{
    DocumentSnapshot _doc = await _firestore.collection("Users").doc(_auth.currentUser!.uid).get();
    return _doc; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumer's Page"),
        actions: [
          IconButton(
            onPressed: ()=>AuthServices().logOut(),
            icon: Icon(Icons.logout_outlined)
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(), 
          builder: (context, snapshot){
            if (snapshot.connectionState==ConnectionState.waiting) {
              return CircularProgressIndicator();
            }else{
              return Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(snapshot.data!.get("userName").toString()),
                  subtitle: Text(snapshot.data!.get("email").toString()),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}