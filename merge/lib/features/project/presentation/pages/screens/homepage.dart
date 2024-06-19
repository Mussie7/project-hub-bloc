import 'package:flutter/material.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensure the container takes full width
        height: double.infinity, // Ensure the container takes full height
        color: const Color.fromRGBO(238, 238, 238, 1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/HOME1.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              const Text(
                'Hello!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to project hub and Free Project Application Platform!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                onPressed: () {
                  context.push('/login');
                },
                text: 'Log in',
                backgroundColor: const Color.fromRGBO(83, 92, 145, 1),
                textColor: Colors.white,
              ),
              const SizedBox(height: 10),
              CustomElevatedButton(
                onPressed: () {
                  context.push('/adminProjects');
                },
                text: 'Log in as admin',
                backgroundColor: const Color.fromRGBO(83, 92, 145, 1),
                textColor: Colors.white,
              ),
              const SizedBox(height: 20), // Add bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
