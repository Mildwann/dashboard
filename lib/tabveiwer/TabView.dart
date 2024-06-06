import 'package:dashbord_flutter/tabveiwer/Complete.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
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
              height: height * 0.03,
              decoration: const BoxDecoration(),
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicatorWeight: 4,
                indicatorColor: const Color.fromARGB(255, 236, 192, 68),
                labelColor: const Color.fromARGB(255, 236, 192, 68),
                unselectedLabelColor: Colors.grey.shade900,
                tabs: [
                  Container(
                    child: const Tab(
                      text: 'Inprogress',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: const Tab(
                      text: 'Complete',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const Text(
                    'Inprogress Page',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    child: Complete(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
