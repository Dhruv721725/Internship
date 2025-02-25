import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listify/auth/auth_service.dart';
import 'package:listify/components/comp_button.dart';
import 'package:listify/components/comp_textfield.dart';
import 'package:listify/components/comp_warning.dart';

class LoginPage extends StatelessWidget {
  Function()? toggle;
  LoginPage({required this.toggle});
  
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {

    void login()async{
      String eemail=email.text.trim();
      String epass=pass.text.trim(); 
      CompWarning warn =CompWarning(context: context);
      
      showDialog(
        context: context, 
        builder:(context)=>Center(
          child: SizedBox(height: 70, width: 70, child: CircularProgressIndicator(
            semanticsLabel: "Loading...",
            strokeWidth: 8,
            semanticsValue: "Loading...",
            )
          )
        )
      );
      
      if (eemail=="" || epass == "") {
        Navigator.pop(context);
        warn.warning("Empty Entries.");
      }else{
        try {
          await _auth.login(eemail, epass);
          Navigator.pop(context);
        } on Exception catch (e){
          Navigator.pop(context);
          warn.warning(
            e.toString().split(":")[1].trim().split("-").map((x)=>x[0].toUpperCase()+x.substring(1)).join(" ")
          );
        }
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Icon(Icons.login, size: 150, color: Theme.of(context).colorScheme.inversePrimary,),
            SizedBox(height: 35,),

            // welcome
            Text("Welcome back, you have been missed."),
            SizedBox(height: 35,),

            // fields
            CompTextfield(controller: email, hintText: "Email...", obscureText: false,icon: Icon(Icons.email , color: Theme.of(context).colorScheme.inversePrimary,) ,),
            CompTextfield(controller: pass, hintText: "Password...", obscureText: true,icon: Icon(Icons.remove_red_eye,color: Theme.of(context).colorScheme.inversePrimary,),),
            SizedBox(height: 20,),

            // button
            CompButton(onTap:login, text: "Login"),
            SizedBox(height: 25,),

            // toggle link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                GestureDetector(
                  onTap: toggle,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}