import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_hub/application/blocs/project/project_bloc.dart';
import '../../widgets/project_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProjectBloc>().add(FetchProjects());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          GestureDetector(
            onTap: () {
              context.push('/profile');
            },
            child: const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is ProjectLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProjectLoaded) {
            return ListView.builder(
              itemCount: state.projects.length,
              itemBuilder: (context, index) {
                final project = state.projects[index];
                return ProjectCard(
                  title: project.title,
                  description: project.description,
                  onTap: () {
                    context.push('/project/${project.id}');
                  },
                );
              },
            );
          } else if (state is ProjectError) {
            return Center(child: Text(state.error));
          }
          return const Center(child: Text('No projects available.'));
        },
      ),
    );
  }
}
