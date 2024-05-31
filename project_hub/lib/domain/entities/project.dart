class Project {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime applicationDeadline;
  final int intakeNumber;
  final List<String> techStack;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.applicationDeadline,
    required this.intakeNumber,
    required this.techStack,
  });
}
