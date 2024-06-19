import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merge/features/project/presentation/bloc/application_cubit.dart';
import 'package:merge/features/project/domain/application/entity/application.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';

class ApplicationForm extends StatefulWidget {
  final Project project;

  const ApplicationForm({required this.project, super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedFileName;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _experience;
  String? _bio;
  String? _resumeFileNameError;

  void _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      PlatformFile pickedFile = result.files.first;
      setState(() {
        _selectedFileName = pickedFile.name;
        _resumeFileNameError = null; // Clear the error message if a file is selected
      });
    }
  }

  void _applyButtonPressed() {
    if (_selectedFileName == null) {
      setState(() {
        _resumeFileNameError = 'Please select a resume file';
      });
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      context.read<ApplicationCubit>().resetState();

      final application = Application(
        firstName: _firstName!,
        lastName: _lastName!,
        email: _email!,
        experience: _experience!,
        bio: _bio!,
        resumeFileName: _selectedFileName!,
        projectId: widget.project.id, // Include projectId
      );

      context.read<ApplicationCubit>().submitApplication(application);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> formFields = [
      Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "First Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
              onSaved: (value) {
                _firstName = value;
              },
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
              onSaved: (value) {
                _lastName = value;
              },
            ),
          ),
        ],
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: "Email",
          prefixIcon: Icon(Icons.email, color: Color.fromRGBO(83, 92, 145, 1)),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
        onSaved: (value) {
          _email = value;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: "Experience",
          prefixIcon: Icon(Icons.access_time, color: Color.fromRGBO(83, 92, 145, 1)),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your experience';
          }
          return null;
        },
        onSaved: (value) {
          _experience = value;
        },
      ),
      TextFormField(
        maxLines: null,
        decoration: const InputDecoration(
          labelText: "Bio",
          hintText: "A description of yourself",
          prefixIcon: Icon(Icons.message_rounded, color: Color.fromRGBO(83, 92, 145, 1)),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your bio';
          }
          return null;
        },
        onSaved: (value) {
          _bio = value;
        },
      ),
      ListTile(
        leading: const Icon(Icons.cloud_upload_outlined, color: Color.fromRGBO(83, 92, 145, 1)),
        title: Text(_selectedFileName == null ? "Upload Resume" : _selectedFileName!),
        subtitle: _resumeFileNameError != null ? Text(_resumeFileNameError!, style: const TextStyle(color: Colors.red)) : null,
        shape: const OutlineInputBorder(borderSide: BorderSide(width: 0.67)),
        onTap: _selectFile,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Hub"),
        centerTitle: true,
      ),
      body: BlocListener<ApplicationCubit, ApplicationState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          } else if (state.applications.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Application submitted successfully!')),
            );
            context.pop(); // Navigate back after successful application
          }
        },
        child: AppForm(
          formFields: formFields,
          sectionHeaderTitle: "Apply",
          sectionHeaderSubtitle: "Fill out the details to apply",
          sectionHeaderIcon: const Icon(Icons.check_rounded, size: 45, color: Color.fromRGBO(83, 92, 145, 1)),
          buttonText: "Apply",
          onButtonPressed: _applyButtonPressed, // Callback for the Apply button
          formKey: _formKey,
        ),
      ),
    );
  }
}
