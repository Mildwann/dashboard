import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/constants/ColorApp.dart';
import 'package:dashbord_flutter/dashboard/view_model/dashboard_service_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inprogress extends StatefulWidget {
  const Inprogress({super.key});

  @override
  State<Inprogress> createState() => _InprogressState();
}

class _InprogressState extends State<Inprogress> {
  final DashboardServiceViewmodel dashboardOrderViewmodel = getIt();

  @override
  void initState() {
    dashboardOrderViewmodel.getOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => dashboardOrderViewmodel,
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.only(top: 30),
          child: Consumer<DashboardServiceViewmodel>(
            builder: (context, viewModel, _) {
              return dashboardOrderViewmodel.isLoadingOrderItem
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildSection(
                            "Over Due :",
                            "${dashboardOrderViewmodel.inprogress.overDue?.totalItem} Item",
                            {
                              "newItem": dashboardOrderViewmodel
                                  .inprogress.overDue!.newItem as double,
                              "provisioningItem": dashboardOrderViewmodel
                                  .inprogress
                                  .overDue!
                                  .provisioningItem as double,
                              "billingItem": dashboardOrderViewmodel
                                  .inprogress.overDue!.billingItem as double,
                            }),
                        buildSection(
                            "At Risk :",
                            "${dashboardOrderViewmodel.inprogress.atRisk?.totalItem} Item",
                            {
                              "newItem": dashboardOrderViewmodel
                                  .inprogress.atRisk!.newItem as double,
                              "provisioningItem": dashboardOrderViewmodel
                                  .inprogress
                                  .atRisk!
                                  .provisioningItem as double,
                              "billingItem": dashboardOrderViewmodel
                                  .inprogress.atRisk!.billingItem as double,
                            }),
                        buildSection(
                            "Due This week :",
                            "${dashboardOrderViewmodel.inprogress.dueThisWeek?.totalItem} Item",
                            {
                              "newItem": dashboardOrderViewmodel
                                  .inprogress.dueThisWeek!.newItem as double,
                              "provisioningItem": dashboardOrderViewmodel
                                  .inprogress
                                  .dueThisWeek!
                                  .provisioningItem as double,
                              "billingItem": dashboardOrderViewmodel.inprogress
                                  .dueThisWeek!.billingItem as double,
                            }),
                        buildSection(
                            "Due This month :",
                            "${dashboardOrderViewmodel.inprogress.dueThisMonth?.totalItem} Item",
                            {
                              "newItem": dashboardOrderViewmodel
                                  .inprogress.dueThisMonth!.newItem as double,
                              "provisioningItem": dashboardOrderViewmodel
                                  .inprogress
                                  .dueThisMonth!
                                  .provisioningItem as double,
                              "billingItem": dashboardOrderViewmodel.inprogress
                                  .dueThisMonth!.billingItem as double,
                            }),
                      ],
                    );
            },
          ),
        );
      },
    );
  }

  Widget buildSection(String title, String item, Map<String, double> dataMap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                item,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CombinedValueBarChart(dataMap: dataMap),
        ],
      ),
    );
  }
}

class CombinedValueBarChart extends StatelessWidget {
  final Map<String, double> dataMap;

  CombinedValueBarChart({super.key, required this.dataMap});

  @override
  Widget build(BuildContext context) {
    // Calculate total sum of values
    double totalSum =
        dataMap.values.fold(0, (previous, current) => previous + current);

    return Column(
      children: [
        Row(
          children: dataMap.entries.map((entry) {
            double percentage =
                totalSum != 0 ? entry.value / totalSum : 1 / dataMap.length;
            return Expanded(
              flex: (percentage * 100).toInt(),
              child: Container(
                height: 22,
                decoration: BoxDecoration(
                  color: _getColorForEntry(entry.key),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(
                        dataMap.keys.first == entry.key ? 40 : 0),
                    right: Radius.circular(
                        dataMap.keys.last == entry.key ? 40 : 0),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${entry.value}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Color _getColorForEntry(String key) {
    switch (key) {
      case 'newItem':
        return orderItem.yellow;
      case 'provisioningItem':
        return orderItem.purple;
      case 'billingItem':
        return orderItem.blue;
      default:
        return Colors.grey;
    }
  }
}
