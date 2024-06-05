import 'package:dashbord_flutter/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDashBord(),
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(173, 230, 229, 229)),
      debugShowCheckedModeBanner: false,
    );
  }
}
