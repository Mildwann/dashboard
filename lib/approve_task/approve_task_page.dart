// ignore_for_file: unused_field
import 'package:dashbord_flutter/approve_task/components/ItemSeach.dart';
import 'package:dashbord_flutter/approve_task/app_injector.dart';
import 'package:dashbord_flutter/constants/MyIcons.dart';
import 'package:dashbord_flutter/approve_task/view_model/approve_view_model.dart';
import 'package:flutter/material.dart';

class ApproveTaskPage extends StatefulWidget {
  const ApproveTaskPage({super.key});

  @override
  State<ApproveTaskPage> createState() => _ApproveTaskPageState();
}

class _ApproveTaskPageState extends State<ApproveTaskPage> {
  final TextEditingController orderIdController = TextEditingController();
  final TextEditingController approvalStatusController =
      TextEditingController();
  String orderid = "";
  String approval = "";

  @override
  void dispose() {
    orderIdController.dispose();
    approvalStatusController.dispose();
    super.dispose();
  }

  final List<String> types = [
    'Provisioning',
    'Package/Component Approve',
  ];
  String? selectedValue;
  final ApproveViewModel _approveViewModel = getIt();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Approve Task",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                padding: const EdgeInsets.all(60),
                width: MediaQuery.of(context).size.width,
                decoration: primaryBorder(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Standard search",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      children: [
                        ItemSearch(
                            title: "Task type",
                            dropdownList: types,
                            inputType: TypeInput.itemDropDown),
                        const SizedBox(
                          width: 20,
                        ),
                        ItemSearch(
                          title: "Order ID",
                          inputType: TypeInput.itemTextField,
                          controller: orderIdController,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ItemSearch(
                          title: "Approval Status",
                          inputType: TypeInput.itemTextField,
                          controller: approvalStatusController,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 42,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFFECE00)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                orderIdController.clear();
                                approvalStatusController.clear();
                                orderid = "";
                                approval = "";
                                selectedValue = null;
                              });
                            },
                            child: const Text('Clear',
                                style: TextStyle(
                                    fontSize: 22, color: Color(0xFFFECE00))),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        SizedBox(
                          height: 42,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFFFECE00),
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFFECE00)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              setState(() {
                                orderid = orderIdController.text;
                                approval = approvalStatusController.text;
                              });
                            },
                            child: const Text(
                              'Search',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text("OrderID: $orderid"),
              Text("Approval : $approval"),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class itemSearch extends StatelessWidget {
  final String title;
  final Widget? widget;

  const itemSearch(this.title, {this.widget, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: primaryBorder(radius: 12),
          height: 30,
          child: widget,
        )
      ],
    );
  }
}
