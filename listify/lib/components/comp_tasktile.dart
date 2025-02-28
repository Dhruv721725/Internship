import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:listify/components/comp_button.dart';
import 'package:listify/components/comp_edit_task.dart';
import 'package:listify/components/comp_textfield.dart';
import 'package:listify/firestore/fire_store.dart';
import 'package:listify/models/task.dart';

class CompTasktile extends StatelessWidget{
  var task;
  CompTasktile({required this.task});
  FireStore _fireStore=FireStore();

  @override
  Widget build(BuildContext context) {
    void onDel(){
      showDialog(
        context: context, 
        builder: (context)=>AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text("Are you sure?"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CompButton(
                    onTap: (){
                      _fireStore.delTask(task.id);
                      Navigator.pop(context);
                    }, 
                    text: "YES"
                  ),

                  CompButton(
                    onTap: (){
                      Navigator.pop(context);
                    }, 
                    text: "NO",
                  ),
                ],
              )
            ],
          ),
        )
      );
    }

    void onSave(){
      showDialog(context: context, builder: (context)=>CompEditTask(task: task));
    }

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            // Delete Action
            SlidableAction(
              padding: EdgeInsets.symmetric(vertical: 5),
              borderRadius: BorderRadius.circular(10),
              onPressed: (context)=>onDel(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            // Edit Action
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) => onSave(),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 25, ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(task["task"]),
            subtitle: Text(
              task["category"],
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
            trailing: Text(
              DateFormat.yMMMd().format(task["time"].toDate()).toString(),
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
        ),
      ),
    );
  }
}
