import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotbook/auth/auth_services.dart';
import 'package:spotbook/components/comp_button.dart';
import 'package:spotbook/components/comp_textfield.dart';

class RegisterPage extends StatelessWidget{

  final Function()? togglePages;
  RegisterPage({
    super.key,
    required this.togglePages
  });

  TextEditingController _usercontroller= TextEditingController();
  TextEditingController _passcontroller= TextEditingController();
  TextEditingController _cnfrmpasscontroller= TextEditingController();
  TextEditingController _usernamecontroller= TextEditingController();
  
  AuthServices _auth = AuthServices();
  FirebaseFirestore _firestore= FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    void register()async {
      String email=_usercontroller.text.trim();
      showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator(),));
      if (_passcontroller.text==_cnfrmpasscontroller.text) {
        try {
          await _auth.register(email, _passcontroller.text, _usernamecontroller.text);
          Navigator.pop(context);
        } catch (e) {
          Navigator.pop(context);
          showDialog(
            context: context, 
            builder: (context)=>AlertDialog(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(e.toString()
                    .split(":")[1].trim().split("-")
                    .map((w)=>w[0].toUpperCase()+w.substring(1))
                    .join(" "),),
                ],
              ),
              contentPadding: EdgeInsets.all(16),
            )
          );
        }
      }else{  
        Navigator.pop(context);
        showDialog(context: context, builder: (context)=>AlertDialog(
          content: Text("Password Mismatch"),
          contentPadding: EdgeInsets.all(16),
        ));
      }
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // login icon
            Icon(Icons.person, size: 150, color: Theme.of(context).colorScheme.inversePrimary,),
            SizedBox(height: 20,),
            // welcome text
            // Text("Welcome to the Spot Book comunity,"),
            Text("To book your parking spot register now."),
            SizedBox(height: 16,),
            
            // textfield for name
            CompTextfield(
              controller: _usernamecontroller, 
              hintText: "name", 
              obscureText: false),
            
            // textfield for email
            CompTextfield(
              controller: _usercontroller, 
              hintText: "email", 
              obscureText: false),
            
            // textfield for password
            CompTextfield(
              controller: _passcontroller, 
              hintText: "password", 
              obscureText: true),

            // textfield for confirm password
            CompTextfield(
              controller: _cnfrmpasscontroller, 
              hintText: "confirm password", 
              obscureText: true),
            SizedBox(height: 25,),
            
            // login button
            CompButton(
              onTap: register, 
              text: "Register"),
            SizedBox(height: 10,),
            
            // toogle link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a member? "),
                GestureDetector(
                  onTap: togglePages,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color:Colors.blue,
                      fontWeight: FontWeight.bold 
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}