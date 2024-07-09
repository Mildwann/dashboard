// ignore_for_file: no_logic_in_create_state

import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/dashboard/components/orderItemsummary.dart';
import 'package:dashbord_flutter/dashboard/components/standardsearch.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_complete_viewmodel.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_order_viewmodel.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_service_viewmodel.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_viewmodel.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard/components/ordertype.dart';
import 'package:dashbord_flutter/dashboard/tabveiwer/tabView.dart';
import 'package:dashbord_flutter/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyDashBord extends StatefulWidget {
  const MyDashBord({super.key});

  @override
  State<MyDashBord> createState() => _MyDashBordState();
}

class _MyDashBordState extends State<MyDashBord> {
  final DashboardViewmodel viewModel = getIt();
  final DashboardServiceViewmodel serviceViewmodel = getIt();
  final DashboardOrderViewmodel orderViewmodel = getIt();
  final DashboardCompleteViewmodel completeViewmodel = getIt();

  TextEditingController userIdController = TextEditingController();
  TextEditingController billingController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  @override
  void initState() {
    viewModel.getDashboard();
    serviceViewmodel.getService();
    orderViewmodel.getOrder();
    completeViewmodel.getComplete2();
    super.initState();
  }

  @override
  void dispose() {
    userIdController.dispose();
    billingController.dispose();
    departmentController.dispose();
    super.dispose();
  }

  void search() {
    serviceViewmodel.getServiceBySearch(
        departmentController.text.split(" ")[0],
        departmentController.text.split(" ")[1],
        userIdController.text,
        billingController.text);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    String convertNumber(double number) {
      if (number >= 1000) {
        return NumberFormat('#,###0.00').format(number);
      } else {
        return number.toString();
      }
    }

    String convertNodouble(int number) {
      if (number >= 1000) {
        return NumberFormat('#,###').format(number);
      } else {
        return number.toString();
      }
    }

    return ChangeNotifierProvider(
        create: (context) => serviceViewmodel,
        builder: (context, _) {
          return Scaffold(
            body: Consumer<DashboardServiceViewmodel>(
                builder: (context, viewModel, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: const Text(
                        "Dashbord",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'NT',
                            color: frontColor.black),
                      ),
                    ),

                    // StandardSearch
                    Container(
                      decoration: BoxDecoration(
                        color: ColorApp.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(41, 72, 152, 0.06),
                            offset: Offset(0, 0),
                            blurRadius: 50,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(32, 25, 20, 24),
                            child: const Text(
                              "Standard search",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NT"),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(32, 0, 32, 25),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Standardsearch(
                                  head: "User ID ",
                                  hintText: "search",
                                  icon: Icons.search,
                                  controller: userIdController,
                                ),
                                Standardsearch(
                                  head: "Billing Account (BA) ",
                                  hintText: "search",
                                  icon: Icons.search,
                                  controller: billingController,
                                ),
                                Standardsearch(
                                  head: "Calendar ",
                                  hintText: "search",
                                  icon: Icons.calendar_today_outlined,
                                  controller: departmentController,
                                ),
                              ],
                            ),
                          ),

                          // //Clear button / Search Button
                          Container(
                            padding:
                                const EdgeInsets.only(right: 32, bottom: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //Clear button
                                Container(
                                  width: 160,
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        userIdController.clear();
                                        billingController.clear();
                                        departmentController.clear();
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 241, 213, 85))),
                                      textStyle: const TextStyle(fontSize: 14),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 10, 5, 10),
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                            color: buttonColor.yellow,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                // Search Button
                                Container(
                                  width: 160,
                                  height: 35,
                                  child: ElevatedButton(
                                    onPressed: search,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: buttonColor.yellow,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 10, 5, 10),
                                      child: Text(
                                        'Search',
                                        style: TextStyle(
                                            color: ColorApp.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //Order Item Summary
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      height: 310,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: ColorApp.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(41, 72, 152, 0.06),
                                    offset: Offset(0, 0),
                                    blurRadius: 50,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Order Item Summary",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Orderitemsummary(
                                          title: "New",
                                          amount: convertNumber(orderViewmodel
                                              .summary
                                              .newSum
                                              ?.values as double),
                                          image: Assets.images.icNew.image(),
                                          total: convertNumber(orderViewmodel
                                              .summary.newSum?.items as double),
                                        )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: Orderitemsummary(
                                          title: "Provisioning",
                                          amount: convertNumber(orderViewmodel
                                              .summary
                                              .provisionningSum
                                              ?.values as double),
                                          image:
                                              Assets.images.provisoning.image(),
                                          total: convertNumber(orderViewmodel
                                              .summary
                                              .provisionningSum
                                              ?.items as double),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Orderitemsummary(
                                          title: "Billing",
                                          amount: convertNumber(orderViewmodel
                                              .summary
                                              .billingSum
                                              ?.values as double),
                                          image: Assets.images.billing.image(),
                                          total: convertNumber(orderViewmodel
                                              .summary
                                              .billingSum
                                              ?.items as double),
                                        )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: Orderitemsummary(
                                          title: "Complete",
                                          amount: convertNumber(orderViewmodel
                                              .summary
                                              .completeSum
                                              ?.values as double),
                                          image: Assets.images.complete.image(),
                                          total: convertNumber(orderViewmodel
                                              .summary
                                              .completeSum
                                              ?.items as double),
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),

                          //OrderType
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(41, 72, 152, 0.06),
                                    offset: Offset(0, 0),
                                    blurRadius: 50,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Order Type",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                      child: Ordertype(
                                    title: "New",
                                    amount: serviceViewmodel
                                                .orderType.newOrder?.values !=
                                            null
                                        ? convertNumber(serviceViewmodel
                                            .orderType.newOrder!.values!)
                                        : "0",
                                    order: serviceViewmodel
                                        .orderType.newOrder!.items
                                        .toString(),
                                    color: ColorOrderType.yellow,
                                    image: 'assets/images/newnoback.png',
                                  )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                      child: Ordertype(
                                    title: "Modify",
                                    amount: serviceViewmodel
                                                .orderType.modify?.values !=
                                            null
                                        ? convertNumber(serviceViewmodel
                                            .orderType.modify!.values!)
                                        : "0",
                                    order: serviceViewmodel
                                        .orderType.modify!.items
                                        .toString(),
                                    color: ColorOrderType.orange,
                                    image: 'assets/images/edit.png',
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Order Item
                    Container(
                      margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      height: 690,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(41, 72, 152, 0.06),
                                    offset: Offset(0, 0),
                                    blurRadius: 50,
                                    spreadRadius: 0,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              width: (width - 60) * 0.59,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order Item",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                    child: TabView(), //TabVeiw
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),

                          // Approve
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 600,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(41, 72, 152, 0.06),
                                    offset: Offset(0, 0),
                                    blurRadius: 50,
                                    spreadRadius: 0,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 30, top: 30),
                                    child: const Text(
                                      "Approve Task",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 30, top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Provisioning",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.circle,
                                                      color: Color.fromARGB(
                                                          255, 151, 102, 214),
                                                      size: 10,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "${serviceViewmodel.approveTask.provisioning.toString()} Task",
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 30, top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Package/component",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.circle,
                                                      color: Color.fromARGB(
                                                          255, 232, 143, 173),
                                                      size: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "${serviceViewmodel.approveTask.packageComponent.toString()} Task",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 40),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 30, top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Backdate",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Color.fromARGB(
                                                            255, 79, 162, 218),
                                                        size: 10,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          "${serviceViewmodel.approveTask.backdate.toString()} Task",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 350,
                                    child: Expanded(
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                          Text(
                                            "${serviceViewmodel.approveTask.totals.toString()} Task",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                          PieChart(PieChartData(sections: [
                                            PieChartSectionData(
                                                radius: 60,
                                                value: serviceViewmodel
                                                    .approveTask.backdate
                                                    ?.toDouble(),
                                                color: approveColor.blue),
                                            PieChartSectionData(
                                                radius: 60,
                                                value: serviceViewmodel
                                                    .approveTask
                                                    .packageComponent
                                                    ?.toDouble(),
                                                color: approveColor.pink),
                                            PieChartSectionData(
                                                radius: 60,
                                                value: serviceViewmodel
                                                    .approveTask.provisioning
                                                    ?.toDouble(),
                                                color: approveColor.purple)
                                          ])),
                                        ])),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }
}
