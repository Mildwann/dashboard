import 'package:flutter/material.dart';
import './complete.dart';
import './inprogress.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 30,
              decoration: const BoxDecoration(),
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(right: 35),
                indicatorWeight: 4,
                indicatorColor: const Color.fromARGB(255, 236, 192, 68),
                labelColor: const Color.fromARGB(255, 236, 192, 68),
                unselectedLabelColor: Colors.grey.shade900,
                tabs: const [
                  Tab(
                    text: 'Inprogress',
                  ),
                  Tab(
                    text: 'Complete',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Inprogress(), // Use the Inprogress widget here
                  Complete(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
