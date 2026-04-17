import 'package:flutter/material.dart';
import 'detail_screen.dart';

class Prak3Screen extends StatefulWidget {
  const Prak3Screen({super.key});

  @override
  State<Prak3Screen> createState() => _Prak3ScreenState();
}

class _Prak3ScreenState extends State<Prak3Screen> {
  // Variabel State
  String _inputNama = "";
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum 3: State')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ketik Nama Anda',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // FUNGSI PALING PENTING: Mengupdate UI
                setState(() {
                  _inputNama = value;
                });
              },
            ),
            // Letakkan di dalam Column pada file prak3_screen.dart
            ElevatedButton(
              onPressed: () {
                if (_inputNama.isNotEmpty) {
                  // Navigasi sambil mengirim data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(namaDiterima: _inputNama),
                    ),
                  );
                } else {
                  // Tampilkan pesan jika input kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ketik nama dulu ya!')),
                  );
                }
              },
              child: const Text('Kirim ke Halaman Detail'),
            ),
            const SizedBox(height: 30),
            const Text('Hasil Input Real-time:'),
            Text(
              _inputNama.isEmpty ? "Belum ada input" : _inputNama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
              onPressed: () {
                setState(() {
                  _inputNama = "";
                  _controller.clear();
                });
              },
              child: const Text('Reset Input'),
            ),
          ],
        ),
      ),
    );
  }
  
}

