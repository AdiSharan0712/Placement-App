class JobDetailScreen extends StatelessWidget {
  final Job job;

  JobDetailScreen({required this.job});

  bool checkEligibility(String criteria) {
    // Implement your eligibility check logic here
    return criteria == 'CGPA > 6.0'; // Placeholder logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${job.title}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Description: ${job.description}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('CTC: ${job.ctc}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Eligibility Criteria: ${job.eligibilityCriteria}', style: TextStyle(fontSize: 16)),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (checkEligibility(job.eligibilityCriteria)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Application submitted successfully!')),
                  );
                  // Perform the application submission logic here
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You do not meet the eligibility criteria.')),
                  );
                }
              },
              child: Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
