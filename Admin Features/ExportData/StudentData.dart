import 'package:flutter/material.dart';

class ManageStudentsScreen extends StatefulWidget {
  @override
  _ManageStudentsScreenState createState() => _ManageStudentsScreenState();
}

class _ManageStudentsScreenState extends State<ManageStudentsScreen> {
  void _exportStudents() async {
    List<List<dynamic>> rows = [];

    rows.add(["USN", "Name", "Department"]);
    for (var student in students) {
      rows.add([student.usn, student.name, student.department]);
    }

    await exportDataToCSV(rows, "students_data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Students'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: _exportStudents,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('USN: ${student.usn}\nDepartment: ${student.department}'),
          );
        },
      ),
    );
  }
}

class Student {
  final String usn;
  final String name;
  final String department;

  Student({
    required this.usn,
    required this.name,
    required this.department,
  });
}

List<Student> students = [
  Student(usn: '1RV17CS001', name: 'Alice', department: 'CSE'),
  Student(usn: '1RV17CS002', name: 'Bob', department: 'CSE'),
  // Add more students
];
