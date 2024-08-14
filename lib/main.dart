// import 'package:expence_tracker/src/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'src/core/utils/responsive_screen.dart';
import 'src/features/expense/presentation/bloc/expense_bloc.dart';
import 'src/features/splash_screen.dart';
// import 'src/features/auth/presentation/view/login_screen.dart';

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
    return BlocProvider(
      create: (context) => ExpenseBloc()..add(ExpenseListEvent()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
             
            // primarySwatch: Colors.blue,
            colorScheme: ColorScheme.fromSeed(
              
              seedColor: Colors.blue,
              brightness: Brightness.dark
            ),
            useMaterial3: true,
          ),
          home: //const ResponsiveScreen()
              const SplashScreen()),
    );
  }
}
