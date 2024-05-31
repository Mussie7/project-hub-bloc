import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_hub/application/blocs/user/user_bloc.dart';
import '../../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserAuthenticated) {
              context.go('/home');
            } else if (state is UserError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: 'Login',
                  onPressed: () {
                    final email = emailController.text;
                    final password = passwordController.text;
                    context.read<UserBloc>().add(LoginRequested(email, password));
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Handle navigation to sign-up page or password reset
                  },
                  child: const Text('Don\'t have an account? Sign up'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    context.push('/admin/login'); // Navigate to Admin Login Page
                  },
                  child: const Text('Admin Login'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
