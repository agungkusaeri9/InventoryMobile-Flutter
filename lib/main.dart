import 'package:flutter/material.dart';
import 'package:inventory_mobile_app/features/auth/screens/login_screen.dart';
import 'package:inventory_mobile_app/features/auth/screens/register_screen.dart';
import 'package:inventory_mobile_app/features/barang/screens/barang_list_screen.dart';
import 'package:inventory_mobile_app/features/home/screens/home_screen.dart';
import 'package:inventory_mobile_app/features/profile/screens/profile_screen.dart';
import 'package:inventory_mobile_app/features/stock-in/screens/stock_in_screen.dart';
import 'package:inventory_mobile_app/features/stock-out/screens/stock_out_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        '/login': (_) => LoginScreen(),
        '/register': (_) => RegisterScreen(),
        '/home': (_) => HomeScreen(),
        '/barang/list': (_) => BarangListScreen(),
        '/stock-in': (_) => StockInScreen(),
        '/stock-out': (_) => StockOutScreen(),
        '/profile': (_) => ProfileScreen()
      },
    );
  }
}
