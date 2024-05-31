import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_button.dart';

class ProjectDetailsPage extends StatelessWidget {
  final String projectId;

  const ProjectDetailsPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    // For demonstration, we'll use dummy data. In a real application, you would fetch this data from a repository or API.
    final project = {
      'id': projectId,
      'title': 'Project $projectId',
      'description': 'Detailed description of Project $projectId',
      'applicationDeadline': '2024-12-31',
      'intakeNumber': '5',
      'techStack': ['Flutter', 'Dart', 'Firebase'],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project['title'] as String,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(project['description'] as String),
            const SizedBox(height: 10),
            Text('Application Deadline: ${project['applicationDeadline']}'),
            const SizedBox(height: 10),
            Text('Intake Number: ${project['intakeNumber']}'),
            const SizedBox(height: 10),
            Text('Tech Stack: ${(project['techStack'] as List<String>).join(', ')}'),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Apply Now',
              onPressed: () {
                context.push('/apply/$projectId');
              },
            ),
          ],
        ),
      ),
    );
  }
}
