import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompWarning extends StatelessWidget{
  String message;
  CompWarning({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Text(message),
      contentPadding: EdgeInsets.all(16),
    );
  }
}