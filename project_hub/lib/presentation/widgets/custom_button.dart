import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF535C91), // Main color
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white)));
  }
}
