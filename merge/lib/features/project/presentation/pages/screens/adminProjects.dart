import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/bloc/project_cubit.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void createButtonPressed() {
      context.push('/addProject');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Here Are Our Projects'),
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
                accountName: Text('Bunny bun'), // Display user name
                accountEmail: Text('Bunny.bun@example.com'), // Display user email
                currentAccountPicture: CircleAvatar(radius: 60, 
                // backgroundImage: NetworkImage('')
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
              title: const Text('Settings'),
              onTap: () {
                // Handle settings action
                context.pop(); // Close the drawer
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Handle logout action
                context.pop(); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<ProjectCubit, ProjectState>(
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
                      color: const Color.fromRGBO(255, 247, 252, 1), // Change the color here
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          project.projectName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 56, 46, 46),
                          ),
                        ),
                        subtitle: Text(
                          "${project.applicationDeadline.day}/${project.applicationDeadline.month}/${project.applicationDeadline.year}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 56, 46, 46),
                          ),
                        ),
                        // leading: Image.network(
                        //   project.imageUrl,
                        //   width: 100, // Adjust the width as needed
                        //   height: 110, // Adjust the height as needed
                        //   // Ensure the image covers the entire space
                        // ),
                        onTap: () {
                          // Existing functionality to view project details
                          context.push('/adminProjectDetail', extra: project);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          // Position the "Create Project" button at the bottom
          Positioned(
            bottom: 20.0, // Adjust the bottom padding as needed
            right: 20.0, // Adjust the right padding as needed
            child: ElevatedButton(
              onPressed: createButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(83, 92, 145, 1),
                foregroundColor: const Color.fromRGBO(238, 238, 238, 1),
              ),
              child: const Text(
                'Create',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
