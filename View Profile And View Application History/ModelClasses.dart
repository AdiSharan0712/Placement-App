class Student {
  final String usn;
  final String name;
  final String sem;
  final String section;
  final double cgpa;
  final int backlogs;
  final String dept;
  final String resume;

  Student({
    required this.usn,
    required this.name,
    required this.sem,
    required this.section,
    required this.cgpa,
    required this.backlogs,
    required this.dept,
    required this.resume,
  });
}

class Application {
  final String jobId;
  final String jobTitle;
  final String companyName;
  final DateTime applicationDate;
  final String status;

  Application({
    required this.jobId,
    required this.jobTitle,
    required this.companyName,
    required this.applicationDate,
    required this.status,
  });
}
