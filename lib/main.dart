import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/api_service.dart';
import 'data/services/storage_service.dart';
import 'presentation/cubit/auth_cubit.dart';
import 'router.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final api = ApiService();
  final storage = StorageService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit(api, storage)..checkLogin();

    return BlocProvider.value(
      value: authCubit,
      child: MaterialApp.router(
        title: 'Inventory Management System',
        routerConfig: AppRouter.router(authCubit),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
