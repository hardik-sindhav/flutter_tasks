// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks/api_repository/api_repository.dart';
import 'package:flutter_tasks/bloc/repos_bloc.dart';
import 'package:flutter_tasks/bloc/search_bloc.dart';
import 'package:flutter_tasks/bloc/users_bloc.dart';
import 'package:flutter_tasks/pages/splash_page.dart';

ApiRepository apiRepository = ApiRepository();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => UsersBloc(),
      ),
      BlocProvider(
        create: (context) => ReposBloc(),
      ),
      BlocProvider(
        create: (context) => SearchBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
