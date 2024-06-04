class Company {
  final String name;
  final List<JobOpening> jobOpenings;

  Company({required this.name, required this.jobOpenings});
}

class JobOpening {
  final String title;
  final String description;
  final String ctc;

  JobOpening({required this.title, required this.description, required this.ctc});
}
