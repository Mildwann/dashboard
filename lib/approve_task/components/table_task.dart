// ignore_for_file: use_super_parameters

import 'package:dashbord_flutter/app_injector.dart';
import 'package:dashbord_flutter/approve_task/model/searchInquire_model.dart';
import 'package:dashbord_flutter/approve_task/view_model/searchinquire_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final SearchinquireViewmodel searchinquireViewmodel = getIt();

class TableTask extends StatefulWidget {
  const TableTask({Key? key}) : super(key: key);

  void searchMid(String x, String y, String z) {
    searchinquireViewmodel.getSearch2(x, y, z);
  }

  @override
  State<TableTask> createState() => _TableTaskState();
}

class _TableTaskState extends State<TableTask> {
  late List<bool> selectedRows;

  @override
  void initState() {
    searchinquireViewmodel.getSearchBase();
    super.initState();
    selectedRows = List.generate(10, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => searchinquireViewmodel,
        builder: (context, _) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Consumer<SearchinquireViewmodel>(
                builder: (context, viewModel, _) {
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
                rows: List<DataRow>.generate(
                    searchinquireViewmodel.item!.length, (index) {
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
                            maxWidth: 500,
                            minWidth: 500,
                          ),
                          child: Text(
                            searchinquireViewmodel.item![index].subject!,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                          Text(searchinquireViewmodel.item![index].orderId!)),
                      DataCell(
                          Text(searchinquireViewmodel.item![index].dueDate!)),
                      DataCell(Text(searchinquireViewmodel
                          .item![index].approvalStatusValueStr!)),
                      DataCell(Text(searchinquireViewmodel.item![index].caId!)),
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
                            "assets/images/document.png",
                          ),
                        ),
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/document.png",
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              );
            }),
          );
        });
  }
}
