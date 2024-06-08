import 'package:flutter/material.dart';

class ManageJobOpeningsScreen extends StatefulWidget {
  @override
  _ManageJobOpeningsScreenState createState() => _ManageJobOpeningsScreenState();
}

class _ManageJobOpeningsScreenState extends State<ManageJobOpeningsScreen> {
  void _addJobOpening() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateEditJobOpeningScreen(),
      ),
    );
  }

  void _editJobOpening(JobOpening jobOpening) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateEditJobOpeningScreen(jobOpening: jobOpening),
      ),
    );
  }

  void _deleteJobOpening(JobOpening jobOpening) {
    setState(() {
      jobOpenings.remove(jobOpening);
    });
  }

  void _toggleJobOpeningStatus(JobOpening jobOpening) {
    setState(() {
      jobOpening.disabled = !jobOpening.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Job Openings'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addJobOpening,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: jobOpenings.length,
        itemBuilder: (context, index) {
          final jobOpening = jobOpenings[index];
          return ListTile(
            title: Text(jobOpening.title),
            subtitle: Text('CTC: ${jobOpening.ctc}\n${jobOpening.description}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editJobOpening(jobOpening),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteJobOpening(jobOpening),
                ),
                IconButton(
                  icon: jobOpening.disabled ? Icons.toggle_off : Icons.toggle_on,
                  onPressed: () => _toggleJobOpeningStatus(jobOpening),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
