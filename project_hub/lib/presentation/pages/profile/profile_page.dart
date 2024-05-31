import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_hub/application/blocs/profile/profile_bloc.dart';
import 'package:project_hub/domain/entities/user.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io'; // Import for using File
import '../../widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  PlatformFile? selectedProfilePicture;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfile());
  }

  Future<void> pickProfilePicture() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        setState(() {
          selectedProfilePicture = result.files.first;
        });
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              final user = state.user;
              nameController.text = user.name;
              emailController.text = user.email;
              bioController.text = user.bio;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    selectedProfilePicture != null
                        ? Image.file(
                            File(selectedProfilePicture!.path!),
                            height: 100,
                            width: 100,
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            color: Colors.grey[300],
                            child: const Icon(Icons.person, size: 50),
                          ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: pickProfilePicture,
                      child: const Text('Change Profile Picture'),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: bioController,
                      decoration: const InputDecoration(
                        labelText: 'Bio/A brief description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      label: 'Save Changes',
                      onPressed: () {
                        final updatedUser = User(
                          id: user.id,
                          name: nameController.text,
                          email: emailController.text,
                          bio: bioController.text,
                          profilePicture: selectedProfilePicture?.path ?? '',
                          password: '',
                        );
                        context.read<ProfileBloc>().add(UpdateProfile(updatedUser));
                      },
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text('No profile data available.'));
          },
        ),
      ),
    );
  }
}
