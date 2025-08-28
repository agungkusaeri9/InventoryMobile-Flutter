import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/api_service.dart';
import 'data/services/storage_service.dart';
import 'presentation/cubit/auth_cubit.dart';
import 'router.dart';

void main() {
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
        title: 'Flutter Simple Login',
        routerConfig: AppRouter.router(authCubit),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
