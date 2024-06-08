class Company {
  final String id;
  final String name;
  final List<Job> jobOpenings;

  Company({required this.id, required this.name, required this.jobOpenings});
}

class Job {
  final String id;
  final String title;
  final String description;
  final double ctc;
  final String eligibilityCriteria;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.ctc,
    required this.eligibilityCriteria,
  });
}
