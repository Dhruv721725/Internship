import 'package:flutter/material.dart';
import 'package:spotbook/auth/auth_services.dart';
import 'package:spotbook/components/comp_button.dart';
import 'package:spotbook/components/comp_textfield.dart';
import 'package:spotbook/components/comp_warning.dart';

class LoginPage extends StatelessWidget{
  final Function()? togglePages;

  LoginPage({
    super.key,
    required this.togglePages,
  });

  TextEditingController _usercontroller= TextEditingController();
  TextEditingController _passcontroller= TextEditingController();
  AuthServices _auth= AuthServices();

  @override
  Widget build(BuildContext context) {
    
    
    void login(){
      String email=_usercontroller.text.trim();
      showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator(),));
      if (email!="") {
        try {
          _auth.login(email, _passcontroller.text);
        } catch (e) {
          showDialog(
            context: context, 
            builder: (context)=>AlertDialog(
              content: Text(e.toString()
                .split(":")[1].trim().split(" ")
                .map((w)=>w[0].toUpperCase()+w.substring(1))
                .join(" "),),
            )
          );
        }
      }
      Navigator.pop(context);
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // login icon
            Icon(Icons.lock, size: 150, color: Theme.of(context).colorScheme.inversePrimary,),
            SizedBox(height: 25,),
            // welcome text
            Text("Welcome back, you have been missed."),
            SizedBox(height: 16,),

            // textfield for login id
            CompTextfield(
              controller: _usercontroller, 
              hintText: "user id", 
              obscureText: false),
            
            // textfield for password
            CompTextfield(
              controller: _passcontroller, 
              hintText: "password", 
              obscureText: true),
            SizedBox(height: 25,),
            
            // login button
            CompButton(
              onTap: login, 
              text: "LogIn"),
            SizedBox(height: 10,),
            
            // toogle link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                GestureDetector(
                  onTap: ()=>togglePages!(),
                  child: Text(
                    "Register now",
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