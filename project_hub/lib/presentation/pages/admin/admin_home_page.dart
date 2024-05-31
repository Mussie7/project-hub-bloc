import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/project_card.dart';

class AdminHomePage extends StatelessWidget {
  final List<Map<String, String>> projects = const [
    {
      'id': '1',
      'title': 'Project 1',
      'description': 'Description of Project 1',
    },
    {
      'id': '2',
      'title': 'Project 2',
      'description': 'Description of Project 2',
    },
  ];

  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/admin/create_project');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return ProjectCard(
            title: project['title']!,
            description: project['description']!,
            onTap: () {
              context.push('/admin/edit_project/${project['id']}');
            },
          );
        },
      ),
    );
  }
}
