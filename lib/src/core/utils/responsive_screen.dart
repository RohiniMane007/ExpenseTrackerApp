import 'dart:io';
import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen(
      {super.key,
      this.mobile = const Scaffold(
        body: Center(
          child: ListTile(
            title: Text('Please Rotate your device'),
            subtitle: Text("We do not support landscape mode"),
          ),
        ),
      ),
      this.tablet = const Scaffold(
        body: Center(
          child: ListTile(
            title: Text('Tablet'),
            subtitle: Text("We do not support landscape mode"),
          ),
        ),
      ),
      this.desktop = const Scaffold(
        body: Center(
          child: ListTile(
            title: Text('Desktop'),
            subtitle: Text("We do not support landscape mode"),
          ),
        ),
      )});
  final Widget? mobile, tablet, desktop;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height =
        MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).top;
    if (Platform.isAndroid) {
      if (width < 600) {
        return mobile!;
      } else if (width >= 840 && width <= 1340 && height <840) {
        return tablet!;
      } else {
        return desktop!;
      }
    } else {
      return const Scaffold(
          body: SizedBox(
        child: Text("Data"),
      ));
    }
    // return const Scaffold();
  }
}
