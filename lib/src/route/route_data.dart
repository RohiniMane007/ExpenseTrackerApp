import 'package:expence_tracker/src/features/auth/presentation/view/view.dart';
import 'package:expence_tracker/src/features/expense/presentation/expense_view.dart';
import 'package:expence_tracker/src/features/splash_screen.dart';
import 'package:expence_tracker/src/route/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/expense/presentation/bloc/expense_bloc.dart';

class RouteData {
  static getRouteData(
      BuildContext context, String screenName, Map<String, dynamic> args) {
    switch (screenName) {
      case RouteNames.splashScreen:
        return const SplashScreen();

      case RouteNames.login:
        return const LoginScreen();

      case RouteNames.registration:
        return const RegistrationScreen();

      case RouteNames.expenseList:
        return BlocProvider(
          create: (context) => ExpenseBloc()..add(ExpenseListEvent()),
          child: const ExpensePage(),
        );

      case RouteNames.addExpense:
        return BlocProvider(
          // value: BlocProvider.of<ExpenseBloc>(context),
          create: (context) => ExpenseBloc(),
          child: const AddExpense(),
        );
      case RouteNames.updateExpense:
        return BlocProvider(
          // value: BlocProvider.of<ExpenseBloc>(context),
          create: (context) => ExpenseBloc(),
          child:  UpdateExpense(expense: args,),
        );

      default:
        return const Text("No route data");
    }
  }
}
