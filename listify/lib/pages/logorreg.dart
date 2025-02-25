import 'package:flutter/widgets.dart';
import 'package:listify/pages/login_page.dart';
import 'package:listify/pages/register_page.dart';

class Logorreg extends StatefulWidget {
  @override
  State<Logorreg> createState() => _LogorregState();
}

class _LogorregState extends State<Logorreg> {
    
  bool showLoginPage=true;

  toggle(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(toggle: toggle);
    }else{
      return RegisterPage(toggle: toggle);
    }
  }
}