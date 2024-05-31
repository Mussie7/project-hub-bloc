import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import '../../widgets/custom_button.dart';

class ApplicationFormPage extends StatefulWidget {
  final String projectId;

  const ApplicationFormPage({super.key, required this.projectId});

  @override
  _ApplicationFormPageState createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  PlatformFile? selectedFile;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form'),
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
              Text(
                'Apply for Project ${widget.projectId}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                controller: experienceController,
                decoration: const InputDecoration(
                  labelText: 'Experience',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio - A brief description of yourself',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: pickFile,
                child: const Text('Upload Resume'),
              ),
              selectedFile != null ? Text(selectedFile!.name) : Container(),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Submit Application',
                onPressed: () {
                  // Handle form submission
                  final applicationData = {
                    'name': nameController.text,
                    'email': emailController.text,
                    'experience': experienceController.text,
                    'bio': bioController.text,
                    'resume': selectedFile?.path,
                  };
                  // Add your form submission logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Application submitted!')),
                  );
                  context.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
