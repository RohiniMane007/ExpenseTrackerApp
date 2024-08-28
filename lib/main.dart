import 'package:expence_tracker/src/route/route_names.dart';
import 'package:flutter/material.dart';
import 'src/route/app_routes.dart';

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
          // primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            // primary: Colors.white
            // brightness: Brightness.dark
          ),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: AppRoutes.generatedRoutes,);
  }
}
