import 'package:expence_tracker/src/route/route_data.dart';
import 'package:expence_tracker/src/route/route_names.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';

class AppRoutes {
  static Route<dynamic> generatedRoutes(RouteSettings settings) {
    Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
    // final args = settings.arguments;
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                RouteData.getRouteData(context, RouteNames.splashScreen, {}));

      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                RouteData.getRouteData(context, RouteNames.login, {}));

      case RouteNames.registration:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                RouteData.getRouteData(context, RouteNames.registration, {}));

      case RouteNames.expenseList:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                RouteData.getRouteData(context, RouteNames.expenseList, {}));

      case RouteNames.addExpense:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                RouteData.getRouteData(context, RouteNames.addExpense, {}));

      case RouteNames.updateExpense:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                RouteData.getRouteData(context, RouteNames.updateExpense, args!));
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
