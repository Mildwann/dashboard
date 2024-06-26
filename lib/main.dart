import 'package:dashbord_flutter/dashboard/view_model/dashboard_viewmodel.dart';
import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final DashboardViewmodel dashboardViewmodel = DashboardViewmodel();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDashBord(),
      theme: new ThemeData(scaffoldBackgroundColor: ColorApp.backgroundColor),
      debugShowCheckedModeBanner: false,
    );
  }
}
