import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Task{
  final String text;
  final String category;
  final Timestamp timestamp;
  
  const Task({
    required this.text,
    required this.category,
    required this.timestamp,
  });

  Map<String, dynamic> toMap()=>{
    "task":text,
    "category":category,
    "time":timestamp,
  };
}