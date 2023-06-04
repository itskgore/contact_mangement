import 'dart:async';

import 'package:contactmanage/core/navigator/app_navigator.dart';
import 'package:contactmanage/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startTime() async {
    var _duration = const Duration(seconds: 1);
    Timer(_duration, () {
      cupertinoNavigator(
          context: context,
          screenName: const DashboardScreen(),
          type: NavigatorType.PUSHREMOVEUNTIL);
    });
  }

  @override
  void initState() {
    _startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 300,
        ),
      ),
    );
  }
}
