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
  List<Task> tasks = [
    Task(name: 'example'),
  ];

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

  void _editTask(Task task, String name) {
    setState(() {
      task.name = name;
    });
  }

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
          ),
          Column(
            children: tasks.map((task) => TaskCard(
              task: task,
              onDelete: _deleteTask,
              onEdit: _editTask,
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