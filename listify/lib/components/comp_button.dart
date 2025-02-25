import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompButton extends StatelessWidget{
  Function()? onTap;
  String text;
  CompButton ({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        padding: EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(
              color: Colors.white,
            ),),
          ],
        ),
      ),
    );
  }
}