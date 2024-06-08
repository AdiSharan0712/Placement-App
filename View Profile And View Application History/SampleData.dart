Student currentStudent = Student(
  usn: '1RV19CS001',
  name: 'John Doe',
  sem: '8',
  section: 'A',
  cgpa: 8.5,
  backlogs: 0,
  dept: 'Computer Science',
  resume: 'john_doe_resume.pdf',
);

List<Application> applications = [
  Application(
    jobId: '1',
    jobTitle: 'Software Engineer',
    companyName: 'Company A',
    applicationDate: DateTime(2024, 5, 10),
    status: 'Applied',
  ),
  Application(
    jobId: '2',
    jobTitle: 'Data Analyst',
    companyName: 'Company B',
    applicationDate: DateTime(2024, 5, 12),
    status: 'Rejected',
  ),
  // Add more applications
];
