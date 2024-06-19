import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/bloc/project_cubit.dart';

class ProjectScreen2 extends StatelessWidget {
  const ProjectScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 134, 136, 116),
        title: const Text(
          'Hey Brad,',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, top: 8), // Adjust padding here
              child: const UserAccountsDrawerHeader(
                accountName: Text('John Ocean'), // Display user name
                accountEmail: Text('john.ocean@example.com'), // Display user email
                currentAccountPicture: CircleAvatar(
                  radius: 60,
                  // backgroundImage: NetworkImage('data:image/jpeg;base64,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'),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Handle home action
                context.pop(); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Review'),
              onTap: () {
                context.push('review');
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                context.push('/home');
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Handle settings action
                context.pop(); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProjectCubit, ProjectState>(
        builder: (context, state) {
          if (state.errorMessage != null) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          }

          if (state.projects.isEmpty) {
            return const Center(
              child: Text('No projects available.'),
            );
          }

          return ListView.builder(
            itemCount: state.projects.length,
            itemBuilder: (context, index) {
              Project project = state.projects[index];
              return Container(
                height: MediaQuery.of(context).size.height * 0.2, // Adjust the height as needed
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.cyan, // Change the color here
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      project.projectName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "${project.applicationDeadline.day}/${project.applicationDeadline.month}/${project.applicationDeadline.year}",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    // leading: Image.network(
                    //   project.imageUrl,
                    //   width: 100, // Adjust the width as needed
                    //   height: 110, // Adjust the height as needed
                    //   // Ensure the image covers the entire space
                    // ),
                    onTap: () {
                      context.push('/userProjectDetail', extra: project);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
