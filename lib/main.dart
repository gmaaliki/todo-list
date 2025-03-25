import 'package:flutter/material.dart';
import 'package:tugas1/task.dart';
import 'package:tugas1/task_card.dart';
import 'package:tugas1/create_form.dart';

void main() => runApp(MaterialApp(home: TaskList()));

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // final _formKey = GlobalKey<FormState>();
  // String _name = '';

  List<Task> tasks = [
    Task(name: 'example'),
  ];

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //
  //     setState(() {
  //       tasks.add(Task(name: _name));
  //     });
  //
  //     _formKey.currentState!.reset();
  //   }
  // }

  void _createTask(String name) {
    setState(() {
      tasks.add(Task(name: name));
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void _toggleTask(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  // void _editQuote() {
  //   TextEditingController authorController = TextEditingController(text: quote.author);
  //   TextEditingController quoteController = TextEditingController(text: quote.text);
  //
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.only(
  //           bottom: MediaQuery.of(context).viewInsets.bottom,
  //           left: 16,
  //           right: 16,
  //           top: 16,
  //         ),
  //         child: Wrap(
  //           children: [
  //             Text(
  //               'Edit Quote',
  //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //             ),
  //             TextField(
  //               controller: authorController,
  //               decoration: InputDecoration(labelText: "Author"),
  //             ),
  //             TextField(
  //               controller: quoteController,
  //               decoration: InputDecoration(labelText: "Quote"),
  //             ),
  //             SizedBox(height: 10),
  //             ElevatedButton(
  //               onPressed: () {
  //                 setState(() {
  //                   quote.author = authorController.text;
  //                   quote.text = quoteController.text;
  //                 });
  //                 Navigator.pop(context);
  //               },
  //               child: Text("Update Quote"),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Task List'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Form(
            //   key: _formKey,
            //   child: Column(
            //     // children: [
            //     //   TextFormField(
            //     //     decoration: InputDecoration(labelText: "Enter author"),
            //     //     validator: (value) => value!.isEmpty ? 'Please enter author' : null,
            //     //     onSaved: (value) => _author = value!,
            //     //   ),
            //     //   TextFormField(
            //     //     decoration: InputDecoration(labelText: "Enter quote"),
            //     //     validator: (value) => value!.isEmpty ? 'Please enter quote' : null,
            //     //     onSaved: (value) => _quote = value!,
            //     //   ),
            //     //   SizedBox(height: 10),
            //     //   ElevatedButton(
            //     //     onPressed: _submitForm,
            //     //     child: Text('Create'),
            //     //   ),
            //     // ],
            //   ),
            // ),
          ),
          Column(
            children: tasks.map((task) => TaskCard(
              task: task,
              onDelete: _deleteTask,
              onToggleComplete: _toggleTask,
              // duplicate: () => setState(() => quotes.add(Quote(author: quote.author, text: quote.text))),
              // edit: () => _editQuote(quote),
            )).toList().cast<Widget>(),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CreateForm(addTask: _createTask);
            },
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}