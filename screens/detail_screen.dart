import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // Variabel untuk menampung data yang dikirim
  final String namaDiterima;

  // Constructor untuk menerima data
  const DetailScreen({super.key, required this.namaDiterima});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Data yang dikirim dari halaman utama:'),
            Text(
              namaDiterima,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}