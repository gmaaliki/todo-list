import 'package:flutter/material.dart';
import 'package:tugas1/task.dart';

class EditForm extends StatefulWidget {
  final Function(Task, String) editTask;
  final Task task;

  EditForm({required this.editTask, required this.task});

  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.task.name); // Set initial value
  }

  void _submitForm() {
    String name = _controller.text.trim();
    if (name.isNotEmpty) {
      widget.editTask(widget.task, name);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create your task"),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _submitForm(); // Go back to the previous screen
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
