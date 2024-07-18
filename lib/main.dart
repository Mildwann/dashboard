import 'constants/app_import.dart';

void main() {
  configureDependencies();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final DashboardServiceViewmodel dashboardViewmodel =
      DashboardServiceViewmodel();
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ApproveTaskPage(),
      theme: ThemeData(scaffoldBackgroundColor: ColorApp.backgroundColor),
      debugShowCheckedModeBanner: false,
    );
  }
}
