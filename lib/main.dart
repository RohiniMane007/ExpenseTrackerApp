import 'package:expence_tracker/src/features/splash_screen.dart';
import 'package:flutter/material.dart';

// import 'src/core/database/database_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            primary: Colors.green,
          ),
          useMaterial3: true,
        ),
        home:
            const SplashScreen() 
        );
  }
}
