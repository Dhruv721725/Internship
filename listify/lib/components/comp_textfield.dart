import 'package:flutter/material.dart';

class CompTextfield extends StatefulWidget{
  TextEditingController controller;
  String hintText;
  bool obscureText;
  Icon icon;
  CompTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  late bool isPass=obscureText;
  @override
  State<CompTextfield> createState() => _CompTextfieldState();
}

class _CompTextfieldState extends State<CompTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: widget.hintText,
          
          suffixIcon: widget.isPass ? IconButton(
            onPressed: (){
             setState(() {
                widget.obscureText=!widget.obscureText;
             });
            }, 
            icon: widget.icon,
          )
          : 
          widget.icon,
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiary,
            )
          ),
          
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
            )
          ),
        ),
      ),
    );
  }
}