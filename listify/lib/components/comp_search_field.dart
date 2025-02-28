import 'package:flutter/material.dart';

class CompSearchField extends StatelessWidget{
  TextEditingController controller;
  Function() onSearch;
  CompSearchField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: TextField(
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText:"Search category..",
          suffixIcon: IconButton(
            onPressed:onSearch, 
            icon: Icon(Icons.search, color: Theme.of(context).colorScheme.inversePrimary,),
          ),
          
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