import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/bloc/application_cubit.dart';

class ProjectDetail2 extends StatelessWidget {
  final Project project;

  const ProjectDetail2(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.projectName),
      ),
      body: BlocListener<ApplicationCubit, ApplicationState>(
        listener: (context, state) {
          // if (state.errorMessage != null) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text(state.errorMessage!)),
          //   );
          // } else if (state.applications.isNotEmpty) {
          //   // Handle successful application submission or any success scenario
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text('Application action successful!')),
          //   );
          // }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle project click
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: double.infinity,
                        // child: Image.network(
                        //   project.imageUrl,
                        //   height: 300,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: Text(
                              project.projectName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildListItem('Deadline:', "${project.applicationDeadline.day}/${project.applicationDeadline.month}/${project.applicationDeadline.year}"),
                _buildListItem('Description:', project.projectDescription),
                _buildListItem('Specialization:', project.specialization.name.toUpperCase()),
                _buildListItem('Tech Stacks:',
                    [for (TechStack techstack in project.techStacks) techstack.name.toUpperCase()].reduce((value, element) => "$value, $element")),
                _buildListItem('Duration:', "${project.projectDurationInDays.toString()} Days"),
                _buildListItem('Intake:', "${project.intakeNumber.toString()} Individuals"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the application form page when the "Apply" button is clicked
                    context.push('/createApplication', extra: project);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(83, 92, 145, 1),
                    foregroundColor: const Color.fromRGBO(238, 238, 238, 1),
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  child: const Text('Apply'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
