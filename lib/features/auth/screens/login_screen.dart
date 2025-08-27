import 'package:flutter/material.dart';
import 'package:inventory_mobile_app/features/auth/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthController();

  bool _isLoading = false;

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true);

    try {
      final response = await auth.login(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );

      // Jika berhasil, arahkan ke halaman berikutnya (misal dashboard)
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/home');
        // ganti '/dashboard' dengan route yang sesuai
      }
    } catch (e) {
      // Tampilkan snackbar saat error
      print("Login gagal: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _handleLogin,
                    child: Text("Login"),
                  ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("Belum punya akun? Daftar"),
            )
          ],
        ),
      ),
    );
  }
}
