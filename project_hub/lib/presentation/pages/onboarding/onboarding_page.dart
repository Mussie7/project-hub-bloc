import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_hub/presentation/widgets/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                children: const [
                  OnboardingStep(
                    title: 'Welcome to Project Hub',
                    description: 'Find and apply for projects easily.',
                    imagePath: 'assets/images/onboarding1.jpg',
                  ),
                  OnboardingStep(
                    title: 'Manage Your Profile',
                    description: 'Keep your profile up-to-date.',
                    imagePath: 'assets/images/onboarding2.jpg',
                  ),
                  OnboardingStep(
                    title: 'Track Your Applications',
                    description: 'View and manage your project applications.',
                    imagePath: 'assets/images/onboarding3.jpg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: 'Get Started',
              onPressed: () {
                context.push('/login');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class OnboardingStep extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingStep({super.key, 
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
