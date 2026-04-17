import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  // Constructor untuk menerima data
  final String nama, nim, prodi, semester, asal, email;

  const ProfilScreen({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.semester,
    required this.asal,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Card Foto & Nama
            Card(
              elevation: 5,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.blue.shade50],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage('https://static.wikitide.net/deathbattlewiki/1/1d/Portrait.yutaokkotsu.png'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      nama.isEmpty ? 'Nama Belum Diisi' : nama,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.blue.shade900),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      nim.isEmpty ? 'NIM Kosong' : nim,
                      style: TextStyle(fontSize: 18, color: Colors.grey.shade600, letterSpacing: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card Info Akademik
            _buildSectionCard('Detail Informasi', [
              _infoRow(Icons.school, 'Prodi', prodi),
              _infoRow(Icons.calendar_month, 'Semester', semester),
              _infoRow(Icons.map, 'Asal', asal),
              _infoRow(Icons.email_outlined, 'Email', email),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(height: 25),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, size: 22, color: Colors.blue.shade700),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
              Text(value.isEmpty ? '-' : value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}