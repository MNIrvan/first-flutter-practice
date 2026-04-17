import 'package:flutter/material.dart';
import 'profil_screen.dart'; // Import agar bisa mengirim data ke Profil

class InputBiodataScreen extends StatefulWidget {
  const InputBiodataScreen({super.key});

  @override
  State<InputBiodataScreen> createState() => _InputBiodataScreenState();
}

class _InputBiodataScreenState extends State<InputBiodataScreen> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _prodiController = TextEditingController();
  final _semesterController = TextEditingController();
  final _asalController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lengkapi Biodata'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField(_namaController, 'Nama Lengkap', Icons.person),
            _buildTextField(_nimController, 'NIM', Icons.badge),
            _buildTextField(_prodiController, 'Program Studi', Icons.school),
            _buildTextField(_semesterController, 'Semester', Icons.calendar_today),
            _buildTextField(_asalController, 'Asal Kota', Icons.location_on),
            _buildTextField(_emailController, 'Email', Icons.email),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilScreen(
                        nama: _namaController.text,
                        nim: _nimController.text,
                        prodi: _prodiController.text,
                        semester: _semesterController.text,
                        asal: _asalController.text,
                        email: _emailController.text,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle),
                label: const Text('Simpan & Lihat Profil', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}