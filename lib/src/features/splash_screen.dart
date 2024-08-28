import 'package:expence_tracker/src/features/auth/presentation/view/view.dart';
import 'package:expence_tracker/src/route/route_data.dart';
import 'package:expence_tracker/src/route/route_names.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'expense/presentation/bloc/expense_bloc.dart';
import 'expense/presentation/expense_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => const LoginScreen()));
    Navigator.pushReplacementNamed(context, RouteNames.login); 
      // RouteData.getRouteData(context, RouteNames.login, {});   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.lightBlue[50],
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
