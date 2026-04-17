import 'package:flutter/material.dart';
import 'auth/registration_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, 
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      // Aplikasi dimulai dari halaman Registrasi
      home: Scaffold(
        appBar: AppBar(title: const Text('MNIrvan App - Register')),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: RegistrationForm(),
          ),
        ),
      ),
    );
  }
}