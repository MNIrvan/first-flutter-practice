import 'package:flutter/material.dart';
import '../auth/login.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // 1. Controller & State Variables
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _isFormValid = false;

  // 2. Logic Validasi Real-time
  void _validateForm() {
    setState(() {
      _isFormValid = _nameController.text.isNotEmpty &&
          _emailController.text.contains('@') &&
          _passwordController.text.length >= 6;
    });
  }

  // 3. Logic Submit (Simulasi Network Call)
  void _submitForm() async {
    setState(() => _isLoading = true);

    // Simulasi delay 2 detik
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Akun Berhasil Dibuat! Silakan Login.')),
        );
        
        // Pindah ke halaman Login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }

    Navigator.pushNamed(
      context, 
      '/profil',
      arguments: {
        'nama': _nameController.text,
        'email': _emailController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Form Registrasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Name Input
            TextField(
              controller: _nameController,
              onChanged: (_) => _validateForm(),
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Email Input
            TextField(
              controller: _emailController,
              onChanged: (_) => _validateForm(),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Password Input dengan Toggle
            TextField(
              controller: _passwordController,
              onChanged: (_) => _validateForm(),
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Submit Button dengan Loading State
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: (_isFormValid && !_isLoading) ? _submitForm : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                    : const Text('Register Now'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}