import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listify/auth/auth_service.dart';
import 'package:listify/components/comp_button.dart';
import 'package:listify/components/comp_textfield.dart';
import 'package:listify/components/comp_warning.dart';

class RegisterPage extends StatelessWidget {
  Function()? toggle;
  RegisterPage({required this.toggle});

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cnfrmpass = TextEditingController();
  
  AuthService _auth = AuthService();
  

  @override
  Widget build(BuildContext context) {
    void register()async{
      String ename=name.text.trim();
      String eemail=email.text.trim();
      String epass=pass.text.trim(); 
      String ecpass=cnfrmpass.text.trim(); 
      CompWarning warn =CompWarning(context: context);
      
      showDialog(context: context, builder:(context)=>Center(child: SizedBox(height: 70, width: 70, child: CircularProgressIndicator(semanticsLabel: "Loading...",strokeWidth: 5,))));
      
      if (ename=="" || eemail=="" || epass =="" || ecpass=="") {
        Navigator.pop(context);
        warn.warning("Empty Entries.");
      }else if (epass != ecpass){
        Navigator.pop(context);
        warn.warning("Confirm Password and Password did not match.");
      }else{
        try {
          await _auth.register(eemail, epass);
          Navigator.pop(context);
        } on Exception catch (e) {
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
            Icon(Icons.person, size: 150, color: Theme.of(context).colorScheme.inversePrimary,),
            SizedBox(height: 35,),

            // welcome
            Text("Register now to make your tasks listify."),
            SizedBox(height: 35,),

            // fields
            CompTextfield(controller: name, hintText: "Name...", obscureText: false,icon: Icon(Icons.person , color: Theme.of(context).colorScheme.inversePrimary,) ,),
            CompTextfield(controller: email, hintText: "Email...", obscureText: false,icon: Icon(Icons.email , color: Theme.of(context).colorScheme.inversePrimary,) ,),
            CompTextfield(controller: pass, hintText: "Password...", obscureText: true,icon: Icon(Icons.remove_red_eye,color: Theme.of(context).colorScheme.inversePrimary,),),
            CompTextfield(controller: cnfrmpass, hintText: "Confirm Password...", obscureText: true,icon: Icon(Icons.remove_red_eye,color: Theme.of(context).colorScheme.inversePrimary,),),
            SizedBox(height: 20,),

            // button
            CompButton(onTap: register, text: "Register"),
            SizedBox(height: 25,),

            // toggle link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Allready a member? "),
                GestureDetector(
                  onTap: toggle,
                  child: Text(
                    "Login",
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