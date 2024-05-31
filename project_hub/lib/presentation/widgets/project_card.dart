import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ProjectCard({super.key, 
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}
