import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_button.dart';

class CreateProjectPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  final TextEditingController intakeNumberController = TextEditingController();
  final TextEditingController techStackController = TextEditingController();

  CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Project'),
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
                label: 'Create Project',
                onPressed: () {
                  // Handle project creation logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Project created!')),
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
