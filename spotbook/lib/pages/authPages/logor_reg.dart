import 'package:flutter/widgets.dart';
import 'package:spotbook/pages/authPages/login_page.dart';
import 'package:spotbook/pages/authPages/register_page.dart';

class LogorReg extends StatefulWidget {
  @override
  State<LogorReg> createState() => _LogorRegState();
}

class _LogorRegState extends State<LogorReg> {
  bool showLoginPage= true;
    void togglePages(){
     setState(() {
        showLoginPage=!showLoginPage;
        }
      ); 
      print("clicked !!");
    }
  @override
  Widget build(BuildContext context) {
    return showLoginPage ? LoginPage(
      togglePages:togglePages,
    ): RegisterPage(
      togglePages: togglePages,
    );
  }
}