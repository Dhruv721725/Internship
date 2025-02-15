import 'package:flutter/material.dart';

class CompTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const CompTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          hintText: hintText,
          filled: true,
          fillColor: Theme.of(context).colorScheme.tertiary,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
          ),
          
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
          ), 
        ),
        cursorColor:Theme.of(context).colorScheme.inversePrimary,
        obscureText: obscureText,
      ),
    );
  }
}