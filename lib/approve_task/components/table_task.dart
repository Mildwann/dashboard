import 'package:dashbord_flutter/close_task/closeTask.dart';
import 'package:flutter/material.dart';

class TableTask extends StatefulWidget {
  const TableTask({Key? key}) : super(key: key);

  @override
  State<TableTask> createState() => _TableTaskState();
}

class _TableTaskState extends State<TableTask> {
  final Map<String, String> _data = {
    "Subject":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...",
    "Order ID": "xxxxxxxxx",
    "Date Due": "2023-10-26",
    "Status": "open",
    "User ID": "--",
  };

  late List<bool> selectedRows;

  @override
  void initState() {
    super.initState();
    // Initialize selectedRows with false for each row
    selectedRows = List.generate(10, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: DataTable(
        headingRowHeight: 66,
        dataRowHeight: (1533 - 66) / 10,
        showCheckboxColumn: true,
        headingRowColor:
            MaterialStateColor.resolveWith((states) => const Color(0xFFFFB900)),
        columns: [
          DataColumn(
            label: Checkbox(
              side: const BorderSide(color: Colors.white),
              checkColor: Colors.white,
              activeColor: const Color(0xFFFFB900),
              value: selectedRows.every((isSelected) => isSelected == true),
              onChanged: (value) {
                setState(() {
                  selectedRows = List.generate(10, (index) => value!);
                });
              },
            ),
          ),
          const DataColumn(
            label: Flexible(
              child: Text(
                'Subject',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const DataColumn(
            label: Flexible(
              child: Text(
                'Order ID',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const DataColumn(
            label: Flexible(
              child: Text(
                'Date Due',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const DataColumn(
            label: Flexible(
              child: Text(
                'Status',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const DataColumn(
            label: Flexible(
              child: Text(
                'User ID',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const DataColumn(
            label: Flexible(
              child: Text(
                'View Task',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const DataColumn(
            label: Flexible(
              child: Text(
                'View Order',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        rows: List<DataRow>.generate(10, (index) {
          return DataRow(
            cells: [
              DataCell(
                Checkbox(
                  side: const BorderSide(color: Color(0xFFFFB900)),
                  checkColor: Colors.white,
                  activeColor: const Color(0xFFFFB900),
                  value: selectedRows[index],
                  onChanged: (value) {
                    setState(() {
                      selectedRows[index] = value!;
                    });
                  },
                ),
              ),
              DataCell(
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 677,
                    minWidth: 677,
                  ),
                  child: Text(
                    _data['Subject']!,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              DataCell(Text(_data['Order ID']!)),
              DataCell(Text(_data['Date Due']!)),
              DataCell(Text(_data['Status']!)),
              DataCell(Text(_data['User ID']!)),
              DataCell(
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              right: -40,
                              top: -40,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Image.asset(
                                  "assets/images/Billing.png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Image.asset(
                    "assets/images/Billing.png",
                  ),
                ),
              ),
              DataCell(
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/Billing.png",
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
