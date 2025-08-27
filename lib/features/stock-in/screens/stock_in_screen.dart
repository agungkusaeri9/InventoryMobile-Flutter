import 'package:flutter/material.dart';

class StockInScreen extends StatefulWidget {
  const StockInScreen({super.key});

  @override
  State<StockInScreen> createState() => _StockInScreenState();
}

class _StockInScreenState extends State<StockInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock In'),
      ),
      body: Center(
        child: Text(
          'Daftar Stock In akan ditampilkan di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
