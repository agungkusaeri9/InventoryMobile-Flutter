import 'package:flutter/material.dart';

class BarangListScreen extends StatefulWidget {
  const BarangListScreen({super.key});

  @override
  State<BarangListScreen> createState() => _BarangListScreenState();
}

class _BarangListScreenState extends State<BarangListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang List'),
      ),
      body: Center(
        child: Text(
          'Daftar Barang akan ditampilkan di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
