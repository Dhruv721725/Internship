import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listify/components/comp_button.dart';
import 'package:listify/components/comp_textfield.dart';
import 'package:listify/firestore/fire_store.dart';

class CompEditTask extends StatelessWidget{
  TextEditingController taskController=new TextEditingController();
  TextEditingController categoryController=new TextEditingController();
  FireStore _fireStore=FireStore();
  var task;

  CompEditTask({required this.task});
  
  @override
  Widget build(BuildContext context) {
    taskController.value=TextEditingValue(text: task["task"]);
    categoryController.value=TextEditingValue(text: task["category"]);
    void onSave()async{
      String text=taskController.text.trim();
      String category=categoryController.text.trim();

      if (task!="" && category!="") {
        await _fireStore.editTask(text, category, task.id);
      }                
      Navigator.pop(context);
      taskController.clear();
      categoryController.clear();
    }
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CompTextfield(
            controller: taskController, 
            hintText: "Task...", 
            obscureText: false, 
            icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.inversePrimary,)
          ),
          
          CompTextfield(
            controller: categoryController, 
            hintText: "Category...", 
            obscureText: false, 
            icon: Icon(Icons.category, color: Theme.of(context).colorScheme.inversePrimary,)
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CompButton(
                onTap: onSave, 
                text: "Save"
              ),
              CompButton(
                onTap: (){
                  Navigator.pop(context);
                  taskController.clear();
                  categoryController.clear();
                }, 
                text: "No"
              ),
            ],
          )
        ],
      ),
    );
  }
}