import 'package:flutter/material.dart';

class StockOutScreen extends StatefulWidget {
  const StockOutScreen({super.key});

  @override
  State<StockOutScreen> createState() => _StockOutScreenState();
}

class _StockOutScreenState extends State<StockOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Out'),
      ),
      body: Center(
        child: Text(
          'Daftar Stock Out akan ditampilkan di sini.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
