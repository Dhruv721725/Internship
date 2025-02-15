import 'package:flutter/material.dart';
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
  
  void register(){
 
  }

  @override
  Widget build(BuildContext context) {
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