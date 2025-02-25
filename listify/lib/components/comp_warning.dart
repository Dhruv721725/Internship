import 'package:flutter/material.dart';

class CompWarning {
  var context;
  
  CompWarning({
    required this.context,
  });

  void warning(String text){
    showDialog(
      context: context, 
      builder: (context)=>AlertDialog(
        content: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            text, 
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ), 
        ),
      )
    );
  }
}