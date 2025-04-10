import 'package:flutter/material.dart';
import 'package:yourinsta/utils.dart/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout({super.key,required this.webScreen, required this.mobileScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // Web Screen
        return webScreen;
      } else {
        // Mobile Screen
        return mobileScreen;
      }
    });
  }
}