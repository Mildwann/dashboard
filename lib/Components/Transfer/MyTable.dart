import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  const MyTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: MaterialStateColor.resolveWith(
        (states) => Color.fromARGB(255, 248, 248, 248),
      ),
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
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0000000000')),
            DataCell(Text('Xxxxxxxxxxxxx')),
            DataCell(Text('Xxxxxxxxxxxxx xxxxxxxxxxx')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0000000000')),
            DataCell(Text('Xxxxxxxxxxxxx')),
            DataCell(Text('Xxxxxxxxxxxxx xxxxxxxxxxx')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0000000000')),
            DataCell(Text('Xxxxxxxxxxxxx')),
            DataCell(Text('Xxxxxxxxxxxxx xxxxxxxxxxx')),
          ],
        ),
      ],
    );
  }
}
