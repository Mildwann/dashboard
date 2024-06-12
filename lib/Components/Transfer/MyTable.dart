import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTable extends StatefulWidget {
  const MyTable({super.key});

  @override
  State<MyTable> createState() => _MyTableState();
}

int list = 10;
List<Color> rowColors = List<Color>.generate(list, (index) => Colors.white);
List<bool> showIcon = List<bool>.generate(list, (index) => false);

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DataTable(
      headingRowHeight: 55,
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => Color.fromARGB(255, 248, 248, 248)),
      showCheckboxColumn: false,
      dataRowHeight: 41.66,
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Employee ID',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Full Name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Department',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        list,
        (index) => DataRow(
          color: MaterialStateProperty.resolveWith((states) {
            return rowColors[index];
          }),
          onSelectChanged: (value) {
            setState(() {
              rowColors[index] = rowColors[index] == Colors.white
                  ? Color.fromRGBO(252, 182, 0, 0.03)
                  : Colors.white;
              showIcon[index] = !showIcon[index];
            });
          },
          cells: <DataCell>[
            DataCell(
              Container(
                width: double.infinity,
                child: Text('0000000000'),
              ),
            ),
            DataCell(
              Container(
                width: double.infinity,
                child: Text('0000000000'),
              ),
            ),
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: width * 0.25),
                    child: const Text(
                      'Xxxxxxxxxxxxx xxxxxxxxxxx',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  showIcon[index]
                      ? const SizedBox(
                          width: 20,
                          child: Icon(
                            Icons.check,
                            color: Color.fromARGB(255, 254, 207, 0),
                          ))
                      : Container(
                          width: 20,
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
