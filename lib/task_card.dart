import 'package:flutter/material.dart';
import 'package:tugas1/task.dart';
import 'package:tugas1/edit_form.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final void Function(Task) onDelete;
  final void Function(Task) onToggleComplete;
  final void Function(Task, String) onEdit;

  TaskCard({
    required this.task,
    required this.onDelete,
    required this.onToggleComplete,
    required this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4, // Adds shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        // leading:
        // Checkbox(
        //   value: task.isCompleted,
        //   onChanged: (value) => onToggleComplete(),
        // ),
        title: Text(
          task.name ?? '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: task.isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.green),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EditForm(editTask: onEdit, task: task);
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDelete(task),
            ),
            Checkbox(
              value: task.isCompleted,
              onChanged: (bool? val) {
                if (val != null) {
                  onToggleComplete(task);
                }
              },
            ),
          ]

        )

      ),
    );
  }
}
