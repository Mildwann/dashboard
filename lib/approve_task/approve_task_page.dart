// ignore_for_file: avoid_print

import 'package:dashbord_flutter/approve_task/view_model/searchinquire_viewmodel.dart';

import '../constants/app_import.dart';

class ApproveTaskPage extends StatefulWidget {
  const ApproveTaskPage({super.key});

  @override
  State<ApproveTaskPage> createState() => _ApproveTaskPageState();
}

class _ApproveTaskPageState extends State<ApproveTaskPage> {
  final TextEditingController orderIdController = TextEditingController();
  final TextEditingController taskTypeController = TextEditingController();
  final TextEditingController approveStatusController = TextEditingController();

  @override
  void dispose() {
    orderIdController.dispose();
    taskTypeController.dispose();
    approveStatusController.dispose();

    super.dispose();
  }

  final List<String> types = [
    'Provisioning',
    'Package/Component Approve',
  ];

  void showData() {
    print(taskTypeController.text);
    print(orderIdController.text);
    print(approveStatusController.text);
  }

  String? selectedValue;
  final ApproveViewModel _approveViewModel = getIt();
  final SearchinquireViewmodel _searchinquireViewmodel = getIt();
  @override
  void initState() {
    _approveViewModel.eventBus.on<ApproveError>().listen((event) {
      print(event.error);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: Text(event.error.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
    _approveViewModel.setDropdown();
    _approveViewModel.getApprove2();
    _searchinquireViewmodel.getSearch2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                width: width,
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
                          inputType: TypeInput.itemDropDown,
                          controller: taskTypeController,
                        ),
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
                          dropdownList: _approveViewModel.setDropdown(),
                          inputType: TypeInput.itemDropDown,
                          controller: approveStatusController,
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
                          width: width * 0.1,
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
                          width: width * 0.1,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFFFECE00),
                              side: const BorderSide(
                                  width: 1, color: Color(0xFFFECE00)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: showData,
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
              Container(
                margin: const EdgeInsets.only(top: 24),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Result",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 42,
                      width: width * 0.08,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFFECE00),
                          side: const BorderSide(
                              width: 1, color: Color(0xFFFECE00)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const closeTask(),
                          );
                        },
                        child: const Text(
                          'Approve',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    SizedBox(
                      height: 42,
                      width: width * 0.08,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFFECE00),
                          side: const BorderSide(
                              width: 1, color: Color(0xFFFECE00)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'close',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFFCB600)),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 1533,
                width: double.infinity,
                child: const TableTask(),
              ),
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
