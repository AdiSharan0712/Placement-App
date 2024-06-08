import 'package:flutter/material.dart';

class ManageStudentsScreen extends StatefulWidget {
  @override
  _ManageStudentsScreenState createState() => _ManageStudentsScreenState();
}

class _ManageStudentsScreenState extends State<ManageStudentsScreen> {
  void _addStudent() {
    // Implement add student functionality
  }

  void _editStudent(Student student) {
    // Implement edit student functionality
  }

  void _deleteStudent(Student student) {
    setState(() {
      students.remove(student);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Students'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addStudent,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('USN: ${student.usn}\nDepartment: ${student.dept}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editStudent(student),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteStudent(student),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
