import 'package:contactmanage/features/splash_screen/splash_screen.dart';
import 'package:contactmanage/service_register/mainBlocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dependency/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Contact Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
