import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Student student;

  ProfileScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('USN: ${student.usn}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Name: ${student.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Semester: ${student.sem}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Section: ${student.section}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('CGPA: ${student.cgpa}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Backlogs: ${student.backlogs}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Department: ${student.dept}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Resume: ${student.resume}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
