class ApplicationHistoryScreen extends StatelessWidget {
  final List<Application> applications;

  ApplicationHistoryScreen({required this.applications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application History'),
      ),
      body: ListView.builder(
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final application = applications[index];
          return ListTile(
            title: Text(application.jobTitle),
            subtitle: Text(
              'Company: ${application.companyName}\n'
              'Date: ${application.applicationDate.toLocal()}'
              '\nStatus: ${application.status}',
            ),
          );
        },
      ),
    );
  }
}
