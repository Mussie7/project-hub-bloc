import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_button.dart';

class EditProjectPage extends StatelessWidget {
  final String projectId;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController intakeNumberController = TextEditingController();
  final TextEditingController techStackController = TextEditingController();

  EditProjectPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    // For demonstration, we'll use dummy data. In a real application, you would fetch this data from a repository or API.
    titleController.text = 'Project $projectId';
    descriptionController.text = 'Description of Project $projectId';
    deadlineController.text = '2024-12-31';
    intakeNumberController.text = '5';
    techStackController.text = 'Flutter, Dart, Firebase';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Project'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: deadlineController,
                decoration: const InputDecoration(
                  labelText: 'Application Deadline',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: intakeNumberController,
                decoration: const InputDecoration(
                  labelText: 'Intake Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: techStackController,
                decoration: const InputDecoration(
                  labelText: 'Tech Stack',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Save Changes',
                onPressed: () {
                  // Handle project update logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Project updated!')),
                  );
                  context.push('/admin/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
