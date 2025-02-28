import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listify/auth/auth_service.dart';
import 'package:listify/components/comp_add_task.dart';
import 'package:listify/components/comp_search_field.dart';
import 'package:listify/components/comp_tasktile.dart';
import 'package:listify/components/comp_textfield.dart';
import 'package:listify/firestore/fire_store.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _auth=AuthService();

  FireStore _fireStore=FireStore();

  TextEditingController search= TextEditingController();

  @override
  Widget build(BuildContext context) {
    String cat=search.text;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon:Icon(Icons.logout_rounded) ,
            onPressed: _auth.logout,
          )
        ],
      ),
      
      body: Column(
        children: [
          CompSearchField(
            controller: search, 
            onSearch: () {
              setState(() {
                cat=search.text;
              });
            },
          ),

          Expanded(
            child: StreamBuilder(
              stream: _fireStore.getTasks("all") , 
              builder: (context,snapshot){
                if (snapshot.connectionState==ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(snapshot.hasData){

                  return ListView(
                    children: snapshot.data!.docs.map((ele){
                      if (cat!="") {
                        if(ele["category"].toString().toLowerCase()==cat.toLowerCase()){
                          return CompTasktile(task: ele);
                        }else{
                          return SizedBox();
                        }
                      }else{
                        return CompTasktile(task: ele);
                      }
                    }).toList(),
                  );
            
                }else{
                  return Center(
                    child: Text("No tasks yet..."),
                  );
                }
              }
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder:(context)=>CompAddTask(), 
          );
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}