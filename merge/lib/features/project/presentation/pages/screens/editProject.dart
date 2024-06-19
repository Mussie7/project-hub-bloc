import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:merge/features/project/domain/project/entity/project.dart';
import 'package:merge/features/project/presentation/bloc/project_cubit.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';

class EditProjectForm extends StatefulWidget {
  final Project project;

  const EditProjectForm({required this.project, super.key});

  @override
  State<EditProjectForm> createState() => _EditProjectFormState();
}

class _EditProjectFormState extends State<EditProjectForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedSpecialization;
  List<String> selectedTechStacks = [];
  DateTime? selectedDate;
  String? projectName;
  String? projectDescription;
  int? intakeNumber;
  int? projectDuration;

  @override
  void initState() {
    super.initState();
    selectedSpecialization = widget.project.specialization.name;
    selectedTechStacks = widget.project.techStacks.map((e) => e.name).toList();
    selectedDate = widget.project.applicationDeadline;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _updateButtonPressed() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    _formKey.currentState?.save();
    context.read<ProjectCubit>().resetState();

    final updatedProject = widget.project.copyWith(
      projectName: projectName,
      projectDescription: projectDescription,
      specialization: Specialization.values.firstWhere((e) => e.name == selectedSpecialization),
      techStacks: selectedTechStacks.map((e) => TechStack.values.firstWhere((t) => t.name == e)).toList(),
      applicationDeadline: selectedDate!,
      intakeNumber: intakeNumber!,
      projectDurationInDays: projectDuration!,
    );

    context.read<ProjectCubit>().updateProject(updatedProject);
  }

  void _showMultiSelectDialog() async {
    List<String> selectedValues = List.from(selectedTechStacks);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Tech Stacks'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [for (TechStack techstack in widget.project.techStacks) techstack.name.toUpperCase()].map((techStack) {
                return CheckboxListTile(
                  title: Text(techStack),
                  value: selectedValues.contains(techStack),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        selectedValues.add(techStack);
                      } else {
                        selectedValues.remove(techStack);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  selectedTechStacks = selectedValues;
                });
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> formFields = [
      TextFormField(
        initialValue: widget.project.projectName,
        decoration: const InputDecoration(
          labelText: "Project Name",
          prefixIcon: Icon(
            Icons.computer,
            color: Color.fromRGBO(83, 92, 145, 1),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the project name';
          }
          return null;
        },
        onSaved: (value) {
          projectName = value;
        },
      ),
      TextFormField(
        initialValue: widget.project.projectDescription,
        maxLines: null,
        decoration: const InputDecoration(
          labelText: "Project Description",
          prefixIcon: Icon(
            Icons.info,
            color: Color.fromRGBO(83, 92, 145, 1),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the project description';
          }
          return null;
        },
        onSaved: (value) {
          projectDescription = value;
        },
      ),
      DropdownButtonFormField(
        value: selectedSpecialization,
        onChanged: (newValue) {
          setState(() {
            selectedSpecialization = newValue;
          });
        },
        items: Specialization.values
            .map((Specialization specialization) => DropdownMenuItem<String>(value: specialization.name, child: Text(specialization.name)))
            .toList(),
        decoration: const InputDecoration(
          labelText: "Select Specialization",
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.settings,
            color: Color.fromRGBO(83, 92, 145, 1),
          ),
        ),
        validator: (value) {
          if (value == null) {
            return 'Please select a specialization';
          }
          return null;
        },
        onSaved: (value) {
          selectedSpecialization = value;
        },
      ),
      ListTile(
        title: const Text("Select Tech Stacks"),
        subtitle: Text(selectedTechStacks.join(", ")),
        onTap: _showMultiSelectDialog,
      ),
      ListTile(
        title: const Text("Application Deadline"),
        subtitle: Text(selectedDate == null ? 'Select Date' : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'),
        leading: const Icon(
          Icons.calendar_today,
          color: Color.fromRGBO(83, 92, 145, 1),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: const BorderSide(width: 0.67, color: Colors.black),
        ),
        onTap: () => _selectDate(context),
      ),
      TextFormField(
        initialValue: widget.project.intakeNumber.toString(),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Intake Number",
          prefixIcon: Icon(
            Icons.people,
            color: Color.fromRGBO(83, 92, 145, 1),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the intake number';
          }
          return null;
        },
        onSaved: (value) {
          intakeNumber = int.tryParse(value ?? '');
        },
      ),
      TextFormField(
        initialValue: widget.project.projectDurationInDays.toString(),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Project Duration in Days",
          prefixIcon: Icon(
            Icons.calendar_month,
            color: Color.fromRGBO(83, 92, 145, 1),
          ),
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the project duration';
          }
          return null;
        },
        onSaved: (value) {
          projectDuration = int.tryParse(value ?? '');
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Project Hub"), centerTitle: true),
      body: BlocListener<ProjectCubit, ProjectState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          } else if (state.projects.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Project updated successfully!')),
            );
            context.pop(); // Navigate back after successful update
          }
        },
        child: AppForm(
          formFields: formFields,
          sectionHeaderTitle: "Update Project",
          sectionHeaderSubtitle: "Update project details in the form below",
          sectionHeaderIcon: const Icon(Icons.add_circle_rounded, color: Color.fromRGBO(83, 92, 145, 1), size: 45.0),
          buttonText: "Update Project",
          onButtonPressed: _updateButtonPressed,
          formKey: _formKey,
        ),
      ),
    );
  }
}
