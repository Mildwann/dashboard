// ignore_for_file: use_super_parameters, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/approve_view_model.dart';

class TableTask extends StatefulWidget {
  ApproveViewModel approveViewModel;
  TableTask(this.approveViewModel, {super.key});

  @override
  State<TableTask> createState() => _TableTaskState();
}

class _TableTaskState extends State<TableTask> {
  late List<bool> selectedRows;

  @override
  void initState() {
    widget.approveViewModel.getSearchBase();
    selectedRows = List.generate(10, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: widget.approveViewModel,
        builder: (context, _) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Consumer<ApproveViewModel>(builder: (context, viewModel, _) {
              return DataTable(
                headingRowHeight: 66,
                dataRowHeight: (1533 - 66) / 10,
                showCheckboxColumn: true,
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => const Color(0xFFFFB900)),
                columns: [
                  DataColumn(
                    label: Checkbox(
                      side: const BorderSide(color: Colors.white),
                      checkColor: Colors.white,
                      activeColor: const Color(0xFFFFB900),
                      value: selectedRows
                          .every((isSelected) => isSelected == true),
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
                rows: (widget.approveViewModel.itemSearch ?? []).isEmpty
                    ? [
                        const DataRow(cells: [
                          DataCell(Text("")),
                          DataCell(Text("")),
                          DataCell(Text("")),
                          DataCell(Text("")),
                          DataCell(
                            Center(
                              child: Text(
                                'No data available',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                          DataCell(Text("")),
                          DataCell(Text("")),
                          DataCell(Text("")),
                        ]),
                      ]
                    : widget.approveViewModel.isLoading
                        ? [
                            const DataRow(cells: [
                              DataCell(Text("")),
                              DataCell(Text("")),
                              DataCell(Text("")),
                              DataCell(Text("")),
                              DataCell(
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              DataCell(Text("")),
                              DataCell(Text("")),
                              DataCell(Text("")),
                            ]),
                          ]
                        : List<DataRow>.generate(
                            widget.approveViewModel.itemSearch!.length,
                            (index) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Checkbox(
                                      side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 150, 145, 132),
                                      ),
                                      checkColor: Colors.white,
                                      activeColor: const Color(0xFFFFB900),
                                      value: selectedRows[index],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedRows[index] = value ?? false;
                                        });
                                        widget.approveViewModel.setSelected(
                                          index,
                                          value ?? false,
                                        );
                                        print(selectedRows.toString());
                                      },
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 500,
                                        minWidth: 500,
                                      ),
                                      child: Text(
                                        widget.approveViewModel
                                            .itemSearch![index].subject!,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(widget.approveViewModel
                                        .itemSearch![index].orderId!),
                                  ),
                                  DataCell(
                                    Text(widget.approveViewModel
                                        .itemSearch![index].dueDate!),
                                  ),
                                  DataCell(
                                    Text(widget
                                        .approveViewModel
                                        .itemSearch![index]
                                        .approvalStatusValueStr!),
                                  ),
                                  DataCell(
                                    Text(widget.approveViewModel
                                        .itemSearch![index].caId!),
                                  ),
                                  DataCell(
                                    IconButton(
                                      onPressed: () {
                                        // Handle button press action
                                      },
                                      icon: Image.asset(
                                        "assets/images/document.png",
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    IconButton(
                                      onPressed: () {
                                        // Handle button press action
                                      },
                                      icon: Image.asset(
                                        "assets/images/document.png",
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
              );
            }),
          );
        });
  }
}
