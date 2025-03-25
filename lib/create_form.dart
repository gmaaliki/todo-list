import 'package:flutter/material.dart';

class CreateForm extends StatefulWidget {
  final Function(String) addTask;

  CreateForm({required this.addTask});

  @override
  _CreateFormState createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final TextEditingController _controller = TextEditingController();

  void _submitForm() {
    String name = _controller.text.trim();
    if (name.isNotEmpty) {
      widget.addTask(name);
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
