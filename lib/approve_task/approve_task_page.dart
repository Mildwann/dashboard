// ignore_for_file: avoid_print

import 'package:dashbord_flutter/approve_task/components/dropdown.dart';

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
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    orderIdController.dispose();
    taskTypeController.dispose();
    approveStatusController.dispose();
    descriptionController.dispose();
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
    _approveViewModel.eventBus.on().listen((event) {
      if (event is ApproveError) {
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
      } else if (event is ApproveSuccess) {
        Navigator.pop(context);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("success"),
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
      }
    });

    _approveViewModel.getApprove2();
    _approveViewModel.getAppStatus();
    // _approveViewModel.getupdateList(descriptionController.text,);
    // Navigator.of(context).pop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (context) => _approveViewModel,
        builder: (context, _) {
          return Scaffold(
            body: Consumer<ApproveViewModel>(builder: (context, viewModel, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Approve Task",
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w700),
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
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700),
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
                                  selectedItem: _approveViewModel.selectedTask,
                                  callback: (value) => _approveViewModel
                                      .setDropDownTaskType(value),
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
                                Expanded(
                                  child: DropdownApprove(
                                    controller: approveStatusController,
                                    listItem: _approveViewModel.item,
                                    selectedValue: _approveViewModel.showData,
                                    callback: (value) {
                                      _approveViewModel
                                          .setApproveDropdown(value);
                                    },
                                  ),
                                )
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
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        orderIdController.clear();
                                      });
                                      _approveViewModel.setDropdownDefault();
                                    },
                                    child: const Text('Clear',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Color(0xFFFECE00))),
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
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                    onPressed: () {
                                      _approveViewModel.getSearch2(
                                        approveStatusController.text,
                                        _approveViewModel.selectedTask ?? "",
                                        orderIdController.text,
                                      );
                                    },
                                    child: const Text(
                                      'Search',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
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
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 42,
                              width: width * 0.08,
                              child: OutlinedButton(
                                style: (_approveViewModel.itemSearch ?? [])
                                        .where((e) => e.isSelected == true)
                                        .toList()
                                        .isEmpty
                                    ? OutlinedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 197, 195, 195),
                                        side: const BorderSide(
                                            width: 1,
                                            color: Color.fromARGB(
                                                255, 197, 195, 195)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        enabledMouseCursor:
                                            SystemMouseCursors.forbidden)
                                    : OutlinedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFFECE00),
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFFFECE00)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                onPressed: () {
                                  if ((_approveViewModel.itemSearch ?? [])
                                      .where((e) => e.isSelected == true)
                                      .toList()
                                      .isEmpty) {
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => closeTask(
                                        approve: (desp, date) {
                                          _approveViewModel.getupdateList(
                                            desp,
                                            date,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Approve',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
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
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
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
                        child: TableTask(_approveViewModel),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}
