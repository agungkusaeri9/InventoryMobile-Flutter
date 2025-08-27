import 'package:flutter/material.dart';
import 'package:inventory_mobile_app/features/auth/controllers/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name")),
            TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: "Username")),
            TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email")),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                auth.register(nameController.text, usernameController.text,
                    emailController.text, passwordController.text);
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
