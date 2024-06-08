import 'package:flutter/material.dart';

class JobListScreen extends StatelessWidget {
  final Company company;

  JobListScreen({required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${company.name} - Job Openings'),
      ),
      body: ListView.builder(
        itemCount: company.jobOpenings.length,
        itemBuilder: (context, index) {
          final job = company.jobOpenings[index];
          return ListTile(
            title: Text(job.title),
            subtitle: Text('${job.description}\nCTC: ${job.ctc}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(job: job),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
